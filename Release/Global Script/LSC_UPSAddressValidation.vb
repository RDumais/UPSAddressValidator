Imports System
Imports System.IO
Imports System.Net
Imports System.Text
Imports System.Xml
Imports Mongoose.IDO.Protocol
Imports Mongoose.Scripting

Namespace Mongoose.GlobalScripts
    Public Class LSC_UPSAddressValidation
        Inherits GlobalScript

        Sub Main()

            'Global variables
            Dim countryName As String = "US" 'Hardcode in country as UPS only accepts this value.
            Dim streetNameOne As String = GetParameter(0)
            Dim streetNameTwo As String = GetParameter(1)
            Dim streetNameThree As String = GetParameter(2)
            Dim streetNameFour As String = GetParameter(3)
            Dim cityName As String = GetParameter(4)
            Dim stateName As String = GetParameter(5)
            Dim zipCode As String = GetParameter(6)
            Dim countryValue As String = GetParameter(7)
            Dim streetOneComponentName As String = GetParameter(8)
            Dim streetTwoComponentName As String = GetParameter(9)
            Dim streetThreeComponentName As String = GetParameter(10)
            Dim streetFourComponentName As String = GetParameter(11)
            'Result variables which will be changed throughout program.
            Dim resultAddressValue = ""
            Dim resultCityValue = ""
            Dim resultStateValue = ""
            Dim resultZipCodeValue = ""
            Dim resultZipCodeExtendedValue = ""
            Dim resultCountryValue = ""
            'Create arrays for the possible entries in address fields.
            Dim streetName As String() = {GetParameter(0), GetParameter(1), GetParameter(2), GetParameter(3)}
            Dim streetComponentName As String() = {GetParameter(8), GetParameter(9), GetParameter(10), GetParameter(11)}

            'If user is attempting to validate an address outside of USA, stop immediately. UPS does not support international address validation.
            If Not countryValue = "USA" Then
                Dim invalidCountry As String = "Address validation is only available for the United States."
                ThisForm.CallGlobalScript("MsgApp", "Clear", "OK -W", "ReturnAction", "m%1", invalidCountry, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "")
				Exit Sub
            End If

            'Main program loop
            Dim element
            Dim i = -1
            Dim status = "Invalid"
            For Each element In streetName

                'Check if address field is null before continuing.
                If element = "" Then
                    Continue For
                End If

                'Increment array's address field to validate.
                i = i + 1

                'Build the request using submitted values.
                Dim requestString = buildRequest(element, cityName, stateName, zipCode, countryName)

                'Send the constructed request to UPS.
                Dim responseFromServer = getResponse(requestString)

                'Get the validity of the address. (Valid, Invalid, or Ambiguous)
                status = parseXML(responseFromServer, resultAddressValue, resultCityValue, resultStateValue, resultZipCodeValue, resultZipCodeExtendedValue, resultCountryValue)

                'Keep looping through to find an invalid address.
                If status = "Valid" Or status = "Ambiguous" Then
                    Exit For
                End If

            Next element

            'Let the user know the status of address validity.
            If status = "Invalid" Or status = "Ambiguous" Then
                promptUser(status, streetName(i), cityName, stateName, zipCode, resultAddressValue, resultCityValue, resultStateValue, resultZipCodeValue, resultZipCodeExtendedValue)
            Else
                'If the address is valid, go to formatting procedure.
                formatData(streetComponentName(i), resultAddressValue, resultCityValue, resultStateValue, resultZipCodeValue, resultZipCodeExtendedValue)
            End If

        End Sub

        Function buildRequest(ByRef streetName As String, ByRef cityName As String, ByRef stateName As String, ByRef zipCode As String, ByRef countryName As String)

            'Load IDO collection from the Address Validator Parameters form.
            Dim oRequestLCRD As LoadCollectionResponseData
            oRequestLCRD = IDOClient.LoadCollection("LSC_UPSAddrValidations" _
            , "Username,Password,APIKey,XMLTemplateHeader,XMLTemplateBody" _
            , "" _
            , "" _
            , 1)

            'Create two strings for header and body of request.
            Dim requestToServerHeader As String = oRequestLCRD(0, "XMLTemplateHeader").Value
            Dim requestToServerBody As String = oRequestLCRD(0, "XMLTemplateBody").Value

            'Create XmlDocument for the request.
            Dim requestHeadDoc = New XmlDocument()
            requestHeadDoc.LoadXml(requestToServerHeader)
            'Create XmlDocument for the request.
            Dim requestBodyDoc = New XmlDocument()
            requestBodyDoc.LoadXml(requestToServerBody)

            'Declare XML nodes and fill nodes with address information from form. (Header)
            Dim requestAPIKey As XmlNode = requestHeadDoc.SelectSingleNode("AccessRequest/AccessLicenseNumber")
            requestAPIKey.InnerXml = oRequestLCRD(0, "APIKey").Value
            Dim requestUsername As XmlNode = requestHeadDoc.SelectSingleNode("AccessRequest/UserId")
            requestUsername.InnerXml = oRequestLCRD(0, "Username").Value
            Dim requestPassword As XmlNode = requestHeadDoc.SelectSingleNode("AccessRequest/Password")
            requestPassword.InnerXml = oRequestLCRD(0, "Password").Value

            'Declare XML nodes and fill nodes with address information from form. (Body)
            Dim requestAddress As XmlNode = requestBodyDoc.SelectSingleNode("AddressValidationRequest/AddressKeyFormat/AddressLine")
            requestAddress.InnerXml = streetName
            Dim requestCity As XmlNode = requestBodyDoc.SelectSingleNode("AddressValidationRequest/AddressKeyFormat/PoliticalDivision2")
            requestCity.InnerXml = cityName
            Dim requestState As XmlNode = requestBodyDoc.SelectSingleNode("AddressValidationRequest/AddressKeyFormat/PoliticalDivision1")
            requestState.InnerXml = stateName
            Dim requestZipCode As XmlNode = requestBodyDoc.SelectSingleNode("AddressValidationRequest/AddressKeyFormat/PostcodePrimaryLow")
            requestZipCode.InnerXml = zipCode
            Dim requestCountry As XmlNode = requestBodyDoc.SelectSingleNode("AddressValidationRequest/AddressKeyFormat/CountryCode")
            requestCountry.InnerXml = countryName

            'Combine seperate XML documents into a final document to send to UPS.
            Dim combinedDocuments As String = requestHeadDoc.InnerXml & requestBodyDoc.InnerXml

            Return combinedDocuments

        End Function

        Function getResponse(ByRef requestString As String)

            'Create a request using a URL that can receive a post. 
            Dim request As WebRequest = WebRequest.Create("https://onlinetools.ups.com/ups.app/xml/XAV")
            request.Method = "POST"

            'Load the final completed template into an array for processing.
            Dim byteArray As Byte() = Encoding.UTF8.GetBytes(requestString)
            request.ContentType = "application/x-www-form-urlencoded"
            request.ContentLength = byteArray.Length

            'Get the request stream.
            Dim dataStream As Stream = request.GetRequestStream()

            'Write the data to the request stream.
            dataStream.Write(byteArray, 0, byteArray.Length)
            dataStream.Close()

            'Get the response.
            Dim response As WebResponse = request.GetResponse()

            'Get the stream containing content returned by the server.
            dataStream = response.GetResponseStream()
            Dim reader As New StreamReader(dataStream)
            Dim responseFromServer As String = reader.ReadToEnd()

            'Clean up the streams.
            reader.Close()
            dataStream.Close()
            response.Close()

            Return responseFromServer

        End Function
		
        Function parseXML(ByRef responseFromServer As String, ByRef resultAddressValue As String, ByRef resultCityValue As String,
                          ByRef resultStateValue As String, ByRef resultZipCodeValue As String, ByRef resultZipCodeExtendedValue As String,
                          ByRef resultCountryValue As String)

            'Treat responseFromServer as an XML Document.
            Dim responseXML = New XmlDocument()
            responseXML.LoadXml(responseFromServer)

            'Declare values based on the server's response.
            Dim resultAddress As XmlNodeList = responseXML.GetElementsByTagName("AddressLine")
            Dim resultCity As XmlNodeList = responseXML.GetElementsByTagName("PoliticalDivision2")
            Dim resultState As XmlNodeList = responseXML.GetElementsByTagName("PoliticalDivision1")
            Dim resultZipCode As XmlNodeList = responseXML.GetElementsByTagName("PostcodePrimaryLow")
            Dim resultZipCodeExtended As XmlNodeList = responseXML.GetElementsByTagName("PostcodeExtendedLow")
            Dim resultCountry As XmlNodeList = responseXML.GetElementsByTagName("CountryCode")
            Dim resultValid As XmlNodeList = responseXML.GetElementsByTagName("ValidAddressIndicator")
            Dim resultInvalid As XmlNodeList = responseXML.GetElementsByTagName("NoCandidatesIndicator")
            Dim resultAmbiguous As XmlNodeList = responseXML.GetElementsByTagName("AmbiguousAddressIndicator")
            Dim finalResult As String = ""

            'Set variables from the response. Check if the tags from XML are available incase response is invalid.
            If resultAddress.Count > 0 Then
                resultAddressValue = resultAddress(0).InnerText
            End If
            If resultCity.Count > 0 Then
                resultCityValue = resultCity(0).InnerText
            End If
            If resultState.Count > 0 Then
                resultStateValue = resultState(0).InnerText
            End If
            If resultZipCode.Count > 0 Then
                resultZipCodeValue = resultZipCode(0).InnerText
            End If
            If resultZipCodeExtended.Count > 0 Then
                resultZipCodeExtendedValue = resultZipCodeExtended(0).InnerText
            End If
            If resultCountry.Count > 0 Then
                resultCountryValue = resultCountry(0).InnerText
            End If

            'Determine the validity of the address.
            If resultValid.Count > 0 Then
                finalResult = "Valid"
            ElseIf resultInvalid.Count > 0 Then
                finalResult = "Invalid"
            ElseIf resultAmbiguous.Count > 0 Then
                finalResult = "Ambiguous"
            End If

            Return finalResult

        End Function

        Sub formatData(ByRef streetComponentName As String, ByRef resultAddressValue As String, ByRef resultCityValue As String,
                       ByRef resultStateValue As String, ByRef resultZipCodeValue As String, ByRef resultZipCodeExtendedValue As String)

            Dim cityComponentName As String = GetParameter(12)
            Dim stateComponentName As String = GetParameter(13)
            Dim zipCodeComponentName As String = GetParameter(14)
            Dim format As String
            Dim validText As String = "The entered address is valid."

            If ThisForm.Components(streetComponentName).Enabled Or ThisForm.Components(cityComponentName).Enabled _
            Or ThisForm.Components(stateComponentName).Enabled Or ThisForm.Components(zipCodeComponentName).Enabled Then
                'Prompt the user if we should format the valid address.
                format = ThisForm.CallGlobalScript("MsgApp", "Clear", "Yes|No", "SuccessFailure", "m%1", validText + " Would you like to format the address to UPS standards?", "",
                                                   "", "", "", "", "", "", "", "", "", "", "", "", "", "")
            Else
                ThisForm.CallGlobalScript("MsgApp", "Clear", "OK -Q", "ReturnAction", "m%1", validText, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "")
            End If




            'If the user wants to format the address, proceed.
            If format = 0 Then



                'Check if each field is read only, if not format and mark the component as modified.
                If ThisForm.Components(streetComponentName).Enabled Then
                    ThisForm.Components(streetComponentName).SetValue(resultAddressValue)
                    ThisForm.PrimaryIDOCollection.SetCurrentObjectModified(True)
                End If
                If ThisForm.Components(cityComponentName).Enabled Then
                    ThisForm.Components(cityComponentName).SetValue(resultCityValue)
                    ThisForm.PrimaryIDOCollection.SetCurrentObjectModified(True)
                End If
                If ThisForm.Components(stateComponentName).Enabled Then
                    ThisForm.Components(stateComponentName).SetValue(resultStateValue)
                    ThisForm.PrimaryIDOCollection.SetCurrentObjectModified(True)
                End If
                If ThisForm.Components(zipCodeComponentName).Enabled Then
                    ThisForm.Components(zipCodeComponentName).SetValue(resultZipCodeValue & "-" & resultZipCodeExtendedValue)
                    ThisForm.PrimaryIDOCollection.SetCurrentObjectModified(True)
                End If

            End If

        End Sub

        Sub promptUser(ByRef status As String, ByRef streetName As String, ByRef cityName As String, ByRef stateName As String,
                       ByRef zipCode As String, ByRef resultAddressValue As String, ByRef resultCityValue As String,
                       ByRef resultStateValue As String, ByRef resultZipCodeValue As String, ByRef resultZipCodeExtendedValue As String)

            'Logic for determining what action to take depending on response's status.
            If status = "Ambiguous" Then
                'If response is ambiguous prompt the user with the fields that are conflicting with the validated address from UPS.
                Dim ambiguousText As String = "The entered address could not validated as it is ambiguous. The address may be correct, but please verify the following fields:" _
                & Environment.NewLine

                If Not String.Compare(streetName, resultAddressValue, True) = 0 Then
                    ambiguousText = ambiguousText & Environment.NewLine & "Address"
                End If
                If Not String.Compare(cityName, resultCityValue, True) = 0 Then
                    ambiguousText = ambiguousText & Environment.NewLine & "City"
                End If
                If Not String.Compare(stateName, resultStateValue, True) = 0 Then
                    ambiguousText = ambiguousText & Environment.NewLine & "State"
                End If
                If Not String.Compare(zipCode, resultZipCodeValue, True) = 0 And Not String.Compare(zipCode, resultZipCodeValue & "-" & resultZipCodeExtendedValue, True) = 0 Then
                    ambiguousText = ambiguousText & Environment.NewLine & "ZIP Code"
                End If
                ThisForm.CallGlobalScript("MsgApp", "Clear", "OK -W", "ReturnAction", "m%1", ambiguousText, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "")

            ElseIf status = "Invalid" Then
                'If response is invalid then prompt the user.
                Dim invalidText As String = "The entered address is not valid."
                ThisForm.CallGlobalScript("MsgApp", "Clear", "OK -W", "ReturnAction", "m%1", invalidText, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "")

            End If
        End Sub

    End Class
End Namespace

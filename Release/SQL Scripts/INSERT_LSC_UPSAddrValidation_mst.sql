-- SETSITE Snippet
DECLARE @SiteName SiteType
 , @Infobar InfobarType
SELECT TOP 1
         @SiteName = [site].[site]
FROM     [site]
EXEC [dbo].[SetSiteSp] @SiteName, @Infobar OUTPUT

INSERT INTO LSC_UPSAddrValidation_mst (Username, Password, APIKey, XMLTemplateHeader, XMLTemplateBody)
VALUES ('USERNAMEHERE', 'PASSWORDHERE', 'APIKEYHERE',
'<?xml version="1.0" ?>
<AccessRequest xml:lang=''en-US''>
	<AccessLicenseNumber></AccessLicenseNumber>
	<UserId></UserId>
	<Password></Password>
</AccessRequest>',
'<?xml version="1.0" ?>
<AddressValidationRequest xml:lang=''en-US''>
	<Request>
		<RequestAction>XAV</RequestAction>
		<RequestOption>1</RequestOption>
	</Request>
	<AddressKeyFormat>
		<AddressLine></AddressLine>
		<Region></Region>
		<PoliticalDivision2></PoliticalDivision2>
		<PoliticalDivision1></PoliticalDivision1>
		<PostcodePrimaryLow></PostcodePrimaryLow>
		<CountryCode></CountryCode> 
	</AddressKeyFormat>
</AddressValidationRequest>')





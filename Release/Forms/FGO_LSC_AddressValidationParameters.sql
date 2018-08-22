-------------------------------------------------------------------------------
-- SQL Script generated by FormSync 9.3.0.37 as of 11/1/2017 5:01 PM
-- Source Configuration: LSC_FORMS_PLT
-- Objects scripted:
--   Form: LSC_AddressValidationParameters 
--      Components: APIKeyEdit, APIKeyStatic, PasswordEdit, PasswordStatic, UsernameEdit,
--         UsernameStatic, XMLTemplateBodyMultiline, XMLTemplateBodyStatic, XMLTemplateHeaderMultiline,
--         XMLTemplateHeaderStatic
--      Variables: fds_DataSource, InitialCommand
--      ActiveXScripts: LSC_AddressValidationParameters
--   Strings: fLSC_AddressValidationParameters, sLSC_APIKey,
--      sLSC_Password, sLSC_Username, sLSC1154_XMLTemplateBodyStatic,
--      sLSC1154_XMLTemplateHeaderStatic
-------------------------------------------------------------------------------
DECLARE @FormID INT
SET @FormID = NULL
SELECT @FormID = Forms.ID FROM Forms WHERE [Name] = N'LSC_AddressValidationParameters' AND [ScopeType] = 1
IF @FormID IS NOT NULL
BEGIN
   DELETE FROM Forms WHERE ID = @FormID
   DELETE FROM FormEventHandlers WHERE FormID = @FormID
   DELETE FROM FormComponents WHERE FormID = @FormID
   DELETE FROM ActiveXComponentProperties WHERE FormID = @FormID
   DELETE FROM Variables WHERE FormID = @FormID
   DELETE FROM FormComponentDragDropEvents WHERE FormID = @FormID
   DELETE FROM DerivedFormOverrides WHERE FormID = @FormID
   DELETE FROM ActiveXScripts WHERE [Name] = N'LSC_AddressValidationParameters' AND [ScopeType] = 1
   DELETE FROM ActiveXScriptLines WHERE [ScriptName] = N'LSC_AddressValidationParameters' AND [ScopeType] = 1
END
INSERT INTO [Forms] (
  [ScopeType], [ScopeName], [Component], [Name], [SubComponent], [Type], [Caption], 
  [PrimaryDataSource], 
  [StandardOperations], [TopPos], [LeftPos], [Height], [Width], [IconFileName], [HelpFileName], [HelpContextID], [Flags], [LockedBy], 
  [FilterFormSpec], [PaneZeroSize], [Description], [MasterDeviceID], [BaseFormName] ) 
VALUES ( 
  1, N'[NULL]', NULL, N'LSC_AddressValidationParameters', NULL, 0, N'fLSC_AddressValidationParameters', 
  N'V(fds_DataSource)', 
  825, CAST('0' AS float), CAST('0' AS float), CAST('26' AS float), CAST('120' AS float), NULL, NULL, -1, 8, NULL, 
  NULL, N'0', NULL, 0, NULL)
SELECT @FormID = Forms.ID FROM Forms WHERE [Name] = N'LSC_AddressValidationParameters' AND [ScopeType] = 1
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID, N'APIKeyEdit', -1, 
  1, 1, CAST('5.1764705880364783' AS float), CAST('13.125' AS float), CAST('1.2941176470588236' AS float), CAST('0' AS float), CAST('30.75' AS float), N'C(APIKeyStatic)', 
  NULL, 
  NULL, 0, N'object.APIKey', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, N'StdDefault', 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'C(APIKeyStatic)', NULL )
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID, N'APIKeyStatic', -1, 
  0, 0, CAST('5.35294117627177' AS float), CAST('5.875' AS float), CAST('1' AS float), CAST('0' AS float), CAST('6.25' AS float), N'sLSC_APIKey', 
  NULL, 
  NULL, 0, NULL, 
  0, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) JUSTIFY(R)', 
  NULL, N'sLSC_APIKey', NULL )
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID, N'PasswordEdit', -1, 
  3, 1, CAST('3.323529411665298' AS float), CAST('13.125' AS float), CAST('1.2941176470588236' AS float), CAST('0' AS float), CAST('30.75' AS float), N'C(PasswordStatic)', 
  NULL, 
  NULL, 0, N'object.Password', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, N'StdDefault', 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'C(PasswordStatic)', NULL )
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID, N'PasswordStatic', -1, 
  2, 0, CAST('3.4264705882358042' AS float), CAST('5' AS float), CAST('1' AS float), CAST('0' AS float), CAST('7.125' AS float), N'sLSC_Password', 
  NULL, 
  NULL, 0, NULL, 
  0, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) JUSTIFY(R)', 
  NULL, N'sLSC_Password', NULL )
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID, N'UsernameEdit', -1, 
  5, 1, CAST('1.4705882352941178' AS float), CAST('13.125' AS float), CAST('1.2941176470588236' AS float), CAST('0' AS float), CAST('30.75' AS float), N'C(UsernameStatic)', 
  NULL, 
  NULL, 0, N'object.Username', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, N'StdDefault', 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl)', 
  NULL, N'C(UsernameStatic)', NULL )
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID, N'UsernameStatic', -1, 
  4, 0, CAST('1.588235294117647' AS float), CAST('4.625' AS float), CAST('1' AS float), CAST('0' AS float), CAST('7.5' AS float), N'sLSC_Username', 
  NULL, 
  NULL, 0, NULL, 
  0, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) JUSTIFY(R)', 
  NULL, N'sLSC_Username', NULL )
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID, N'XMLTemplateBodyMultiline', -1, 
  8, 18, CAST('11' AS float), CAST('54.75' AS float), CAST('14.529411764705882' AS float), CAST('0' AS float), CAST('56.25' AS float), N'C(XMLTemplateBodyStatic)', 
  NULL, 
  NULL, 0, N'object.XMLTemplateBody', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'FONT(10,0,0,0,0,0,0,0,1,0,0,0,0,Agency FB) AUTOIME(NoControl)', 
  NULL, N'C(XMLTemplateBodyStatic)', NULL )
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID, N'XMLTemplateBodyStatic', -1, 
  9, 0, CAST('9.7058823529411757' AS float), CAST('76.3125' AS float), CAST('1.3529411764705883' AS float), CAST('0' AS float), CAST('13.125' AS float), N'sLSC1154_XMLTemplateBodyStatic', 
  NULL, 
  NULL, 0, NULL, 
  0, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  16, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) JUSTIFY(R)', 
  NULL, N'sLSC1154_XMLTemplateBodyStatic', NULL )
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID, N'XMLTemplateHeaderMultiline', -1, 
  7, 18, CAST('1.9411764705882353' AS float), CAST('54.75' AS float), CAST('7.2352941176470589' AS float), CAST('0' AS float), CAST('56.25' AS float), N'C(XMLTemplateHeaderStatic)', 
  NULL, 
  NULL, 0, N'object.XMLTemplateHeader', 
  1, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'FONT(10,0,0,0,0,0,0,0,1,0,0,0,0,Agency FB) AUTOIME(NoControl)', 
  NULL, N'C(XMLTemplateHeaderStatic)', NULL )
INSERT INTO FormComponents (
  [FormID], [Name], [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos],[Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID, N'XMLTemplateHeaderStatic', -1, 
  6, 0, CAST('0.6470588235294118' AS float), CAST('75.5625' AS float), CAST('1' AS float), CAST('0' AS float), CAST('14.625' AS float), N'sLSC1154_XMLTemplateHeaderStatic', 
  NULL, 
  NULL, 0, NULL, 
  0, NULL, NULL, NULL, NULL, NULL, 
  NULL, 
  16, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, 
  NULL, NULL, NULL, 
  N'0', NULL, NULL, NULL, NULL, 
  NULL, N'AUTOIME(NoControl) JUSTIFY(R)', 
  NULL, N'sLSC1154_XMLTemplateHeaderStatic', NULL )
INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (@FormID, N'fds_DataSource', 1, N'[NULL]', N'LSC_UPSAddrValidations( OBJNAME(oLSC_UPSAddrValidations) )', NULL, NULL, NULL, NULL)
INSERT INTO Variables ( [FormID], [Name], [ScopeType], [ScopeName], [Value], [Value2], [Value3], [LockedBy], [Description] ) 
VALUES (@FormID, N'InitialCommand', 1, N'[NULL]', N'Refresh', NULL, NULL, NULL, NULL)
INSERT INTO ActiveXScripts ([Name], [ScopeType], [ScopeName], [LockedBy], [Language]) VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', NULL, N'Visual Basic')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 0, N'Option Explicit On')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 1, N'Option Strict On')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 2, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 3, N'Imports System')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 4, N'Imports Microsoft.VisualBasic')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 5, N'Imports Mongoose.IDO.Protocol')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 6, N'Imports Mongoose.Scripting')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 7, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 8, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 9, N'Namespace Mongoose.FormScripts')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 10, N'Public Class LSC_AddressValidationParameters')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 11, N'Inherits FormScript')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 12, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 13, N'        Sub Test()')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 14, N'            MsgBox(String.Format(ThisForm.Components("XMLStaticTemplate").Value, ThisForm.Components("APIKeyEdit").Value))')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 15, N'        End Sub')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 16, NULL)
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 17, N'    End Class')
INSERT INTO ActiveXScriptLines ([ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine])
VALUES (N'LSC_AddressValidationParameters', 1, N'[NULL]', 18, N'End Namespace')
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'fLSC_AddressValidationParameters' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 
INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'fLSC_AddressValidationParameters', N'Address Validation Parameters', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLSC_APIKey' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 
INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLSC_APIKey', N'API Key', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLSC_Password' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 
INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLSC_Password', N'Password', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLSC_Username' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 
INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLSC_Username', N'Username', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLSC1154_XMLTemplateBodyStatic' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 
INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLSC1154_XMLTemplateBodyStatic', N'XMLTemplate Body', NULL, NULL, 1, N'[NULL]', NULL)
-------------------------------------------------------------------------------
DELETE FROM [Strings] WHERE [Name] = N'sLSC1154_XMLTemplateHeaderStatic' AND [ScopeType] = 1 AND [ScopeName] = N'[NULL]' 
INSERT INTO [Strings] ([Name], [String], [String2], [String3], [ScopeType], [ScopeName], [LockedBy] ) 
VALUES (N'sLSC1154_XMLTemplateHeaderStatic', N'XMLTemplate Header', NULL, NULL, 1, N'[NULL]', NULL)
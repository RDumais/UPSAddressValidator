/****** Object:  View [dbo].[LSC_UPSAddrValidation]    Script Date: 11/3/2017 11:41:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[LSC_UPSAddrValidation]
AS SELECT [CreatedBy],[UpdatedBy],[CreateDate],[RecordDate],[RowPointer],[NoteExistsFlag],[InWorkflow],[Username],[Password],[APIKey],[XMLTemplateHeader],[XMLTemplateBody]
FROM [LSC_UPSAddrValidation_mst]
            WHERE [SiteRef] = CAST(CONTEXT_INFO() AS NVARCHAR(8))
GO



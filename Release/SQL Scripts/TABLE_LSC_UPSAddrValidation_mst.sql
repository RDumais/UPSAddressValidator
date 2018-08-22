/****** Object:  Table [dbo].[LSC_UPSAddrValidation_mst]    Script Date: 11/3/2017 11:40:13 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LSC_UPSAddrValidation_mst](
	[CreatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_LSC_UPSAddrValidation_mst_CreatedBy]  DEFAULT (SUSER_SNAME()),
	[UpdatedBy] [dbo].[UsernameType] NOT NULL CONSTRAINT [DF_LSC_UPSAddrValidation_mst_UpdatedBy]  DEFAULT (SUSER_SNAME()),
	[CreateDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_LSC_UPSAddrValidation_mst_CreateDate]  DEFAULT (GETDATE()),
	[RecordDate] [dbo].[CurrentDateType] NOT NULL CONSTRAINT [DF_LSC_UPSAddrValidation_mst_RecordDate]  DEFAULT (GETDATE()),
	[RowPointer] [dbo].[RowPointerType] NOT NULL CONSTRAINT [DF_LSC_UPSAddrValidation_mst_RowPointer]  DEFAULT (NEWID()),
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_LSC_UPSAddrValidation_mst_NoteExistsFlag]  DEFAULT ((0)),
	[InWorkflow] [dbo].[FlagNyType] NOT NULL CONSTRAINT [DF_LSC_UPSAddrValidation_mst_InWorkflow]  DEFAULT ((0)),
	[SiteRef] [dbo].[SiteType] NOT NULL CONSTRAINT [DF_LSC_UPSAddrValidation_mst_SiteRef]  DEFAULT (RTRIM(CONVERT([NVARCHAR](8),CONTEXT_INFO(),(0)))),
	[Username] [NVARCHAR](16) NOT NULL,
	[Password] [NVARCHAR](30) NOT NULL,
	[APIKey] [NVARCHAR](30) NOT NULL,
	[XMLTemplateHeader] [NVARCHAR](2048) NOT NULL,
	[XMLTemplateBody] [NVARCHAR](2048) NOT NULL,
 CONSTRAINT [IX_LSC_UPSAddrValidation_mst_RowPointer] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO



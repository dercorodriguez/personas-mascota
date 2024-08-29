USE [david_rodriguez]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[persona_mascota](
	[id_persona] [int] NOT NULL,
	[id_mascota] [int] NOT NULL,
	[estado] [varchar](1) NOT NULL,
 CONSTRAINT [PK_persona_mascota] PRIMARY KEY CLUSTERED 
(
	[id_persona] ASC,
	[id_mascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[persona_mascota] ADD  CONSTRAINT [DF_persona_mascota_estado]  DEFAULT ('A') FOR [estado]
GO



USE [david_rodriguez]
GO

/****** Object:  Table [dbo].[personas]    Script Date: 28/08/2024 13:51:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[personas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo_identificacion] [varchar](1) NOT NULL,
	[identificacion] [varchar](13) NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[estatura] [float] NULL,
	[nacionalidad] [varchar](20) NOT NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [varchar](15) NULL,
	[estado] [varchar](1) NOT NULL,
 CONSTRAINT [PK_personas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[personas] ADD  CONSTRAINT [DF_personas_tipo_identificacion]  DEFAULT ('C') FOR [tipo_identificacion]
GO

ALTER TABLE [dbo].[personas] ADD  CONSTRAINT [DF_personas_nacionalidad]  DEFAULT ('EC') FOR [nacionalidad]
GO

ALTER TABLE [dbo].[personas] ADD  CONSTRAINT [DF_personas_estado]  DEFAULT ('A') FOR [estado]
GO



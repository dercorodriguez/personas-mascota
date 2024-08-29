USE [david_rodriguez]
GO

/****** Object:  Table [dbo].[raza]    Script Date: 28/08/2024 10:51:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[raza](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_especie] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estado] [varchar](1) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[raza] ADD  CONSTRAINT [DF_raza_estado]  DEFAULT ('A') FOR [estado]
GO

ALTER TABLE [dbo].[raza]  WITH CHECK ADD  CONSTRAINT [FK_raza_especie] FOREIGN KEY([id_especie])
REFERENCES [dbo].[especie] ([id])
GO

ALTER TABLE [dbo].[raza] CHECK CONSTRAINT [FK_raza_especie]
GO



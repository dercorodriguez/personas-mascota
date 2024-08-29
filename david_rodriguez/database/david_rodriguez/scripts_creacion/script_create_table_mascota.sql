USE david_rodriguez
GO

/****** Object:  Table dbo.mascota    Script Date: 28/08/2024 11:20:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.mascota(
	id int IDENTITY(1,1) NOT NULL,
	id_especie int NOT NULL,
	id_raza int NOT NULL,
	color varchar(20) NULL,
	nombre varchar(50) NULL,
	publicar bit NULL,
	estado varchar(1) NOT NULL,
 CONSTRAINT PK_mascosa PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON PRIMARY
) ON PRIMARY
GO

ALTER TABLE dbo.mascota ADD  CONSTRAINT DF_mascota_estado  DEFAULT ('A') FOR estado
GO



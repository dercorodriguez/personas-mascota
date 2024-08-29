USE david_rodriguez
GO

begin transaction
BEGIN TRY
	INSERT INTO dbo.raza
			   (id_especie, nombre, estado)
	VALUES (1, 'Terrier australiano', 'A');
	INSERT INTO dbo.raza
			   (id_especie, nombre, estado)
	VALUES (1, 'Rootweiler', 'A');	
	INSERT INTO dbo.raza
			   (id_especie, nombre, estado)
	VALUES (1, 'Utonagan', 'A');	
	INSERT INTO dbo.raza
			   (id_especie, nombre, estado)
	VALUES (1, 'Sabueso estirio de pelo áspero', 'A');		
	INSERT INTO dbo.raza
			   (id_especie, nombre, estado)
	VALUES (1, 'Bóxer', 'A');		
	INSERT INTO dbo.raza
			   (id_especie, nombre, estado)
	VALUES (1, 'Pastor alemán', 'A');		
	INSERT INTO dbo.raza
			   (id_especie, nombre, estado)
	VALUES (1, 'American english coonhound', 'A');		
	INSERT INTO dbo.raza
			   (id_especie, nombre, estado)
	VALUES (1, 'Azawakh', 'A');		
	INSERT INTO dbo.raza
			   (id_especie, nombre, estado)
	VALUES (1, 'Dóberman pinscher', 'A');		
	INSERT INTO dbo.raza
			   (id_especie, nombre, estado)
	VALUES (1, 'Gordon setter o setter escocés', 'A');		
	INSERT INTO dbo.raza
			   (id_especie, nombre, estado)
	VALUES (1, 'Podenco ibicenco', 'A');		
	INSERT INTO dbo.raza
			   (id_especie, nombre, estado)
	VALUES (1, 'Podenco ibicenco', 'A');		
	INSERT INTO dbo.raza
			   (id_especie, nombre, estado)
	VALUES (1, 'Thai ridgeback', 'A');		
	INSERT INTO dbo.raza
			   (id_especie, nombre, estado)
	VALUES (1, 'Gordon setter o setter escocés', 'A');		
	INSERT INTO dbo.raza
			   (id_especie, nombre, estado)
	VALUES (1, 'Braco hungaro o vizsla', 'A');		
	INSERT INTO dbo.raza
			   (id_especie, nombre, estado)
	VALUES (1, 'Pastor de Brie', 'A');		

	commit transaction
END TRY
BEGIN CATCH
	rollback transaction 
	SELECT ERROR_NUMBER() AS ErrorNumber,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_STATE() AS ErrorState,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;
END CATCH

GO



USE david_rodriguez
GO

begin transaction
BEGIN TRY
	INSERT INTO dbo.especie
			   (nombre
			   ,estado)
	VALUES ('Perro', 'A');

	INSERT INTO dbo.especie
			   (nombre
			   ,estado)
	VALUES ('Gato doméstico', 'A');

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


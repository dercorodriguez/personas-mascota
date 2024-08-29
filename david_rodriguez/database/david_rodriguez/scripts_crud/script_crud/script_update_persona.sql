USE [david_rodriguez]
GO

drop procedure sp_dr_update_persona;
go

/*

declare @cod_error	int = 0
declare @msg_error	varchar(100) = ''

execute sp_dr_update_persona 
1,
1,
'Gris',
'Talento',
1,
'A',
@cod_error	output,
@msg_error	= @msg_error output

select @cod_error, @msg_error


*/

create procedure sp_dr_update_persona
@id						int,
@tipo_identificacion	varchar(1),
@identificacion			varchar(13),
@nombres				varchar(50),
@apellidos				varchar(50),
@fecha_nacimiento		date,
@estatura				float,
@nacionalidad			varchar(20),
@direccion				varchar(50),
@telefono				varchar(15),
@estado					varchar(1),
@cod_error				int output,
@msg_error				varchar(100) output
as
begin
	SET NOCOUNT ON;
	set @cod_error	= 0;
	set @msg_error	= 'OK';

	BEGIN TRY
		begin transaction
		UPDATE [dbo].[personas]
			SET [tipo_identificacion] = @tipo_identificacion
				,[identificacion] = @identificacion
				,[nombres] = @nombres
				,[apellidos] = @apellidos
				,[fecha_nacimiento] = @fecha_nacimiento
				,[estatura] = @estatura
				,[nacionalidad] = @nacionalidad
				,[direccion] = @direccion
				,[telefono] = @telefono
				,[estado] = @estado
			WHERE id = @id

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
end

GO



GO



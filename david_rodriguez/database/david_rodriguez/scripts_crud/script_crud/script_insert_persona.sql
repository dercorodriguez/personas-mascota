USE david_rodriguez
GO


drop procedure sp_dr_insert_persona;
go

/*

declare @cod_error	int = 0
declare @msg_error	varchar(100) = ''

execute sp_dr_insert_mascota 
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

create procedure sp_dr_insert_persona
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
		INSERT INTO dbo.personas
					(tipo_identificacion
					,identificacion
					,nombres
					,apellidos
					,fecha_nacimiento
					,estatura
					,nacionalidad
					,direccion
					,telefono
					,estado)
				VALUES (
					@tipo_identificacion,
					@identificacion,
					@nombres,
					@apellidos,
					@fecha_nacimiento,
					@estatura,
					@nacionalidad,
					@direccion,
					@telefono,
					@estado
					)

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






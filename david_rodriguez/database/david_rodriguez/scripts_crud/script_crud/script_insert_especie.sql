USE david_rodriguez
GO


drop procedure sp_dr_insert_especie;
go

/*

declare @cod_error	int = 0
declare @msg_error	varchar(100) = ''

execute sp_dr_insert_especie 
'gatos',
'A',
@cod_error	output,
@msg_error	= @msg_error output

select @cod_error, @msg_error


*/

create procedure sp_dr_insert_especie
@nombre		varchar(50),
@estado		varchar(1),
@cod_error	int output,
@msg_error	varchar(100) output

as
begin
	SET NOCOUNT ON;
	set @cod_error	= 0;
	set @msg_error	= 'OK';

	BEGIN TRY
		if exists(select 1 from dbo.especie where nombre = @nombre)		 
		begin
			set @cod_error	= 999
			set @msg_error	= 'La especie ya existe'
		end
		else
		begin
			begin transaction
			INSERT INTO dbo.especie
			   (nombre, estado)
			VALUES
			(@nombre, @estado)
			commit transaction
		end
		
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


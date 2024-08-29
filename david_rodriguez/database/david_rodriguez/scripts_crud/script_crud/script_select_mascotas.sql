USE [david_rodriguez]
GO

drop procedure sp_dr_select_mascota
go

/*

declare @cod_error	int = 0
declare @msg_error	varchar(100) = ''

execute sp_dr_select_mascota 
1,
1,
1,
@cod_error	output,
@msg_error	= @msg_error output

select @cod_error, @msg_error

*/

create procedure sp_dr_select_mascota
@id			int,
@id_especie	int,
@id_raza	int = null,
@cod_error	int output,
@msg_error	varchar(100) output
as
begin
	SET NOCOUNT ON;
	set @cod_error	= 0;
	set @msg_error	= 'OK';

	BEGIN TRY
		if not exists(select 1 from dbo.mascota where id = @id)		 
		begin
			set @cod_error	= 999
			set @msg_error	= 'La mascota no existe'
		end
		else
		begin
			Select a.id, a.id_especie, a.id_raza, a.color, a.nombre, a.publicar, a.estado, b.nombre, c.nombre 
			from dbo.mascota a
				inner join dbo.especie b on b.id = a.id_especie
				inner join dbo.raza c on c.id = a.id_raza and c.id_especie = a.id_especie
			where a.id = @id
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



USE [david_rodriguez]
GO

--drop procedure sp_dr_select_all_mascota
go

/*

declare @cod_error	int = 0
declare @msg_error	varchar(100) = ''

execute sp_dr_select_all_mascota 
1,
1,
@cod_error	output,
@msg_error	= @msg_error output


*/

create procedure sp_dr_select_all_mascota
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
		Select a.id, a.id_especie, a.id_raza, a.color, a.nombre, a.publicar, a.estado, b.nombre, c.nombre 
		from dbo.mascota a
			inner join dbo.especie b on b.id = a.id_especie
			inner join dbo.raza c on c.id = a.id_raza and c.id_especie = a.id_especie
		where a.id_especie = @id_especie and a.id_raza = ISNULL(@id_raza, a.id_raza)		
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



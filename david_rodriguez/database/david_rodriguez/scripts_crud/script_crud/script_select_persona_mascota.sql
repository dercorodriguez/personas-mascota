USE david_rodriguez
GO


drop procedure sp_dr_select_persona_mascota;
go

/*

declare @cod_error	int = 0
declare @msg_error	varchar(100) = ''

execute sp_dr_select_persona_mascota 
1,
1,
'A',
@cod_error	output,
@msg_error	= @msg_error output

select @cod_error, @msg_error


*/

create procedure sp_dr_select_persona_mascota
@id_persona	int,
@id_mascota	int,
@estado		varchar(1),
@cod_error	int output,
@msg_error	varchar(100) output
as
begin
	SET NOCOUNT ON;
	set @cod_error	= 0;
	set @msg_error	= 'OK';

	BEGIN TRY
		if not exists(select 1 from dbo.persona_mascota 
			where id_persona = @id_persona)		 
		begin
			set @cod_error	= 999
			set @msg_error	= 'La persona/mascota no existe'
		end
		else
		begin
			begin transaction						
			SELECT a.id_persona, a.id_mascota, a.estado,
				b.nombres, b.apellidos, m.nombre as mascota, e.nombre as especie, r.nombre as raza
			FROM dbo.persona_mascota as a
				inner join personas as b on b.id = a.id_persona
				inner join persona_mascota as pm on pm.id_persona = a.id_persona
				inner join mascota as m on m.id = pm.id_mascota
				inner join especie as e on e.id = m.id_especie
				inner join raza as r on r.id = m.id_raza
			where a.id_persona = @id_persona and m.id = @id_mascota

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



-----------------------------------------------------------------------------
-- PROCEDIMIENTO: SP_SAB_ListarAlertasFull
-- DESCRIPCIÓN: Este procedimiento lista todos los estados y estados de eliminación
--              lógica de las alertas en la tabla tblAlerta.
-- RETORNA:
--     bitEstado: Estado de la alerta (1 = Activa, 0 = Inactiva).
--     bitEliminado: Estado de eliminación lógica de la alerta (1 = Eliminada, 0 = No eliminada).
-- USO:
--     EXEC SP_SAB_ListarAlertasFull;
-- DESARROLLO: WILLIAMS TORO SUSANIBAR
-- FECHA: 7 DE JULIO DEL 2024
-----------------------------------------------------------------------------  
CREATE PROCEDURE SP_SAB_ListarAlertasFull
AS
BEGIN
    -- Selección de los campos bitEstado y bitEliminado de tblAlerta
    SELECT 
        bitEstado,
        bitEliminado
    FROM tblAlerta;
END;
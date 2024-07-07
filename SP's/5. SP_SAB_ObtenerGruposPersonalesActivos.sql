-----------------------------------------------------------------------------
-- PROCEDIMIENTO: SP_SAB_ObtenerGruposPersonalesActivos
-- DESCRIPCIÓN: Este procedimiento obtiene los grupos personales activos
--              de la tabla tblGrupoPersonal que no están asignados a una alerta
--              en la tabla tblAlerta con bitActivo = 1 y bitEliminado = 0.
-- RETORNA:
--     intIdGrupoPersonal: ID del grupo personal.
--     strNombreGrupoPersonal: Nombre del grupo personal.
-- NOTAS:
--     - Solo se retornan los grupos personales que están activos, no eliminados
--       y no asignados a una alerta activa y no eliminada.
-- USO:
--     EXEC SP_SAB_ObtenerGruposPersonalesActivos;
-- DESARROLLO: WILLIAMS TORO SUSANIBAR
-- FECHA: 6 DE JULIO DEL 2024
-----------------------------------------------------------------------------  
CREATE PROCEDURE SP_SAB_ObtenerGruposPersonalesActivos
AS
BEGIN
    -- Selección de grupos personales activos, no eliminados y no asignados a alertas activas y no eliminadas
    SELECT 
        gp.intIdGrupoPersonal,
        gp.strNombreGrupoPersonal
    FROM tblGrupoPersonal gp
    LEFT JOIN tblAlerta a ON gp.intIdGrupoPersonal = a.intIdGrupoPersonal
        AND a.bitActivo = 1
        AND a.bitEliminado = 0
    WHERE gp.bitEstado = 1 
      AND gp.bitActivo = 1 
      AND gp.bitEliminado = 0
      AND a.intIdGrupoPersonal IS NULL;
END;

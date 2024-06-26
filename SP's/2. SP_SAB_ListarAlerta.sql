-----------------------------------------------------------------------------
-- PROCEDIMIENTO: SP_SAB_ListarAlerta
-- DESCRIPCIÓN: Este procedimiento lista las alertas almacenadas en la tabla tblAlerta.
-- ENTRADAS:
--     Ninguna.
-- RETORNA:
--     Listado de alertas con las columnas especificadas.
-- NOTAS:
--     - Este procedimiento asume que las alertas existen en la tabla tblAlerta.
-- USO:
--     EXEC SP_SAB_ListarAlerta;
-- DESARROLLO: WILLIAMS TORO SUSANIBAR
-- FECHA: 16 DE JUNIO DEL 2024
-----------------------------------------------------------------------------  
CREATE PROCEDURE SP_SAB_ListarAlerta
AS
BEGIN
    SET NOCOUNT ON;

    -- Selección de columnas específicas de la tabla tblAlerta
    SELECT
        strCodAlerta,
        strDepartamento,
        strProvincia,
        strDistrito,
        strDireccion,
        strDescripcion,
        strLatitud,
        strLongitud,
        intIdGrupoPersonal,
        bitEstado
    FROM
        tblAlerta
    WHERE
        bitEliminado = 0;  -- Considerando que bitEliminado = 0 significa que la alerta no está eliminada
END;

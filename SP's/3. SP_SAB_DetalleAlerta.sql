-----------------------------------------------------------------------------
-- PROCEDIMIENTO: SP_SAB_DetalleAlerta
-- DESCRIPCIÓN: Este procedimiento obtiene una alerta de la tabla tblAlerta
--              basada en el código de alerta proporcionado.
-- ENTRADAS:
--     @pstrCodAlerta: Código de alerta a buscar.
--                     Tipo de dato: VARCHAR(20).
-- RETORNA:
--     strCodAlerta: Código de alerta.
--     strDepartamento: Departamento de la alerta.
--     strProvincia: Provincia de la alerta.
--     strDistrito: Distrito de la alerta.
--     strDireccion: Direccion de la alerta.
--     strDescripcion: Descripción de la alerta.
--     strLatitud: Latitud de la alerta.
--     strLongitud: Longitud de la alerta.
--     intIdGrupoPersonal: Id del grupo personal de la alerta.
--     bitEstado: Estado de la alerta (1 = Activa, 0 = Inactiva).
-- NOTAS:
--     - Si no se encuentra el código de alerta, retorna NULL en los campos.
-- USO:
--     EXEC SP_SAB_DetalleAlerta @pstrCodAlerta = 'CODIGOALERTA00001';
-- DESARROLLO: WILLIAMS TORO SUSANIBAR
-- FECHA: 16 DE JUNIO DEL 2024
-----------------------------------------------------------------------------  
CREATE PROCEDURE SP_SAB_DetalleAlerta
    @pstrCodAlerta VARCHAR(20)
AS
BEGIN
    -- Retorno de la alerta si se encuentra el código
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
    FROM tblAlerta
    WHERE strCodAlerta = @pstrCodAlerta;
END;

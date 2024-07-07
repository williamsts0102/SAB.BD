-----------------------------------------------------------------------------
-- PROCEDIMIENTO: SP_SAB_ListarPersonalPorGrupo
-- DESCRIPCIÓN: Este procedimiento lista el personal basado en un código de grupo
--              personal especificado.
-- ENTRADAS:
--     @pstrCodGrupoPersonal: Código del grupo personal a buscar.
--                            Tipo de dato: VARCHAR(20).
-- RETORNA:
--     strCodPersonal: Código del personal.
--     strNombreCompleto: Nombre completo del personal (concatenación de strNombres y strApellidos).
--     strDNI: DNI del personal.
--     strDireccion: Dirección del personal.
--     strTelefono: Teléfono del personal.
--     strCorreo: Correo electrónico del personal.
-- USO:
--     EXEC SP_SAB_ListarPersonalPorGrupo @pstrCodGrupoPersonal = 'CODIGOGRUPO001';
-- DESARROLLO: WILLIAMS TORO SUSANIBAR
-- FECHA: 7 DE JULIO DEL 2024
-----------------------------------------------------------------------------  
CREATE PROCEDURE SP_SAB_ListarPersonalPorGrupo
    @pstrCodGrupoPersonal VARCHAR(20)
AS
BEGIN
    -- Obtener el intIdGrupoPersonal basado en @pstrCodGrupoPersonal
    DECLARE @intIdGrupoPersonal INT;
    SELECT @intIdGrupoPersonal = intIdGrupoPersonal 
    FROM tblGrupoPersonal 
    WHERE strCodGrupoPersonal = @pstrCodGrupoPersonal;

    -- Selección de los campos de tblPersonal basado en @intIdGrupoPersonal
    SELECT 
        strCodPersonal,
        CONCAT(strNombres, ' ', strApellidos) AS strNombreCompleto,
        strDNI,
        strDireccion,
        strTelefono,
        strCorreo
    FROM tblPersonal 
    WHERE intIdGrupoPersonal = @intIdGrupoPersonal;
END;

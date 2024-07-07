-----------------------------------------------------------------------------
-- PROCEDIMIENTO: SP_SAB_ListarGruposPersonales
-- DESCRIPCIÓN: Este procedimiento lista los códigos, nombres y descripciones
--              de todos los grupos personales en la tabla tblGrupoPersonal.
-- RETORNA:
--     strCodGrupoPersonal: Código del grupo personal.
--     strNombreGrupoPersonal: Nombre del grupo personal.
--     strDescripcionGrupoPersonal: Descripción del grupo personal.
-- USO:
--     EXEC SP_SAB_ListarGruposPersonales;
-- DESARROLLO: WILLIAMS TORO SUSANIBAR
-- FECHA: 7 DE JULIO DEL 2024
-----------------------------------------------------------------------------  
CREATE PROCEDURE SP_SAB_ListarGruposPersonales
AS
BEGIN
    -- Selección de los campos strCodGrupoPersonal, strNombreGrupoPersonal y strDescripcionGrupoPersonal de tblGrupoPersonal
    SELECT 
        strCodGrupoPersonal,
        strNombreGrupoPersonal,
        strDescripcionGrupoPersonal
    FROM tblGrupoPersonal;
END;

CREATE PROCEDURE SP_SAB_ObtenerAlertaPorPersonal
    @pintIdPersonal INTEGER
AS
BEGIN
    -- Obtener la alerta activa y no eliminada asociada al grupo personal del personal especificado
    SELECT 
        a.strCodAlerta,
        a.strDepartamento,
        a.strProvincia,
        a.strDistrito,
        a.strDireccion,
        a.strLatitud,
        a.strLongitud,
        a.strDescripcion,
        gp.strNombreGrupoPersonal
    FROM tblAlerta a
    INNER JOIN tblGrupoPersonal gp ON a.intIdGrupoPersonal = gp.intIdGrupoPersonal
    INNER JOIN tblPersonal p ON gp.intIdGrupoPersonal = p.intIdGrupoPersonal
    WHERE p.intIdPersonal = @pintIdPersonal
      AND a.bitActivo = 1
      AND a.bitEliminado = 0;
END;

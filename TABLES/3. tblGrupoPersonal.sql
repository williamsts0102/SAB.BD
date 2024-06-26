CREATE TABLE tblGrupoPersonal (
    intIdGrupoPersonal INTEGER PRIMARY KEY IDENTITY(1,1),
    strCodGrupoPersonal VARCHAR(20) UNIQUE,
    strNombreGrupoPersonal VARCHAR(50),
    strDescripcionGrupoPersonal VARCHAR(200),
    bitEstado BIT,
    bitActivo BIT,
    bitEliminado BIT,
    intIdUsuarioRegistro INTEGER,
    dtmFechaRegistro DATETIME,
    intIdUsuarioModificacion INTEGER,
    dtmFechaModificacion DATETIME,
    intIdUsuarioEliminacion INTEGER,
    dtmFechaEliminacion DATETIME
);
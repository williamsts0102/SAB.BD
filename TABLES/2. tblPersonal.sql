CREATE TABLE tblPersonal (
    intIdPersonal INTEGER PRIMARY KEY IDENTITY(1,1),
    intIdGrupoPersonal INTEGER,
    strCodPersonal VARCHAR(20) UNIQUE,
    strNombres VARCHAR(50),
    strApellidos VARCHAR(50),
    strDNI VARCHAR(8),
    strDireccion VARCHAR(50),
    strTelefono VARCHAR(9),
    strCorreo VARCHAR(50),
    strUsuario VARCHAR(20),
    strContrasena VARCHAR(20),
    bitEstado BIT,
    bitActivo BIT,
    bitEliminado BIT,
    intIdUsuarioRegistro INTEGER,
    dtmFechaRegistro DATETIME,
    intIdUsuarioModificacion INTEGER,
    dtmFechaModificacion DATETIME,
    intIdUsuarioEliminacion INTEGER,
    dtmFechaEliminacion DATETIME,
    FOREIGN KEY (intIdGrupoPersonal) REFERENCES tblGrupoPersonal(intIdGrupoPersonal)
);
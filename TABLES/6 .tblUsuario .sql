CREATE TABLE tblUsuario (
    intIdUsuario INTEGER PRIMARY KEY IDENTITY(1,1),
    strUsuario VARCHAR(100) UNIQUE,
    strContrasena VARCHAR(MAX),
    intIdRol INTEGER,
    intIdPersonal INTEGER NULL,
    intIdCiudadano INTEGER NULL,
    bitEstado BIT,
    bitActivo BIT,
    bitEliminado BIT,
    dtmFechaRegistro DATETIME,
    dtmFechaModificacion DATETIME,
    dtmFechaEliminacion DATETIME,
    FOREIGN KEY (intIdRol) REFERENCES tblRol(intIdRol),
    FOREIGN KEY (intIdPersonal) REFERENCES tblPersonal(intIdPersonal),
    FOREIGN KEY (intIdCiudadano) REFERENCES tblCiudadano(intIdCiudadano)
);
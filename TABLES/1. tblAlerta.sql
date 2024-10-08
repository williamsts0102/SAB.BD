CREATE TABLE tblAlerta (
    intIdAlerta INTEGER PRIMARY KEY IDENTITY(1,1),
    strCodAlerta VARCHAR(20) UNIQUE,
    strDepartamento VARCHAR(20),
    strProvincia VARCHAR(20),
    strDistrito VARCHAR(20),
    strDireccion VARCHAR(50),
    strLatitud VARCHAR(200),
    strLongitud VARCHAR(200),
    strDescripcion VARCHAR(200),
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

//alterar tabla tblAlerta para agregar el id de grupopersonal
ALTER TABLE tblAlerta
ADD intIdGrupoPersonal INTEGER,
FOREIGN KEY (intIdGrupoPersonal) REFERENCES tblGrupoPersonal(intIdGrupoPersonal);
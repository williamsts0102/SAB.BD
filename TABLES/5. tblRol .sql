CREATE TABLE tblRol (
    intIdRol INTEGER PRIMARY KEY IDENTITY(1,1),
    strNombreRol VARCHAR(50) UNIQUE
);

-- Insertar roles para Personal y Ciudadano
INSERT INTO tblRol (strNombreRol) VALUES ('Personal'), ('Ciudadano');

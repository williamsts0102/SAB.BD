INSERT INTO tblGrupoPersonal (
    strCodGrupoPersonal,
    strNombreGrupoPersonal,
    strDescripcionGrupoPersonal,
    bitEstado,
    bitActivo,
    bitEliminado,
    intIdUsuarioRegistro,
    dtmFechaRegistro
) VALUES (
    'GRP001',
    'Grupo de Rescate Nº 1',
    'Grupo dedicado a labores de rescate y emergencias.',
    1, -- bitEstado: activo
    1, -- bitActivo: activo
    0, -- bitEliminado: no eliminado
    1, -- intIdUsuarioRegistro: ID del usuario que está registrando este grupo
    GETDATE() -- dtmFechaRegistro: fecha actual
);

-- Registro de Personal
INSERT INTO tblPersonal (
    intIdGrupoPersonal, strCodPersonal, strNombres, strApellidos, strDNI, 
    strDireccion, strTelefono, strCorreo, strUsuario, strContrasena, 
    bitEstado, bitActivo, bitEliminado, intIdUsuarioRegistro, dtmFechaRegistro
) VALUES (
    1, -- Suponiendo que el grupo personal con ID 1 ya existe
    'COD1234',
    'Williams',
    'Toro',
    '12345678',
    'Incas 342 Independencia',
    '123456789',
    'williams.toro@example.com',
    '12345678',
    '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 
    1, -- bitEstado: activo
    1, -- bitActivo: activo
    0, -- bitEliminado: no eliminado
    1, -- intIdUsuarioRegistro: ID del usuario que está registrando este personal
    GETDATE() -- dtmFechaRegistro: fecha actual
);

-- Obtener el ID del personal recién registrado
DECLARE @PersonalId INT;
SELECT @PersonalId = SCOPE_IDENTITY();

-- Registrar el usuario relacionado con el personal
INSERT INTO tblUsuario (
    strUsername, strPassword, bitActivo, bitEliminado, intIdPersonal, 
    intIdUsuarioRegistro, dtmFechaRegistro
) VALUES (
    '12345678', 
    '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 
    1, -- bitActivo: activo
    0, -- bitEliminado: no eliminado
    @PersonalId,
    1, -- intIdUsuarioRegistro: ID del usuario que está registrando este usuario
    GETDATE() -- dtmFechaRegistro: fecha actual
);

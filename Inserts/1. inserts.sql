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
    'GRP002',
    'Grupo de Extinción de Incendios Nº 2',
    'Grupo especializado en la extinción de incendios y control de materiales peligrosos.',
    1, -- bitEstado: activo
    1, -- bitActivo: activo
    0, -- bitEliminado: no eliminado
    2, -- intIdUsuarioRegistro: ID del usuario que está registrando este grupo
    GETDATE() -- dtmFechaRegistro: fecha actual
);

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
    'GRP003',
    'Grupo de Atención Médica de Emergencias Nº 3',
    'Grupo dedicado a brindar atención médica de emergencia y soporte vital avanzado.',
    1, -- bitEstado: activo
    1, -- bitActivo: activo
    0, -- bitEliminado: no eliminado
    2, -- intIdUsuarioRegistro: ID del usuario que está registrando este grupo
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
    '',
    '', 
    1, -- bitEstado: activo
    1, -- bitActivo: activo
    0, -- bitEliminado: no eliminado
    1, -- intIdUsuarioRegistro: ID del usuario que está registrando este personal
    GETDATE() -- dtmFechaRegistro: fecha actual
);
INSERT INTO tblPersonal (
    intIdGrupoPersonal, strCodPersonal, strNombres, strApellidos, strDNI, 
    strDireccion, strTelefono, strCorreo, strUsuario, strContrasena, 
    bitEstado, bitActivo, bitEliminado, intIdUsuarioRegistro, dtmFechaRegistro
) VALUES
(
    1,
    'COD1235',
    'Laura',
    'Gomez',
    '87654321',
    'Av. Libertad 123',
    '987654321',
    'laura.gomez@example.com',
    '',
    '',
    1,
    1,
    0,
    1,
    GETDATE()
),
(
    1,
    'COD1236',
    'Carlos',
    'Fernandez',
    '56781234',
    'Calle Sol 456',
    '765432189',
    'carlos.fernandez@example.com',
    '',
    '',
    1,
    1,
    0,
    1,
    GETDATE()
),
(
    1,
    'COD1237',
    'Maria',
    'Lopez',
    '43215678',
    'Jr. Lima 789',
    '654321987',
    'maria.lopez@example.com',
    '',
    '',
    1,
    1,
    0,
    1,
    GETDATE()
);
--personalparaelg2
INSERT INTO tblPersonal (
    intIdGrupoPersonal, strCodPersonal, strNombres, strApellidos, strDNI, 
    strDireccion, strTelefono, strCorreo, strUsuario, strContrasena, 
    bitEstado, bitActivo, bitEliminado, intIdUsuarioRegistro, dtmFechaRegistro
) VALUES
(
    2,
    'COD2234',
    'Juan',
    'Perez',
    '23456789',
    'Calle Fuego 123',
    '234567891',
    'juan.perez@example.com',
    '',
    '',
    1,
    1,
    0,
    2,
    GETDATE()
),
(
    2,
    'COD2235',
    'Ana',
    'Martinez',
    '98765432',
    'Av. Salvación 456',
    '876543219',
    'ana.martinez@example.com',
    '',
    '',
    1,
    1,
    0,
    2,
    GETDATE()
),
(
    2,
    'COD2236',
    'Luis',
    'Hernandez',
    '34567890',
    'Jr. Rescate 789',
    '345678912',
    'luis.hernandez@example.com',
    '',
    '',
    1,
    1,
    0,
    2,
    GETDATE()
),
(
    2,
    'COD2237',
    'Isabel',
    'Ramirez',
    '45678901',
    'Calle Llama 321',
    '456789012',
    'isabel.ramirez@example.com',
    '',
    '',
    1,
    1,
    0,
    2,
    GETDATE()
);
--personalparaelg3
INSERT INTO tblPersonal (
    intIdGrupoPersonal, strCodPersonal, strNombres, strApellidos, strDNI, 
    strDireccion, strTelefono, strCorreo, strUsuario, strContrasena, 
    bitEstado, bitActivo, bitEliminado, intIdUsuarioRegistro, dtmFechaRegistro
) VALUES
(
    3,
    'COD3234',
    'Pedro',
    'Rodriguez',
    '56789012',
    'Av. Salud 123',
    '567890123',
    'pedro.rodriguez@example.com',
    '',
    '',
    1,
    1,
    0,
    2,
    GETDATE()
),
(
    3,
    'COD3235',
    'Lucia',
    'Garcia',
    '78901234',
    'Jr. Médico 456',
    '789012345',
    'lucia.garcia@example.com',
    '',
    '',
    1,
    1,
    0,
    2,
    GETDATE()
),
(
    3,
    'COD3236',
    'Diego',
    'Sanchez',
    '89012345',
    'Calle Emergencia 789',
    '890123456',
    'diego.sanchez@example.com',
    '',
    '',
    1,
    1,
    0,
    2,
    GETDATE()
),
(
    3,
    'COD3237',
    'Elena',
    'Morales',
    '90123456',
    'Av. Primeros Auxilios 321',
    '901234567',
    'elena.morales@example.com',
    '',
    '',
    1,
    1,
    0,
    2,
    GETDATE()
);

-- Registrar el usuario relacionado con el personal
INSERT INTO tblUsuario (
    strUsuario, strContrasena,bitEstado, bitActivo, bitEliminado, intIdPersonal, dtmFechaRegistro
) VALUES (
    '12345678', 
    '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', 
    1,
    1, -- bitActivo: activo
    0, -- bitEliminado: no eliminado
    6,
    GETDATE() -- dtmFechaRegistro: fecha actual
);
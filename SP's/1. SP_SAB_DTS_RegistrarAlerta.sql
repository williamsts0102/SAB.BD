-----------------------------------------------------------------------------
-- PROCEDIMIENTO: SP_SAB_DTS_RegistrarAlerta
-- DESCRIPCIÓN: Este procedimiento almacena una nueva alerta en la tabla tblAlerta.
-- ENTRADAS:
--     @pstrDepartamento: Departamento donde se genera la alerta.
--                     Tipo de dato: VARCHAR(20).
--     @pstrProvincia: Provincia donde se genera la alerta.
--                     Tipo de dato: VARCHAR(20).
--     @pstrDistrito: Distrito donde se genera la alerta.
--                     Tipo de dato: VARCHAR(20).
--     @pstrDireccion: Dirección donde se genera la alerta.
--                     Tipo de dato: VARCHAR(50).
--     @pstrLatitud: Latitud de la ubicación de la alerta.
--                     Tipo de dato: VARCHAR(200), opcional.
--     @pstrLongitud: Longitud de la ubicación de la alerta.
--                     Tipo de dato: VARCHAR(200), opcional.
--     @pstrDescripcion: Descripción de la alerta.
--                     Tipo de dato: VARCHAR(200).
--     @pbitEstado: Estado de la alerta (1 = Activa, 0 = Inactiva).
--                     Tipo de dato: BIT.
--     @pintIdUsuarioRegistro: ID del usuario que registra la alerta.
--                     Tipo de dato: INTEGER.
-- RETORNA:
--     Código de estado, descripción del resultado de la operación y código de alerta.
-- NOTAS:
--     - Este procedimiento asume que los parámetros proporcionados son válidos y existen en las tablas correspondientes.
--     - Se genera un nuevo código de alerta único basado en el último ID de alerta.
--     - El procedimiento utiliza una transacción para garantizar la integridad de los datos.
-- USO:
--     EXEC SP_SAB_DTS_RegistrarAlerta 
--         @pstrDepartamento = [Departamento],
--         @pstrProvincia = [Provincia],
--         @pstrDistrito = [Distrito],
--         @pstrDireccion = [Dirección],
--         @pstrLatitud = [Latitud],
--         @pstrLongitud = [Longitud],
--         @pstrDescripcion = [Descripción],
--         @pbitEstado = [Estado],
--         @pintIdUsuarioRegistro = [ID del usuario];
-- DESARROLLO: WILLIAMS TORO SUSANIBAR
-- FECHA: 16 DE JUNIO DEL 2024
-----------------------------------------------------------------------------  
CREATE PROCEDURE SP_SAB_DTS_RegistrarAlerta
    @pstrDepartamento VARCHAR(20),
    @pstrProvincia VARCHAR(20),
    @pstrDistrito VARCHAR(20),
    @pstrDireccion VARCHAR(50),
    @pstrLatitud VARCHAR(200) = NULL,
    @pstrLongitud VARCHAR(200) = NULL,
    @pstrDescripcion VARCHAR(200),
    @pbitEstado BIT,
    @pintIdUsuarioRegistro INTEGER
AS
BEGIN
    DECLARE @codigo INT = 400;
    DECLARE @descripcion VARCHAR(400) = '';
    DECLARE @flgError BIT = 0;
    DECLARE @ultimoId INT;
    DECLARE @nuevoCodigo VARCHAR(20) = NULL;

    -- Validación de parámetros obligatorios
    IF @pstrDepartamento IS NULL OR LTRIM(RTRIM(@pstrDepartamento)) = ''
    BEGIN
        SET @codigo = 400;
        SET @descripcion = 'El departamento es obligatorio.';
        SET @flgError = 1;
    END

    IF @flgError = 0 AND (@pstrProvincia IS NULL OR LTRIM(RTRIM(@pstrProvincia)) = '')
    BEGIN
        SET @codigo = 400;
        SET @descripcion = 'La provincia es obligatoria.';
        SET @flgError = 1;
    END

    IF @flgError = 0 AND (@pstrDistrito IS NULL OR LTRIM(RTRIM(@pstrDistrito)) = '')
    BEGIN
        SET @codigo = 400;
        SET @descripcion = 'El distrito es obligatorio.';
        SET @flgError = 1;
    END

    IF @flgError = 0 AND (@pstrDireccion IS NULL OR LTRIM(RTRIM(@pstrDireccion)) = '')
    BEGIN
        SET @codigo = 400;
        SET @descripcion = 'La dirección es obligatoria.';
        SET @flgError = 1;
    END

    IF @flgError = 0 AND (@pstrDescripcion IS NULL OR LTRIM(RTRIM(@pstrDescripcion)) = '')
    BEGIN
        SET @codigo = 400;
        SET @descripcion = 'La descripción es obligatoria.';
        SET @flgError = 1;
    END

    IF @flgError = 0 AND (@pintIdUsuarioRegistro IS NULL OR LTRIM(RTRIM(CAST(@pintIdUsuarioRegistro AS VARCHAR))) = '')
    BEGIN
        SET @codigo = 400;
        SET @descripcion = 'El ID del usuario de registro es obligatorio.';
        SET @flgError = 1;
    END

    -- Registro de la alerta
    IF @flgError = 0
    BEGIN
        BEGIN TRANSACTION
        BEGIN TRY
            -- Obtención del último ID de alerta
            SELECT @ultimoId = ISNULL(MAX(intIdAlerta), 0) FROM tblAlerta;

            -- Generación del nuevo código de alerta
            DECLARE @numeroAlerta VARCHAR(20);
            SET @numeroAlerta = CAST(@ultimoId + 1 AS VARCHAR);

            -- Calcular cuántos ceros se necesitan
            DECLARE @ceros VARCHAR(20);
            SET @ceros = REPLICATE('0', 20 - LEN('CODIGOALERTA') - LEN(@numeroAlerta));

            -- Formar el nuevo código de alerta
            SET @nuevoCodigo = 'CODIGOALERTA' + @ceros + @numeroAlerta;

            INSERT INTO tblAlerta (
                strCodAlerta,
                strDepartamento,
                strProvincia,
                strDistrito,
                strDireccion,
                strLatitud,
                strLongitud,
                strDescripcion,
                bitEstado,
                bitActivo,
                bitEliminado,
                intIdUsuarioRegistro,
                dtmFechaRegistro)
            VALUES (
                @nuevoCodigo,
                @pstrDepartamento,
                @pstrProvincia,
                @pstrDistrito,
                @pstrDireccion,
                @pstrLatitud,
                @pstrLongitud,
                @pstrDescripcion,
                @pbitEstado,
                1,  -- bitActivo
                0,  -- bitEliminado
                @pintIdUsuarioRegistro,
                GETDATE()  -- dtmFechaRegistro
            );

            COMMIT;
            SET @codigo = 200;
            SET @descripcion = 'Alerta registrada exitosamente, guarde su código de alerta "' + @nuevoCodigo + '".';
        END TRY
        BEGIN CATCH
            ROLLBACK;
            IF ERROR_NUMBER() = 2627  -- Violación de restricción de unicidad
            BEGIN
                SET @codigo = 409;
                SET @descripcion = 'El código de alerta ya existe.';
            END
            ELSE
            BEGIN
                SET @codigo = 500;
                SET @descripcion = 'Error transaccional, no se pudo registrar la alerta. ' + ERROR_MESSAGE() + ' LINEA: ' + CONVERT(VARCHAR(5), ERROR_LINE());
            END
        END CATCH
    END

    -- Retorno de resultado
    SELECT @codigo AS codigo, @descripcion AS descripcion, @nuevoCodigo AS codigoAlerta;
END;

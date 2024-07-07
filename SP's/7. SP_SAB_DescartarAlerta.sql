-----------------------------------------------------------------------------
-- PROCEDIMIENTO: SP_SAB_DescartarAlerta
-- DESCRIPCIÓN: Este procedimiento descarta una alerta en la tabla tblAlerta.
-- ENTRADAS:
--     @pstrCodAlerta: Código de alerta a descartar.
--                     Tipo de dato: VARCHAR(20).
-- SALIDAS:
--     @codigo: Código de estado HTTP (200 = OK, 500 = Error del servidor).
--              Tipo de dato: INT.
--     @descripcion: Descripción del resultado de la operación.
--                   Tipo de dato: VARCHAR(255).
-- USO:
--     EXEC SP_SAB_DescartarAlerta @pstrCodAlerta = 'CODIGOALERTA00001';
-- DESARROLLO: WILLIAMS TORO SUSANIBAR
-- FECHA: 6 DE JULIO DEL 2024
-----------------------------------------------------------------------------  
CREATE PROCEDURE SP_SAB_DescartarAlerta
    @pstrCodAlerta VARCHAR(20)
AS
BEGIN
    DECLARE @codigo INT;
    DECLARE @descripcion VARCHAR(255);

    -- Iniciar la transacción
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Actualizar la alerta para marcarla como descartada
        UPDATE tblAlerta
        SET bitActivo = 0,
            bitEliminado = 1
        WHERE strCodAlerta = @pstrCodAlerta;

        -- Confirmar la transacción
        COMMIT TRANSACTION;

        -- Establecer código y descripción de éxito
        SET @codigo = 200;
        SET @descripcion = 'La alerta ha sido descartada exitosamente.';
    END TRY
    BEGIN CATCH
        -- Revertir la transacción en caso de error
        ROLLBACK TRANSACTION;

        -- Establecer código y descripción de error del servidor
        SET @codigo = 500;
        SET @descripcion = ERROR_MESSAGE();
    END CATCH

    -- Retornar el código y la descripción
    SELECT @codigo AS codigo, @descripcion AS descripcion;
END;

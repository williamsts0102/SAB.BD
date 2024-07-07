-----------------------------------------------------------------------------
-- PROCEDIMIENTO: SP_SAB_ActualizarAlerta
-- DESCRIPCIÓN: Este procedimiento actualiza el grupo personal y el estado
--              de una alerta en la tabla tblAlerta.
-- ENTRADAS:
--     @pintIdGrupoPersonal: ID del grupo personal a asignar.
--                           Tipo de dato: INT.
--     @pstrCodAlerta: Código de alerta a actualizar.
--                     Tipo de dato: VARCHAR(20).
-- SALIDAS:
--     @codigo: Código de estado HTTP (200 = OK, 400 = Error de validación, 500 = Error del servidor).
--              Tipo de dato: INT.
--     @descripcion: Descripción del resultado de la operación.
--                   Tipo de dato: VARCHAR(255).
-- USO:
--     EXEC SP_SAB_ActualizarAlerta @pintIdGrupoPersonal = 1, @pstrCodAlerta = 'CODIGOALERTA00001';
-- DESARROLLO: WILLIAMS TORO SUSANIBAR
-- FECHA: 6 DE JULIO DEL 2024
-----------------------------------------------------------------------------  
CREATE PROCEDURE SP_SAB_ActualizarAlerta
    @pintIdGrupoPersonal INT,
    @pstrCodAlerta VARCHAR(20)
AS
BEGIN
    DECLARE @codigo INT;
    DECLARE @descripcion VARCHAR(255);

    -- Iniciar la transacción
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar que el grupo no esté asignado a otra alerta activa
        IF NOT EXISTS (
            SELECT 1 
            FROM tblAlerta 
            WHERE intIdGrupoPersonal = @pintIdGrupoPersonal 
              AND bitEstado = 1 
              AND strCodAlerta != @pstrCodAlerta
        )
        BEGIN
            -- Actualizar el grupo personal y el estado de la alerta
            UPDATE tblAlerta
            SET intIdGrupoPersonal = @pintIdGrupoPersonal,
                bitEstado = 0
            WHERE strCodAlerta = @pstrCodAlerta;

            -- Confirmar la transacción
            COMMIT TRANSACTION;

            -- Establecer código y descripción de éxito
            SET @codigo = 200;
            SET @descripcion = 'La alerta ha sido actualizada exitosamente.';
        END
        ELSE
        BEGIN
            -- Revertir la transacción
            ROLLBACK TRANSACTION;

            -- Establecer código y descripción de error de validación
            SET @codigo = 400;
            SET @descripcion = 'El grupo personal ya está asignado a otra alerta activa.';
        END
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

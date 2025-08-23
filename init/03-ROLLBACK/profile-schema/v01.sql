-- ================================================
-- ROLLBACK: perfil SCHEMA
-- ================================================

-- Eliminar datos de prueba
DELETE FROM perfil.profesional WHERE usu_id IN (
    SELECT usu_id FROM auth.usuario WHERE usu_email IN (
        'juan.perez@email.com', 
        'maria.garcia@email.com'
    )
);

DELETE FROM perfil.empresa WHERE usu_id IN (
    SELECT usu_id FROM auth.usuario WHERE usu_email IN (
        'contacto@techcorp.com', 
        'hr@innovatelab.com'
    )
);

-- Eliminar tablas
DROP TABLE IF EXISTS perfil.empresa CASCADE;
DROP TABLE IF EXISTS perfil.profesional CASCADE;

-- Eliminar esquema
DROP SCHEMA IF EXISTS perfil CASCADE;

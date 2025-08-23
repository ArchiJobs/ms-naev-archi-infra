-- ================================================
-- ROLLBACK: auth SCHEMA
-- ================================================

-- Eliminar datos de prueba
DELETE FROM auth.usuario_rol WHERE usu_id IN (
    SELECT usu_id FROM auth.usuario WHERE usu_email IN (
        'admin@jobsearch.com', 
        'juan.perez@email.com', 
        'maria.garcia@email.com', 
        'contacto@techcorp.com', 
        'hr@innovatelab.com'
    )
);

DELETE FROM auth.usuario WHERE usu_email IN (
    'admin@jobsearch.com', 
    'juan.perez@email.com', 
    'maria.garcia@email.com', 
    'contacto@techcorp.com', 
    'hr@innovatelab.com'
);

DELETE FROM auth.rol WHERE rol_nombre IN ('ADMIN', 'PROFESIONAL', 'EMPRESA');

-- Eliminar tablas
DROP TABLE IF EXISTS auth.usuario_rol CASCADE;
DROP TABLE IF EXISTS auth.rol CASCADE;
DROP TABLE IF EXISTS auth.usuario CASCADE;

-- Eliminar esquema
DROP SCHEMA IF EXISTS auth CASCADE;

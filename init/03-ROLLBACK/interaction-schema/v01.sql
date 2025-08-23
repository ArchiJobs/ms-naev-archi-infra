-- ================================================
-- ROLLBACK: interaccion SCHEMA
-- ================================================

-- Eliminar datos de prueba
DELETE FROM interaccion.analitica;
DELETE FROM interaccion.historial;
DELETE FROM interaccion.notificacion;

-- Eliminar tablas
DROP TABLE IF EXISTS interaccion.analitica CASCADE;
DROP TABLE IF EXISTS interaccion.historial CASCADE;
DROP TABLE IF EXISTS interaccion.notificacion CASCADE;

-- Eliminar esquema
DROP SCHEMA IF EXISTS interaccion CASCADE;

-- ================================================
-- ROLLBACK: pago SCHEMA
-- ================================================

-- Eliminar datos de prueba
DELETE FROM pago.transaccion;
DELETE FROM pago.plan;

-- Eliminar tablas
DROP TABLE IF EXISTS pago.transaccion CASCADE;
DROP TABLE IF EXISTS pago.plan CASCADE;

-- Eliminar esquema
DROP SCHEMA IF EXISTS pago CASCADE;

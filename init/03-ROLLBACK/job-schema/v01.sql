-- ================================================
-- ROLLBACK: job SCHEMA
-- ================================================

DELETE FROM job.postulacion;
DELETE FROM job.oferta;
DELETE FROM job.empresa;
DELETE FROM job.categoria;
DELETE FROM job.ubicacion;

DROP TABLE IF EXISTS job.postulacion CASCADE;
DROP TABLE IF EXISTS job.oferta CASCADE;
DROP TABLE IF EXISTS job.empresa CASCADE;
DROP TABLE IF EXISTS job.categoria CASCADE;
DROP TABLE IF EXISTS job.ubicacion CASCADE;

-- Eliminar esquema
DROP SCHEMA IF EXISTS job CASCADE;

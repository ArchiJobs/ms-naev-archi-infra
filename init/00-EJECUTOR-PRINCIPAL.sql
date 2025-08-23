-- ================================================
-- EJECUTOR PRINCIPAL - ORDEN DE DEPENDENCIAS
-- ================================================

-- Este archivo se ejecuta automáticamente por PostgreSQL
-- Los archivos se ejecutan en orden alfabético

-- FASE 1: DDL - Definición de estructuras
-- 01-DDL/auth-schema/v01.sql (se ejecuta primero por dependencias)
-- 01-DDL/profile-schema/v01.sql (depende de auth)
-- 01-DDL/job-schema/v01.sql (depende de profile)
-- 01-DDL/payment-schema/v01.sql (depende de auth)
-- 01-DDL/interaction-schema/v01.sql (depende de auth)

-- FASE 2: DML - Inserción de datos
-- 02-DML/auth-schema/v01.sql (datos básicos primero)
-- 02-DML/profile-schema/v01.sql (perfiles de usuarios)
-- 02-DML/job-schema/v01.sql (ofertas y postulaciones)
-- 02-DML/payment-schema/v01.sql (planes y transacciones)
-- 02-DML/interaction-schema/v01.sql (notificaciones e historial)

-- FASE 3: ROLLBACK disponibles en 03-ROLLBACK/

-- Para ejecutar rollback manualmente:
-- \i 03-ROLLBACK/interaction-schema/v01.sql
-- \i 03-ROLLBACK/job-schema/v01.sql
-- \i 03-ROLLBACK/payment-schema/v01.sql
-- \i 03-ROLLBACK/profile-schema/v01.sql
-- \i 03-ROLLBACK/auth-schema/v01.sql

-- Verificación de tablas creadas
SELECT schemaname, tablename 
FROM pg_tables 
WHERE schemaname IN ('auth', 'perfil', 'job', 'pago', 'interaccion')
ORDER BY schemaname, tablename;

-- ================================================
-- 02-DML-EJECUTOR: Ejecuta todos los scripts DML
-- ================================================

-- Insertar datos en orden de dependencias
\i /docker-entrypoint-initdb.d/02-DML/auth-schema/v01.sql
\i /docker-entrypoint-initdb.d/02-DML/profile-schema/v01.sql
\i /docker-entrypoint-initdb.d/02-DML/job-schema/v01.sql
\i /docker-entrypoint-initdb.d/02-DML/payment-schema/v01.sql
\i /docker-entrypoint-initdb.d/02-DML/interaction-schema/v01.sql

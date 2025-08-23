-- ================================================
-- 01-DDL-EJECUTOR: Ejecuta todos los scripts DDL
-- ================================================

-- Ejecutar esquemas en orden de dependencias
\i /docker-entrypoint-initdb.d/01-DDL/auth-schema/v01.sql
\i /docker-entrypoint-initdb.d/01-DDL/auth-schema/v02.sql
\i /docker-entrypoint-initdb.d/01-DDL/profile-schema/v01.sql
\i /docker-entrypoint-initdb.d/01-DDL/job-schema/v01.sql
\i /docker-entrypoint-initdb.d/01-DDL/payment-schema/v01.sql
\i /docker-entrypoint-initdb.d/01-DDL/interaction-schema/v01.sql

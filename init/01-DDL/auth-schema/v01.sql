-- ================================================
-- DDL: auth SCHEMA
-- ================================================
CREATE SCHEMA IF NOT EXISTS auth;

CREATE TABLE IF NOT EXISTS auth.usuario (
    usu_id SERIAL PRIMARY KEY,
    usu_nombre VARCHAR(100) NOT NULL,
    usu_email VARCHAR(150) UNIQUE NOT NULL,
    usu_password VARCHAR(255) NOT NULL,
    usu_activo BOOLEAN DEFAULT TRUE,
    usu_fecha_creacion TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS auth.rol (
    rol_id SERIAL PRIMARY KEY,
    rol_nombre VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS auth.usuario_rol (
    ur_id SERIAL PRIMARY KEY,
    usu_id INT NOT NULL REFERENCES auth.usuario(usu_id),
    rol_id INT NOT NULL REFERENCES auth.rol(rol_id),
    UNIQUE (usu_id, rol_id)
);

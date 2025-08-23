-- ================================================
-- DDL: perfil SCHEMA
-- ================================================
CREATE SCHEMA IF NOT EXISTS perfil;

CREATE TABLE IF NOT EXISTS perfil.profesional (
    pro_id SERIAL PRIMARY KEY,
    usu_id INT NOT NULL REFERENCES auth.usuario(usu_id),
    pro_nombre VARCHAR(100) NOT NULL,
    pro_apellido VARCHAR(100),
    pro_titulo VARCHAR(150),
    pro_experiencia TEXT,
    pro_pais VARCHAR(100),
    pro_ciudad VARCHAR(100),
    pro_fecha_creacion TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS perfil.empresa (
    emp_id SERIAL PRIMARY KEY,
    usu_id INT NOT NULL REFERENCES auth.usuario(usu_id),
    emp_nombre VARCHAR(150) NOT NULL,
    emp_sector VARCHAR(100),
    emp_pais VARCHAR(100),
    emp_ciudad VARCHAR(100),
    emp_fecha_creacion TIMESTAMP DEFAULT NOW()
);

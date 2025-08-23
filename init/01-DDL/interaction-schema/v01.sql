-- ================================================
-- DDL: interaccion SCHEMA
-- ================================================
CREATE SCHEMA IF NOT EXISTS interaccion;

CREATE TABLE IF NOT EXISTS interaccion.notificacion (
    not_id SERIAL PRIMARY KEY,
    usu_id INT NOT NULL REFERENCES auth.usuario(usu_id),
    not_mensaje TEXT NOT NULL,
    not_fecha TIMESTAMP DEFAULT NOW(),
    not_leido BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS interaccion.historial (
    his_id SERIAL PRIMARY KEY,
    usu_id INT NOT NULL REFERENCES auth.usuario(usu_id),
    his_accion VARCHAR(200) NOT NULL,
    his_fecha TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS interaccion.analitica (
    ana_id SERIAL PRIMARY KEY,
    usu_id INT NOT NULL REFERENCES auth.usuario(usu_id),
    ana_tipo VARCHAR(100),
    ana_valor INT DEFAULT 1,
    ana_fecha TIMESTAMP DEFAULT NOW()
);

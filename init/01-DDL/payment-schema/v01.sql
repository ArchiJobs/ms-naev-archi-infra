-- ================================================
-- DDL: pago SCHEMA
-- ================================================
CREATE SCHEMA IF NOT EXISTS pago;

CREATE TABLE IF NOT EXISTS pago.plan (
    pla_id SERIAL PRIMARY KEY,
    pla_nombre VARCHAR(100) NOT NULL,
    pla_precio DECIMAL(10,2) NOT NULL,
    pla_duracion INT NOT NULL,
    pla_descripcion TEXT
);

CREATE TABLE IF NOT EXISTS pago.transaccion (
    tra_id SERIAL PRIMARY KEY,
    usu_id INT NOT NULL REFERENCES auth.usuario(usu_id),
    pla_id INT NOT NULL REFERENCES pago.plan(pla_id),
    tra_monto DECIMAL(10,2) NOT NULL,
    tra_fecha TIMESTAMP DEFAULT NOW(),
    tra_estado VARCHAR(50) DEFAULT 'Pendiente'
);

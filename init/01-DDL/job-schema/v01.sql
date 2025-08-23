-- ================================================
-- DDL: job SCHEMA
-- ================================================
CREATE SCHEMA IF NOT EXISTS job;

-- Tabla de empresas
CREATE TABLE IF NOT EXISTS job.empresa (
    emp_id SERIAL PRIMARY KEY,
    emp_nombre VARCHAR(150) NOT NULL,
    emp_descripcion TEXT,
    emp_website VARCHAR(255),
    emp_logo_url VARCHAR(255)
);

-- Tabla de categorías de trabajo
CREATE TABLE IF NOT EXISTS job.categoria (
    cat_id SERIAL PRIMARY KEY,
    cat_nombre VARCHAR(100) NOT NULL,
    cat_descripcion TEXT
);

CREATE TABLE IF NOT EXISTS job.ubicacion (
    ubi_id SERIAL PRIMARY KEY,
    ubi_comuna VARCHAR(100) NOT NULL,
    ubi_region VARCHAR(100) NOT NULL,
    ubi_pais VARCHAR(100) DEFAULT 'Chile'
);

CREATE TABLE IF NOT EXISTS job.oferta (
    ofe_id SERIAL PRIMARY KEY,
    emp_id INT NOT NULL REFERENCES job.empresa(emp_id),
    cat_id INT NOT NULL REFERENCES job.categoria(cat_id),
    ubi_id INT NOT NULL REFERENCES job.ubicacion(ubi_id),
    ofe_titulo VARCHAR(150) NOT NULL,
    ofe_descripcion TEXT NOT NULL,
    ofe_modalidad VARCHAR(50),
    ofe_tipo_contrato VARCHAR(50),
    ofe_salario_min INT,
    ofe_salario_max INT,
    ofe_fecha_publicacion TIMESTAMP DEFAULT NOW(),
    ofe_activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS job.postulacion (
    pos_id SERIAL PRIMARY KEY,
    ofe_id INT NOT NULL REFERENCES job.oferta(ofe_id),
    pro_id INT NOT NULL REFERENCES perfil.profesional(pro_id),
    pos_estado VARCHAR(50) DEFAULT 'En revisión',
    pos_fecha TIMESTAMP DEFAULT NOW(),
    UNIQUE (ofe_id, pro_id)
);

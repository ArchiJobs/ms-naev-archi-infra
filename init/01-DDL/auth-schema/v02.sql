-- ================================================
-- DDL: auth SCHEMA - Tablas adicionales para autenticación avanzada
-- ================================================

-- Tabla para tokens de refresh (JWT)
CREATE TABLE IF NOT EXISTS auth.refresh_token (
    rt_id SERIAL PRIMARY KEY,
    rt_token VARCHAR(500) UNIQUE NOT NULL,
    usu_id INT NOT NULL REFERENCES auth.usuario(usu_id) ON DELETE CASCADE,
    rt_fecha_expiracion TIMESTAMP NOT NULL,
    rt_fecha_creacion TIMESTAMP DEFAULT NOW(),
    rt_revocado BOOLEAN DEFAULT FALSE,
    rt_ip_address VARCHAR(45),
    rt_user_agent VARCHAR(500)
);

-- Tabla para auditoría de sesiones
CREATE TABLE IF NOT EXISTS auth.session_audit (
    sa_id SERIAL PRIMARY KEY,
    usu_id INT NOT NULL REFERENCES auth.usuario(usu_id) ON DELETE CASCADE,
    sa_evento VARCHAR(50) NOT NULL,
    sa_ip_address VARCHAR(45),
    sa_user_agent VARCHAR(500),
    sa_fecha_evento TIMESTAMP DEFAULT NOW(),
    sa_detalles VARCHAR(1000),
    sa_exitoso BOOLEAN NOT NULL
);

-- Tabla para tokens de reset de contraseña
CREATE TABLE IF NOT EXISTS auth.password_reset_token (
    prt_id SERIAL PRIMARY KEY,
    prt_token VARCHAR(255) UNIQUE NOT NULL,
    usu_id INT NOT NULL REFERENCES auth.usuario(usu_id) ON DELETE CASCADE,
    prt_fecha_expiracion TIMESTAMP NOT NULL,
    prt_fecha_creacion TIMESTAMP DEFAULT NOW(),
    prt_usado BOOLEAN DEFAULT FALSE,
    prt_ip_address VARCHAR(45)
);

-- Índices para mejorar performance
CREATE INDEX IF NOT EXISTS idx_refresh_token_usuario ON auth.refresh_token(usu_id);
CREATE INDEX IF NOT EXISTS idx_refresh_token_expiracion ON auth.refresh_token(rt_fecha_expiracion);
CREATE INDEX IF NOT EXISTS idx_session_audit_usuario ON auth.session_audit(usu_id);
CREATE INDEX IF NOT EXISTS idx_session_audit_fecha ON auth.session_audit(sa_fecha_evento);
CREATE INDEX IF NOT EXISTS idx_password_reset_usuario ON auth.password_reset_token(usu_id);
CREATE INDEX IF NOT EXISTS idx_password_reset_expiracion ON auth.password_reset_token(prt_fecha_expiracion);

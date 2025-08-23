-- ================================================
-- DML: auth SCHEMA - Datos de prueba
-- ================================================

-- Insertar roles básicos
INSERT INTO auth.rol (rol_nombre) VALUES 
('ADMIN'),
('PROFESIONAL'),
('EMPRESA')
ON CONFLICT (rol_nombre) DO NOTHING;

-- Insertar usuarios de prueba
INSERT INTO auth.usuario (usu_nombre, usu_email, usu_password, usu_activo) VALUES 
('Admin Sistema', 'admin@jobsearch.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iKXYLFSJbqL1f2T.rG3CEhLGfj1K', true),
('Juan Pérez', 'juan.perez@email.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iKXYLFSJbqL1f2T.rG3CEhLGfj1K', true),
('María García', 'maria.garcia@email.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iKXYLFSJbqL1f2T.rG3CEhLGfj1K', true),
('TechCorp SA', 'contacto@techcorp.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iKXYLFSJbqL1f2T.rG3CEhLGfj1K', true),
('InnovateLab', 'hr@innovatelab.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iKXYLFSJbqL1f2T.rG3CEhLGfj1K', true)
ON CONFLICT (usu_email) DO NOTHING;

-- Asignar roles a usuarios
INSERT INTO auth.usuario_rol (usu_id, rol_id) VALUES 
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'admin@jobsearch.com'), (SELECT rol_id FROM auth.rol WHERE rol_nombre = 'ADMIN')),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'juan.perez@email.com'), (SELECT rol_id FROM auth.rol WHERE rol_nombre = 'PROFESIONAL')),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'maria.garcia@email.com'), (SELECT rol_id FROM auth.rol WHERE rol_nombre = 'PROFESIONAL')),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'contacto@techcorp.com'), (SELECT rol_id FROM auth.rol WHERE rol_nombre = 'EMPRESA')),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'hr@innovatelab.com'), (SELECT rol_id FROM auth.rol WHERE rol_nombre = 'EMPRESA'))
ON CONFLICT (usu_id, rol_id) DO NOTHING;

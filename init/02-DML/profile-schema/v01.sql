-- ================================================
-- DML: perfil SCHEMA - Datos de prueba (Arquitectura y Construcción)
-- ================================================

-- Insertar perfiles profesionales en arquitectura y construcción
INSERT INTO perfil.profesional (usu_id, pro_nombre, pro_apellido, pro_titulo, pro_experiencia, pro_pais, pro_ciudad) VALUES 
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'juan.perez@email.com'), 'Juan', 'Pérez', 'Arquitecto Senior', '8 años de experiencia en diseño arquitectónico, especializado en edificaciones residenciales y comerciales. Manejo avanzado de AutoCAD, Revit, SketchUp y BIM.', 'Colombia', 'Bogotá'),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'maria.garcia@email.com'), 'María', 'García', 'Diseñadora de Interiores', '5 años diseñando espacios interiores innovadores y funcionales. Especialista en diseño sostenible y materiales eco-amigables. Experiencia en 3DS Max y renderizado.', 'México', 'Ciudad de México');

-- Insertar perfiles de empresas del sector construcción
INSERT INTO perfil.empresa (usu_id, emp_nombre, emp_sector, emp_pais, emp_ciudad) VALUES 
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'contacto@techcorp.com'), 'ArquiCorp Constructora', 'Construcción y Arquitectura', 'Colombia', 'Medellín'),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'hr@innovatelab.com'), 'Diseño Integral Lab', 'Diseño Arquitectónico y Consultoría', 'México', 'Guadalajara');

-- Insertar empresas adicionales para más variedad
INSERT INTO auth.usuario (usu_nombre, usu_email, usu_password, usu_activo) VALUES 
('EcoArqui Sostenible', 'contacto@ecoarqui.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', true),
('BIM Solutions Pro', 'hr@bimsolutions.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', true),
('Constructora Verde', 'rh@constructoraverde.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', true),
('Estructuras Avanzadas', 'empleo@estructurasav.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', true),
('Urbanismo Moderno', 'trabajo@urbanismo.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', true)
ON CONFLICT (usu_email) DO NOTHING;

-- Asignar rol de empresa a los nuevos usuarios
INSERT INTO auth.usuario_rol (usu_id, rol_id) VALUES 
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'contacto@ecoarqui.com'), 
 (SELECT rol_id FROM auth.rol WHERE rol_nombre = 'EMPRESA')),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'hr@bimsolutions.com'), 
 (SELECT rol_id FROM auth.rol WHERE rol_nombre = 'EMPRESA')),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'rh@constructoraverde.com'), 
 (SELECT rol_id FROM auth.rol WHERE rol_nombre = 'EMPRESA')),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'empleo@estructurasav.com'), 
 (SELECT rol_id FROM auth.rol WHERE rol_nombre = 'EMPRESA')),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'trabajo@urbanismo.com'), 
 (SELECT rol_id FROM auth.rol WHERE rol_nombre = 'EMPRESA'))
ON CONFLICT (usu_id, rol_id) DO NOTHING;

-- Insertar perfiles de las nuevas empresas
INSERT INTO perfil.empresa (usu_id, emp_nombre, emp_sector, emp_pais, emp_ciudad) VALUES 
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'contacto@ecoarqui.com'), 'EcoArqui Sostenible', 'Bioarquitectura y Construcción Sostenible', 'Costa Rica', 'San José'),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'hr@bimsolutions.com'), 'BIM Solutions Pro', 'Consultoría BIM y Modelado 3D', 'España', 'Madrid'),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'rh@constructoraverde.com'), 'Constructora Verde', 'Construcción Ecológica y LEED', 'Chile', 'Santiago'),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'empleo@estructurasav.com'), 'Estructuras Avanzadas', 'Ingeniería Estructural y Sísmica', 'Perú', 'Lima'),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'trabajo@urbanismo.com'), 'Urbanismo Moderno', 'Planificación Urbana y Smart Cities', 'Argentina', 'Buenos Aires');

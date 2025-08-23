-- ================================================
-- DML: job SCHEMA - 20 Ofertas Especializadas (Arquitectura y Construcción)
-- ================================================


-- Insertar empresas
INSERT INTO job.empresa (emp_nombre, emp_descripcion, emp_website, emp_logo_url) VALUES
('ArquiCorp Constructora', 'Empresa líder en construcción e innovación BIM', 'https://arquicorp.cl', 'https://arquicorp.cl/logo.png'),
('Diseño Integral Lab', 'Estudio de arquitectura sostenible y bioarquitectura', 'https://disenolab.cl', 'https://disenolab.cl/logo.png'),
('EcoArqui Sostenible', 'Consultoría en construcción verde y eficiencia energética', 'https://ecoarqui.cl', 'https://ecoarqui.cl/logo.png'),
('BIM Solutions Pro', 'Servicios avanzados de modelado BIM', 'https://bimsolutions.cl', 'https://bimsolutions.cl/logo.png'),
('Constructora Verde', 'Construcción sustentable y energías renovables', 'https://constructoraverde.cl', 'https://constructoraverde.cl/logo.png'),
('Estructuras Avanzadas', 'Ingeniería estructural avanzada', 'https://estructurasavanzadas.cl', 'https://estructurasavanzadas.cl/logo.png'),
('Urbanismo Moderno', 'Urbanismo y diseño de ciudades inteligentes', 'https://urbanismod.cl', 'https://urbanismod.cl/logo.png');

-- Insertar categorías
INSERT INTO job.categoria (cat_nombre, cat_descripcion) VALUES
('BIM', 'Metodología y coordinación BIM'),
('Bioarquitectura', 'Diseño y construcción sostenible'),
('Renderizado', 'Visualización arquitectónica 3D'),
('Eficiencia Energética', 'Optimización energética en edificaciones'),
('Urbanismo', 'Planificación y diseño urbano'),
('Estructuras', 'Ingeniería estructural avanzada');

-- Insertar ubicaciones (Chile)
INSERT INTO job.ubicacion (ubi_comuna, ubi_region, ubi_pais) VALUES
('Providencia', 'Región Metropolitana', 'Chile'),
('Las Condes', 'Región Metropolitana', 'Chile'),
('Valdivia', 'Región de Los Ríos', 'Chile'),
('Concepción', 'Región del Biobío', 'Chile'),
('Antofagasta', 'Región de Antofagasta', 'Chile');

INSERT INTO job.oferta (emp_id, cat_id, ubi_id, ofe_titulo, ofe_descripcion, ofe_modalidad, ofe_tipo_contrato, ofe_salario_min, ofe_salario_max, ofe_activo) VALUES
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'ArquiCorp Constructora'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'BIM'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Providencia'), 'Especialista BIM Coordinator Senior', 'Coordinador BIM con experiencia mínima 5 años en Revit, Navisworks y Solibri. Responsable de implementar metodología BIM en proyectos de construcción de gran escala. Conocimiento en estándares ISO 19650.', 'Híbrido', 'Tiempo completo', 1800000, 2500000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'ArquiCorp Constructora'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'BIM'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Las Condes'), 'Arquitecto Revit Specialist', 'Arquitecto especializado en modelado 3D con Revit Architecture. Experiencia en diseño paramétrico y documentación técnica.', 'Presencial', 'Tiempo completo', 1600000, 2200000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'Diseño Integral Lab'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'Bioarquitectura'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Valdivia'), 'Bioarquitecto Sostenible', 'Arquitecto especializado en bioarquitectura y construcción con materiales naturales.', 'Híbrido', 'Tiempo completo', 1500000, 2100000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'EcoArqui Sostenible'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'Eficiencia Energética'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Providencia'), 'Consultor en Construcción Sostenible LEED', 'Consultor certificado LEED AP con experiencia en proyectos de construcción verde.', 'Híbrido', 'Tiempo completo', 1700000, 2300000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'BIM Solutions Pro'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'BIM'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Concepción'), 'BIM Manager Senior', 'Gerente BIM con experiencia liderando implementación de metodologías BIM.', 'Híbrido', 'Tiempo completo', 2000000, 2700000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'Constructora Verde'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'Eficiencia Energética'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Antofagasta'), 'Ingeniero en Sistemas Renovables', 'Ingeniero especializado en integración de sistemas de energía renovable en edificaciones.', 'Híbrido', 'Tiempo completo', 1800000, 2400000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'Estructuras Avanzadas'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'Estructuras'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Providencia'), 'Ingeniero Estructural SAP2000/ETABS', 'Ingeniero civil estructural con dominio avanzado de SAP2000, ETABS y SAFE.', 'Presencial', 'Tiempo completo', 1900000, 2600000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'Urbanismo Moderno'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'Urbanismo'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Las Condes'), 'Planificador Urbano Smart Cities', 'Urbanista especializado en desarrollo de ciudades inteligentes.', 'Híbrido', 'Tiempo completo', 1700000, 2300000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'ArquiCorp Constructora'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'Renderizado'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Valdivia'), 'Renderista Arquitectónico 3D', 'Especialista en visualización arquitectónica con dominio avanzado de 3DS Max y V-Ray.', 'Remoto', 'Tiempo completo', 1400000, 2000000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'Diseño Integral Lab'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'Bioarquitectura'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Providencia'), 'Arquitecto Paisajista', 'Profesional en arquitectura del paisaje con enfoque en espacios públicos sustentables.', 'Presencial', 'Tiempo completo', 1500000, 2100000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'EcoArqui Sostenible'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'Eficiencia Energética'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Las Condes'), 'Especialista en Eficiencia Energética', 'Ingeniero o arquitecto especializado en análisis energético de edificaciones.', 'Remoto', 'Tiempo completo', 1600000, 2200000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'BIM Solutions Pro'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'BIM'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Antofagasta'), 'Modelador BIM Revit Structure', 'Especialista en modelado estructural con Revit Structure.', 'Presencial', 'Tiempo completo', 1700000, 2300000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'Constructora Verde'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'Eficiencia Energética'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Valdivia'), 'Especialista en Techos Verdes', 'Profesional con experiencia en diseño e instalación de sistemas de techos verdes.', 'Presencial', 'Tiempo completo', 1500000, 2100000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'Estructuras Avanzadas'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'Estructuras'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Concepción'), 'Especialista en Estructuras de Acero', 'Ingeniero especializado en diseño de estructuras metálicas.', 'Híbrido', 'Tiempo completo', 1800000, 2400000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'Urbanismo Moderno'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'Urbanismo'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Antofagasta'), 'Arquitecto Urban Design', 'Arquitecto especialista en diseño urbano y espacio público.', 'Presencial', 'Tiempo completo', 1600000, 2200000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'ArquiCorp Constructora'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'BIM'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Providencia'), 'Desarrollador Dynamo para Revit', 'Programador especializado en automatización de procesos en Revit usando Dynamo.', 'Remoto', 'Tiempo completo', 1700000, 2300000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'Diseño Integral Lab'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'Renderizado'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Las Condes'), 'Renderista Unreal Engine', 'Especialista en recorridos virtuales con Unreal Engine.', 'Remoto', 'Tiempo completo', 1400000, 2000000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'EcoArqui Sostenible'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'Bioarquitectura'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Concepción'), 'Arquitecto Especialista en Bambú', 'Arquitecto con experiencia en diseño y construcción con bambú.', 'Presencial', 'Tiempo completo', 1500000, 2100000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'BIM Solutions Pro'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'BIM'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Valdivia'), 'BIM Coordinator Junior', 'Coordinador BIM con experiencia básica en Revit.', 'Híbrido', 'Tiempo completo', 1200000, 1700000, true),
((SELECT emp_id FROM job.empresa WHERE emp_nombre = 'Constructora Verde'), (SELECT cat_id FROM job.categoria WHERE cat_nombre = 'Eficiencia Energética'), (SELECT ubi_id FROM job.ubicacion WHERE ubi_comuna = 'Providencia'), 'Project Manager Construcción Verde', 'Gerente de proyectos especializado en construcción sustentable.', 'Presencial', 'Tiempo completo', 2000000, 2700000, true);

-- Insertar postulaciones de ejemplo para las nuevas ofertas
INSERT INTO job.postulacion (ofe_id, pro_id, pos_estado) VALUES 
((SELECT ofe_id FROM job.oferta WHERE ofe_titulo = 'Especialista BIM Coordinator Senior'), 
 (SELECT pro_id FROM perfil.profesional WHERE pro_nombre = 'Juan' AND pro_apellido = 'Pérez'), 
 'En revisión'),
((SELECT ofe_id FROM job.oferta WHERE ofe_titulo = 'Bioarquitecto Sostenible'), 
 (SELECT pro_id FROM perfil.profesional WHERE pro_nombre = 'María' AND pro_apellido = 'García'), 
 'Entrevista programada'),
((SELECT ofe_id FROM job.oferta WHERE ofe_titulo = 'Renderista Arquitectónico 3D'), 
 (SELECT pro_id FROM perfil.profesional WHERE pro_nombre = 'María' AND pro_apellido = 'García'), 
 'Preseleccionado');

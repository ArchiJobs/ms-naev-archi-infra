-- ================================================
-- DML: pago SCHEMA - Datos de prueba (Arquitectura y Construcción)
-- ================================================

-- Insertar planes de pago especializados para construcción
INSERT INTO pago.plan (pla_nombre, pla_precio, pla_duracion, pla_descripcion) VALUES 
('Plan Estudio', 39.99, 30, 'Plan básico para estudios de arquitectura pequeños. Hasta 3 ofertas activas por mes y funciones básicas de reclutamiento.'),
('Plan Constructora', 79.99, 30, 'Plan profesional para empresas constructoras medianas. Hasta 15 ofertas activas, filtros avanzados por especialización y experiencia.'),
('Plan Corporativo', 149.99, 30, 'Plan empresarial para grandes constructoras y desarrolladores inmobiliarios. Ofertas ilimitadas, soporte prioritario y herramientas de análisis.'),
('Plan Estudio Anual', 399.99, 365, 'Plan básico anual para estudios con 20% de descuento. Ideal para pequeños despachos de arquitectura.'),
('Plan Constructora Anual', 799.99, 365, 'Plan profesional anual con 20% de descuento. Perfecto para empresas constructoras en crecimiento.');

-- Insertar transacciones de ejemplo
INSERT INTO pago.transaccion (usu_id, pla_id, tra_monto, tra_estado) VALUES 
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'contacto@techcorp.com'), 
 (SELECT pla_id FROM pago.plan WHERE pla_nombre = 'Plan Constructora'), 
 79.99, 
 'Completado'),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'hr@innovatelab.com'), 
 (SELECT pla_id FROM pago.plan WHERE pla_nombre = 'Plan Estudio'), 
 39.99, 
 'Completado');

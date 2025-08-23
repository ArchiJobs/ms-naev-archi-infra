-- ================================================
-- DML: interaccion SCHEMA - Datos de prueba (Arquitectura y Construcción)
-- ================================================

-- Insertar notificaciones de ejemplo
INSERT INTO interaccion.notificacion (usu_id, not_mensaje, not_leido) VALUES 
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'juan.perez@email.com'), 
 'Tu postulación para Arquitecto Proyectista Senior ha sido recibida exitosamente.', 
 false),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'maria.garcia@email.com'), 
 'Tienes una entrevista programada para el puesto de Diseñador de Interiores Especializado.', 
 false),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'contacto@techcorp.com'), 
 'Nueva postulación recibida para tu oferta de Arquitecto Proyectista Senior.', 
 true),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'hr@innovatelab.com'), 
 'Tu suscripción al Plan Profesional para empresas constructoras ha sido activada exitosamente.', 
 true);

-- Insertar historial de acciones
INSERT INTO interaccion.historial (usu_id, his_accion) VALUES 
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'juan.perez@email.com'), 'Login exitoso'),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'juan.perez@email.com'), 'Postulación enviada a: Arquitecto Proyectista Senior'),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'maria.garcia@email.com'), 'Login exitoso'),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'maria.garcia@email.com'), 'Perfil de diseñadora actualizado'),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'contacto@techcorp.com'), 'Nueva oferta publicada: Arquitecto Proyectista Senior'),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'hr@innovatelab.com'), 'Suscripción activada: Plan Profesional Constructoras');

-- Insertar datos analíticos
INSERT INTO interaccion.analitica (usu_id, ana_tipo, ana_valor) VALUES 
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'juan.perez@email.com'), 'profile_views', 18),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'juan.perez@email.com'), 'job_applications', 4),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'maria.garcia@email.com'), 'profile_views', 25),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'maria.garcia@email.com'), 'job_applications', 3),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'contacto@techcorp.com'), 'job_posts', 2),
((SELECT usu_id FROM auth.usuario WHERE usu_email = 'hr@innovatelab.com'), 'job_posts', 2);

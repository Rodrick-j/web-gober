-- =====================================================
-- 09_seed_secretarias.sql
-- Datos iniciales: Las 10 Secretarías Departamentales
-- EJECUTAR NOVENO
-- =====================================================

INSERT INTO secretarias (nombre, nombre_corto, slug, descripcion, color_acento, icono, orden) VALUES

('Secretaría General',
 'Sec. General',
 'secretaria-general',
 'Responsable de la coordinación general de las actividades administrativas y de gestión del Gobierno Autónomo Departamental de Oruro.',
 '#1E40AF', '🏛️', 1),

('Secretaría Departamental de Desarrollo Productivo e Industria',
 'Desarrollo Productivo',
 'desarrollo-productivo-industria',
 'Impulsa el desarrollo económico del departamento promoviendo la industrialización, el emprendimiento y la producción agropecuaria.',
 '#065F46', '🏭', 2),

('Secretaría Departamental de Cultura y Turismo',
 'Cultura y Turismo',
 'cultura-turismo',
 'Preserva y promueve el patrimonio cultural, las tradiciones y el turismo del Departamento de Oruro, hogar del Carnaval declarado Patrimonio de la Humanidad por la UNESCO.',
 '#7C3AED', '🎭', 3),

('Secretaría Departamental de Obras Públicas',
 'Obras Públicas',
 'obras-publicas',
 'Planifica, ejecuta y supervisa los proyectos de infraestructura vial, construcciones y equipamiento departamental.',
 '#D97706', '🏗️', 4),

('Secretaría Departamental de Minería, Metalurgia y Recursos Energéticos',
 'Minería y Energía',
 'mineria-metalurgia-recursos-energeticos',
 'Gestiona los recursos minerales y energéticos del departamento, promoviendo la minería responsable y el desarrollo metalúrgico.',
 '#374151', '⛏️', 5),

('Secretaría Departamental de Medio Ambiente, Agua y Madre Tierra',
 'Medio Ambiente',
 'medio-ambiente-agua-madre-tierra',
 'Vela por la protección del medio ambiente, la gestión de recursos hídricos y la preservación de los ecosistemas departamentales.',
 '#047857', '🌿', 6),

('Secretaría Departamental de Desarrollo Social y Seguridad Alimentaria',
 'Desarrollo Social',
 'desarrollo-social-seguridad-alimentaria',
 'Promueve el bienestar social, la seguridad alimentaria y la atención a grupos vulnerables del departamento.',
 '#DC2626', '🤝', 7),

('Secretaría Departamental de Planificación del Desarrollo',
 'Planificación',
 'planificacion-desarrollo',
 'Coordina la planificación estratégica y el seguimiento de los planes de desarrollo departamental a corto, mediano y largo plazo.',
 '#0369A1', '📊', 8),

('Secretaría Departamental de Asuntos Jurídicos',
 'Asuntos Jurídicos',
 'asuntos-juridicos',
 'Brinda asesoramiento legal al Gobierno Departamental y gestiona los procesos jurídicos, contratos y normativa legal.',
 '#1F2937', '⚖️', 9),

('Secretaría Departamental de Administración y Finanzas Públicas',
 'Administración y Finanzas',
 'administracion-finanzas-publicas',
 'Administra los recursos financieros, presupuestarios y patrimoniales del Gobierno Autónomo Departamental de Oruro.',
 '#B45309', '💼', 10);

-- Verificar que se insertaron las 10 secretarías
SELECT id, nombre_corto, slug, orden FROM secretarias ORDER BY orden;

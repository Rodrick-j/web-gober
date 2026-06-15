-- =====================================================
-- 10_seed_noticias_ejemplo.sql
-- Datos de ejemplo: 5 noticias para probar el sistema
-- EJECUTAR DÉCIMO (opcional — solo para pruebas)
-- =====================================================

-- Insertar noticias de ejemplo usando los slugs de las secretarías
INSERT INTO noticias (
  secretaria_id, titulo, slug, resumen, contenido,
  categoria, estado, es_destacada, es_urgente,
  fecha_publicacion, autor_nombre, vistas
)
SELECT
  s.id,
  'Gobernación de Oruro firma histórico convenio de cooperación con la Unión Europea',
  'convenio-union-europea-2026',
  'El acuerdo contempla una inversión de 45 millones de dólares para proyectos de agua, energía solar y capacitación técnica.',
  '<p>El Gobierno Autónomo Departamental de Oruro suscribió un histórico convenio de cooperación internacional con la delegación de la Unión Europea en Bolivia.</p><p>El acuerdo, firmado en la sede gubernamental, contempla una inversión de 45 millones de dólares destinados a ejecutarse durante los próximos 5 años en proyectos estratégicos para el desarrollo del departamento.</p>',
  'institucional', 'publicado', true, false,
  NOW() - INTERVAL '1 day',
  'Oficina de Comunicación GADO',
  1247
FROM secretarias s WHERE s.slug = 'secretaria-general'
LIMIT 1;

INSERT INTO noticias (
  secretaria_id, titulo, slug, resumen,
  categoria, estado, es_destacada,
  fecha_publicacion, autor_nombre, vistas
)
SELECT
  s.id,
  'Inauguración del nuevo hospital departamental de Challapata con tecnología de última generación',
  'hospital-challapata-2026',
  'La obra representa una inversión de 28 millones de bolivianos y atenderá a más de 80,000 habitantes de la provincia.',
  'salud', 'publicado', true,
  NOW() - INTERVAL '2 days',
  'Prensa Desarrollo Social',
  892
FROM secretarias s WHERE s.slug = 'desarrollo-social-seguridad-alimentaria'
LIMIT 1;

INSERT INTO noticias (
  secretaria_id, titulo, slug, resumen,
  categoria, estado, es_urgente,
  fecha_publicacion, autor_nombre, vistas
)
SELECT
  s.id,
  'Carnaval de Oruro 2027 — Convocatoria oficial para conjuntos folklóricos',
  'convocatoria-carnaval-2027',
  'La Secretaría de Cultura y Turismo abre la convocatoria para los 48 conjuntos que participarán en el Carnaval de Oruro 2027.',
  'cultura', 'publicado', true,
  NOW() - INTERVAL '3 days',
  'Prensa Cultura y Turismo',
  2103
FROM secretarias s WHERE s.slug = 'cultura-turismo'
LIMIT 1;

INSERT INTO noticias (
  secretaria_id, titulo, slug, resumen,
  categoria, estado,
  fecha_publicacion, autor_nombre, vistas
)
SELECT
  s.id,
  'Inicio de obras del corredor vial Oruro-Caracollo — 45 km de asfalto nuevo',
  'corredor-vial-oruro-caracollo-2026',
  'El proyecto de 180 millones de bolivianos mejorará la conectividad entre Oruro y los municipios del norte del departamento.',
  'infraestructura', 'publicado',
  NOW() - INTERVAL '5 days',
  'Prensa Obras Públicas',
  654
FROM secretarias s WHERE s.slug = 'obras-publicas'
LIMIT 1;

INSERT INTO noticias (
  secretaria_id, titulo, slug, resumen,
  categoria, estado,
  fecha_publicacion, autor_nombre, vistas
)
SELECT
  s.id,
  'Programa "Oruro Verde" planta 50,000 árboles nativos en las riberas del río Desaguadero',
  'oruro-verde-50000-arboles-2026',
  'La iniciativa busca recuperar los ecosistemas degradados y frenar la erosión en las cuencas hídricas del departamento.',
  'medio_ambiente', 'publicado',
  NOW() - INTERVAL '7 days',
  'Prensa Medio Ambiente',
  428
FROM secretarias s WHERE s.slug = 'medio-ambiente-agua-madre-tierra'
LIMIT 1;

-- Verificar noticias insertadas
SELECT n.titulo, s.nombre_corto, n.estado, n.vistas
FROM noticias n
JOIN secretarias s ON n.secretaria_id = s.id
ORDER BY n.created_at DESC;

-- =====================================================
-- 12_views_utiles.sql
-- Vistas SQL para facilitar consultas frecuentes
-- EJECUTAR DUODÉCIMO (opcional pero recomendado)
-- =====================================================

-- Vista: Noticias publicadas con nombre de secretaría
CREATE OR REPLACE VIEW v_noticias_publicas AS
SELECT
  n.id,
  n.titulo,
  n.slug,
  n.resumen,
  n.imagen_portada_url,
  n.categoria,
  n.estado,
  n.es_destacada,
  n.es_urgente,
  n.fecha_publicacion,
  n.vistas,
  n.video_youtube_url,
  s.id           AS secretaria_id,
  s.nombre       AS secretaria_nombre,
  s.nombre_corto AS secretaria_nombre_corto,
  s.slug         AS secretaria_slug,
  s.color_acento AS secretaria_color,
  s.icono        AS secretaria_icono
FROM noticias n
JOIN secretarias s ON n.secretaria_id = s.id
WHERE n.estado = 'publicado'
  AND s.activo = true
  AND (n.fecha_expiracion IS NULL OR n.fecha_expiracion > NOW())
ORDER BY n.fecha_publicacion DESC;

-- Vista: Documentos de la Gaceta Oficial
CREATE OR REPLACE VIEW v_gaceta_oficial AS
SELECT
  d.id,
  d.tipo,
  d.numero,
  d.titulo,
  d.descripcion,
  d.archivo_url,
  d.archivo_nombre,
  d.estado_doc,
  d.fecha_publicacion,
  d.vistas,
  d.descargas,
  s.nombre       AS secretaria_nombre,
  s.nombre_corto AS secretaria_nombre_corto,
  s.slug         AS secretaria_slug
FROM documentos d
LEFT JOIN secretarias s ON d.secretaria_id = s.id
WHERE d.es_gaceta_oficial = true
  AND d.es_publico = true
ORDER BY d.fecha_publicacion DESC;

-- Vista: Dashboard — Resumen de estadísticas por secretaría
CREATE OR REPLACE VIEW v_stats_por_secretaria AS
SELECT
  s.id,
  s.nombre_corto,
  s.slug,
  s.color_acento,
  s.icono,
  COUNT(DISTINCT n.id) FILTER (WHERE n.estado = 'publicado') AS noticias_publicadas,
  COUNT(DISTINCT n.id) FILTER (WHERE n.estado = 'borrador')  AS noticias_borrador,
  COUNT(DISTINCT d.id)                                        AS total_documentos,
  COUNT(DISTINCT p.id) FILTER (WHERE p.estado = 'en_ejecucion') AS proyectos_activos,
  COALESCE(SUM(n.vistas), 0)                                  AS total_vistas
FROM secretarias s
LEFT JOIN noticias  n ON n.secretaria_id = s.id
LEFT JOIN documentos d ON d.secretaria_id = s.id
LEFT JOIN proyectos  p ON p.secretaria_id = s.id
WHERE s.activo = true
GROUP BY s.id, s.nombre_corto, s.slug, s.color_acento, s.icono
ORDER BY s.orden;

-- Vista: Resumen general del sistema (para el dashboard super_admin)
CREATE OR REPLACE VIEW v_stats_generales AS
SELECT
  (SELECT COUNT(*) FROM noticias WHERE estado = 'publicado')    AS total_noticias_publicadas,
  (SELECT COUNT(*) FROM noticias WHERE estado = 'borrador')      AS total_borradores,
  (SELECT COUNT(*) FROM documentos WHERE es_gaceta_oficial=true) AS total_gaceta,
  (SELECT COUNT(*) FROM proyectos WHERE estado = 'en_ejecucion') AS proyectos_activos,
  (SELECT COUNT(*) FROM usuarios_admin WHERE activo = true)      AS usuarios_activos,
  (SELECT COALESCE(SUM(vistas),0) FROM noticias)                 AS total_vistas;

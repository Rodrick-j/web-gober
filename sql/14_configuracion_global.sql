-- =====================================================
-- 14_configuracion_global.sql
-- Tabla para almacenar configuraciones dinámicas (Ticker, Redes, etc)
-- =====================================================

CREATE TABLE IF NOT EXISTS configuracion_global (
  clave       TEXT PRIMARY KEY,
  valor       JSONB NOT NULL,
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

-- Políticas RLS
ALTER TABLE configuracion_global ENABLE ROW LEVEL SECURITY;

-- Lectura pública para cualquier configuración
CREATE POLICY "Lectura pública de configuracion_global"
  ON configuracion_global FOR SELECT
  USING (true);

-- Modificación solo para super_admin (o admin_general)
CREATE POLICY "Admins gestionan configuracion_global"
  ON configuracion_global FOR ALL
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios_admin 
      WHERE auth_user_id = auth.uid() AND activo = true
    )
  );

-- =====================================================
-- Insertar valores iniciales por defecto
-- =====================================================

-- 1. Texto Recorrido (Ticker Noticias)
INSERT INTO configuracion_global (clave, valor)
VALUES (
  'ticker_noticias',
  '{
    "velocidad_segundos": 60,
    "mensajes": [
      "🔴 ORURO CONMEMORA 198 AÑOS DE SU CREACIÓN CON MENSAJES DE UNIDAD Y PROGRESO",
      "📋 NUEVO DECRETO EJECUTIVO PARA MODERNIZACIÓN DE SERVICIOS PÚBLICOS EN EL DEPARTAMENTO",
      "🏗️ GOBERNACIÓN INAUGURA PROYECTO DE INFRAESTRUCTURA VIAL EN PROVINCIA CERCADO",
      "🌱 PROGRAMA DE REFORESTACIÓN DEPARTAMENTAL SUPERA LAS 50,000 PLANTAS SEMBRADAS",
      "🎓 BECAS DEPARTAMENTALES 2026 — CONVOCATORIA ABIERTA PARA ESTUDIANTES ORUREÑOS"
    ]
  }'::jsonb
) ON CONFLICT (clave) DO NOTHING;

-- 2. Redes Sociales
INSERT INTO configuracion_global (clave, valor)
VALUES (
  'redes_sociales',
  '{
    "facebook": "https://facebook.com/gobernaciondeoruro",
    "twitter": "https://x.com/gobernacionoruro",
    "youtube": "https://youtube.com/c/gobernacionoruro",
    "instagram": "https://instagram.com/gobernaciondeoruro",
    "tiktok": "https://tiktok.com/@gobernaciondeoruro"
  }'::jsonb
) ON CONFLICT (clave) DO NOTHING;

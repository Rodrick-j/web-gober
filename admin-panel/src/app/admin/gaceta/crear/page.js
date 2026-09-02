'use client';
import { useState, useEffect } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { normalizarUrlDrive } from '@/lib/driveUtils';
import Link from 'next/link';
import styles from '../page.module.css';

const TIPOS = [
  { value: 'ley_departamental',         label: 'Ley Departamental' },
  { value: 'decreto_departamental',     label: 'Decreto Departamental' },
  { value: 'decreto_ejecutivo',         label: 'Decreto Ejecutivo' },
  { value: 'resolucion_administrativa', label: 'Resolución Administrativa' },
  { value: 'resolucion_secretarial',    label: 'Resolución Secretarial' },
  { value: 'convenio',                  label: 'Convenio' },
  { value: 'contrato',                  label: 'Contrato' },
  { value: 'otro',                      label: 'Otro' },
];

export default function CrearDocumentoPage() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const supabase = createClient();

  const [tipo, setTipo] = useState('ley_departamental');
  const [numero, setNumero] = useState('');
  const [titulo, setTitulo] = useState('');
  const [esPublico, setEsPublico] = useState(true);
  const [driveUrl, setDriveUrl] = useState('');
  const [fechaPublicacion, setFechaPublicacion] = useState(() => new Date().toISOString().split('T')[0]);

  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState('');

  // Leer tipo de la URL si existe
  useEffect(() => {
    const urlTipo = searchParams.get('tipo');
    if (urlTipo) setTipo(urlTipo);
  }, [searchParams]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!titulo || !tipo || !numero) {
      setError('El tipo, número y título son obligatorios.');
      return;
    }
    if (!driveUrl.trim()) {
      setError('Debes pegar el link de Google Drive del PDF.');
      return;
    }

    setIsSubmitting(true);
    setError('');

    try {
      // ── Verificar si ya existe un documento con el mismo tipo + número ──
      const { data: existente } = await supabase
        .from('documentos')
        .select('id, titulo')
        .eq('tipo', tipo)
        .eq('numero', numero)
        .maybeSingle();

      if (existente) {
        setError(
          `⚠️ Ya existe un documento con el número "${numero}" en esta categoría.\n` +
          `Título actual: "${existente.titulo}".\n` +
          `Si quieres corregirlo, usa la opción Editar en la lista.`
        );
        setIsSubmitting(false);
        return;
      }

      const archivoUrl = normalizarUrlDrive(driveUrl);

      const { error: insertError } = await supabase
        .from('documentos')
        .insert({
          tipo,
          numero,
          titulo,
          archivo_url: archivoUrl,
          es_publico: esPublico,
          es_gaceta_oficial: esPublico,
          fecha_publicacion: fechaPublicacion || new Date().toISOString().split('T')[0],
        });

      if (insertError) throw insertError;

      router.push('/admin/gaceta');
      router.refresh();
    } catch (err) {
      console.error(err);
      setError('Ocurrió un error: ' + err.message);
      setIsSubmitting(false);
    }
  };

  return (
    <div className="adminPage">
      <div className={styles.header}>
        <div>
          <h1 className="adminTitle">Cargar Nuevo Documento</h1>
          <p className="adminSubtitle">Agrega una Ley, Decreto o Resolución a la Gaceta.</p>
        </div>
        <Link href="/admin/gaceta" className="btnSecondary">Volver</Link>
      </div>

      {/* Instrucciones Drive */}
      <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '12px', padding: '1rem 1.25rem', marginBottom: '1.5rem', display: 'flex', gap: '1rem', alignItems: 'flex-start' }}>
        <div style={{ fontSize: '1.4rem', flexShrink: 0 }}>📁</div>
        <div style={{ fontSize: '0.85rem', color: 'var(--admin-text-muted)', lineHeight: '1.6' }}>
          <strong style={{ color: 'var(--admin-text)' }}>¿Cómo obtener el link de Google Drive?</strong><br />
          1. Sube el PDF a Google Drive → clic derecho → <em>Compartir</em><br />
          2. Cambia el acceso a <strong>"Cualquiera con el enlace"</strong><br />
          3. Haz clic en <strong>"Copiar enlace"</strong> y pégalo abajo
        </div>
      </div>

      <div className="tableCard">
        <form onSubmit={handleSubmit} className={styles.formContainer}>
          {error && <div className={styles.errorAlert}>{error}</div>}

          <div className={styles.grid}>
            <div className={styles.mainCol}>
              <div className="formGroup">
                <label className="formLabel">Tipo de Documento *</label>
                <select
                  className="formSelect"
                  value={tipo}
                  onChange={(e) => setTipo(e.target.value)}
                  required
                  disabled={isSubmitting}
                >
                  {TIPOS.map(t => <option key={t.value} value={t.value}>{t.label}</option>)}
                </select>
              </div>

              <div className="formGroup">
                <label className="formLabel">Número de Documento *</label>
                <input
                  type="text"
                  className="formInput"
                  placeholder="Ej: N° 123/2026"
                  value={numero}
                  onChange={(e) => setNumero(e.target.value)}
                  required
                  disabled={isSubmitting}
                />
              </div>

              <div className="formGroup">
                <label className="formLabel">Título / Descripción Breve *</label>
                <textarea
                  className="formTextarea"
                  placeholder="Ej: Ley que declara Patrimonio Cultural a..."
                  value={titulo}
                  onChange={(e) => setTitulo(e.target.value)}
                  style={{ minHeight: '80px' }}
                  required
                  disabled={isSubmitting}
                />
              </div>

              <div className="formGroup">
                <label className="formLabel">Link de Google Drive (PDF) *</label>
                <input
                  type="url"
                  className="formInput"
                  placeholder="https://drive.google.com/file/d/..."
                  value={driveUrl}
                  onChange={(e) => setDriveUrl(e.target.value)}
                  disabled={isSubmitting}
                />
                {driveUrl && !driveUrl.includes('drive.google.com') && (
                  <p style={{ fontSize: '0.78rem', color: '#d97706', marginTop: '0.3rem' }}>
                    ⚠️ El link no parece ser de Google Drive. Asegúrate de copiar el enlace correcto.
                  </p>
                )}
                {driveUrl && driveUrl.includes('drive.google.com') && (
                  <p style={{ fontSize: '0.78rem', color: '#059669', marginTop: '0.3rem' }}>
                    ✅ Link de Drive detectado.
                  </p>
                )}
              </div>
            </div>

            <div className={styles.sideCol}>
              <div className="formGroup">
                <label className="formLabel">Estado de Publicación</label>
                <select
                  className="formSelect"
                  value={esPublico ? 'publico' : 'oculto'}
                  onChange={(e) => setEsPublico(e.target.value === 'publico')}
                  disabled={isSubmitting}
                >
                  <option value="publico">Público (Visible en la web)</option>
                  <option value="oculto">Oculto (Borrador interno)</option>
                </select>
              </div>

              <div className="formGroup">
                <label className="formLabel">Fecha de Publicación</label>
                <input
                  type="date"
                  className="formInput"
                  value={fechaPublicacion}
                  onChange={(e) => setFechaPublicacion(e.target.value)}
                  disabled={isSubmitting}
                  id="gaceta-fecha-publicacion"
                />
                <p style={{ fontSize: '0.78rem', color: 'var(--admin-text-muted)', marginTop: '0.25rem' }}>
                  Por defecto usa la fecha actual. Cámbiala si el documento es de otra fecha.
                </p>
              </div>

              <button
                type="submit"
                className={`btnPrimary ${styles.submitBtn}`}
                disabled={isSubmitting}
              >
                {isSubmitting ? '⏳ Guardando...' : '💾 Guardar Documento'}
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
}

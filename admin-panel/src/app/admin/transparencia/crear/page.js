'use client';
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { uploadPdfAction } from '../../gaceta/actions';
import Link from 'next/link';
import styles from '../page.module.css';

export default function CrearDocumentoTransparenciaPage() {
  const router = useRouter();
  const supabase = createClient();

  const [tipo, setTipo] = useState('rendicion_cuentas');
  const [gestion, setGestion] = useState(() => new Date().getFullYear());
  const [titulo, setTitulo] = useState('');
  const [esPublico, setEsPublico] = useState(true);
  const [archivo, setArchivo] = useState(null);
  const [fechaPublicacion, setFechaPublicacion] = useState(() => new Date().toISOString().split('T')[0]);
  
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [uploadProgress, setUploadProgress] = useState(0);
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!titulo || !tipo || !gestion) {
      setError('El tipo, gestión y título son obligatorios.');
      return;
    }
    if (!archivo) {
      setError('Debe subir un documento PDF.');
      return;
    }

    const MAX_FILE_SIZE_MB = 50;
    const fileSizeInMB = archivo.size / (1024 * 1024);
    if (fileSizeInMB > MAX_FILE_SIZE_MB) {
      setError(`El archivo es demasiado grande (${fileSizeInMB.toFixed(1)} MB). El tamaño máximo permitido por el servidor es de ${MAX_FILE_SIZE_MB} MB. Por favor, comprime tu PDF en ilovepdf.com o escanea a menor resolución.`);
      return;
    }

    setIsSubmitting(true);
    setUploadProgress(10);
    setError('');

    try {
      const formData = new FormData();
      formData.append('file', archivo);
      
      const publicUrl = await uploadPdfAction(formData);
      setUploadProgress(80);

      // Guardar metadatos en tabla transparencia_documentos
      const { error: insertError } = await supabase
        .from('transparencia_documentos')
        .insert({
          tipo,
          gestion: parseInt(gestion, 10),
          titulo,
          archivo_url: publicUrl,
          es_publico: esPublico,
          fecha_publicacion: fechaPublicacion || new Date().toISOString().split('T')[0]
        });

      if (insertError) throw insertError;
      setUploadProgress(100);

      router.push('/admin/transparencia');
      router.refresh();

    } catch (err) {
      console.error(err);
      setError('Ocurrió un error: ' + err.message);
      setIsSubmitting(false);
      setUploadProgress(0);
    }
  };

  return (
    <div className="adminPage">
      <div className={styles.header}>
        <div>
          <h1 className="adminTitle">Cargar Nuevo Documento de Transparencia</h1>
          <p className="adminSubtitle">Agrega una Rendición de Cuentas, Auditoría o Actividad.</p>
        </div>
        <Link href="/admin/transparencia" className="btnSecondary">
          Volver
        </Link>
      </div>

      <div className="tableCard">
        <form onSubmit={handleSubmit} className={styles.formContainer}>
          
          {error && <div className={styles.errorAlert}>{error}</div>}

          {isSubmitting && (
            <div style={{
              background: 'var(--admin-surface-2)',
              borderRadius: '12px',
              padding: '1.25rem',
              marginBottom: '1rem',
            }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '0.5rem', fontSize: '0.9rem', color: 'var(--admin-text-muted)' }}>
                <span>
                  {uploadProgress < 30 ? '🔐 Obteniendo permiso seguro...' :
                   uploadProgress < 80 ? '📤 Subiendo PDF a Supabase...' :
                   uploadProgress < 100 ? '💾 Guardando en base de datos...' :
                   '✅ ¡Completado!'}
                </span>
                <span>{uploadProgress}%</span>
              </div>
              <div style={{ background: 'var(--admin-border)', borderRadius: '999px', height: '6px', overflow: 'hidden' }}>
                <div style={{
                  height: '100%',
                  width: `${uploadProgress}%`,
                  background: 'linear-gradient(90deg, var(--color-primary), #dc2626)',
                  borderRadius: '999px',
                  transition: 'width 0.4s ease'
                }} />
              </div>
            </div>
          )}

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
                  <option value="rendicion_cuentas">Rendición de Cuentas</option>
                  <option value="actividades">Actividades</option>
                  <option value="reclamos">Formulario de Reclamos</option>
                  <option value="auditoria_gador">Auditoría G.A.D.O.R.</option>
                  <option value="auditoria_sedcam">Auditoría S.E.D.C.A.M.</option>
                  <option value="auditoria_sedeges">Auditoría S.E.D.E.G.E.S.</option>
                  <option value="auditoria_sedes">Auditoría S.E.D.E.S.</option>
                </select>
              </div>

              <div className="formGroup">
                <label className="formLabel">Gestión (Año) *</label>
                <select
                  className="formSelect"
                  value={gestion}
                  onChange={(e) => setGestion(e.target.value)}
                  required
                  disabled={isSubmitting}
                >
                  {Array.from({ length: 20 }, (_, i) => new Date().getFullYear() + 1 - i).map(year => (
                    <option key={year} value={year}>{year}</option>
                  ))}
                </select>
              </div>

              <div className="formGroup">
                <label className="formLabel">Título del Documento *</label>
                <input 
                  type="text" 
                  className="formInput"
                  value={titulo}
                  onChange={(e) => setTitulo(e.target.value)}
                  placeholder="Ej: Audiencia Pública Final..."
                  required
                  disabled={isSubmitting}
                />
              </div>

              <div className="formGroup">
                <label className="formLabel">Archivo PDF *</label>
                <div style={{
                  border: '2px dashed var(--admin-border)',
                  borderRadius: '12px',
                  padding: '2rem',
                  textAlign: 'center',
                  background: 'var(--admin-surface-2)',
                  cursor: 'pointer'
                }}>
                  <input 
                    type="file" 
                    accept="application/pdf"
                    onChange={(e) => setArchivo(e.target.files[0])}
                    disabled={isSubmitting}
                    id="file-upload"
                    style={{ display: 'none' }}
                  />
                  <label htmlFor="file-upload" style={{ cursor: 'pointer', display: 'flex', flexDirection: 'column', alignItems: 'center', gap: '0.5rem' }}>
                    <div style={{ fontSize: '2rem' }}>📄</div>
                    {archivo ? (
                      <span style={{ fontWeight: 600, color: 'var(--color-primary)' }}>{archivo.name}</span>
                    ) : (
                      <>
                        <span style={{ fontWeight: 600, color: 'var(--admin-text)' }}>Haz clic para seleccionar el PDF</span>
                        <span style={{ fontSize: '0.85rem', color: 'var(--admin-text-muted)' }}>Solo archivos en formato .pdf</span>
                      </>
                    )}
                  </label>
                </div>
              </div>
            </div>

            <div className={styles.sideCol}>
              <div className="formGroup">
                <label className="formLabel">Estado de Publicación</label>
                <div style={{
                  display: 'flex',
                  gap: '0.5rem',
                  padding: '1rem',
                  background: 'var(--admin-surface-2)',
                  borderRadius: '12px',
                  border: '1px solid var(--admin-border)'
                }}>
                  <input 
                    type="checkbox" 
                    id="esPublico"
                    checked={esPublico}
                    onChange={(e) => setEsPublico(e.target.checked)}
                    disabled={isSubmitting}
                    style={{ width: '1.2rem', height: '1.2rem', accentColor: 'var(--color-primary)' }}
                  />
                  <label htmlFor="esPublico" style={{ cursor: 'pointer', fontSize: '0.9rem' }}>
                    <strong>Visible al público</strong>
                    <p style={{ fontSize: '0.8rem', color: 'var(--admin-text-muted)', marginTop: '0.2rem' }}>
                      Si está marcado, aparecerá en el portal de Transparencia de la Gobernación.
                    </p>
                  </label>
                </div>
              </div>

              <div className="formGroup">
                <label className="formLabel">Fecha de Publicación</label>
                <input 
                  type="date" 
                  className="formInput"
                  value={fechaPublicacion}
                  onChange={(e) => setFechaPublicacion(e.target.value)}
                  disabled={isSubmitting}
                />
              </div>

              <div style={{ marginTop: '2rem' }}>
                <button 
                  type="submit" 
                  className="btnPrimary"
                  style={{ width: '100%', padding: '0.85rem' }}
                  disabled={isSubmitting}
                >
                  {isSubmitting ? 'Guardando...' : 'Guardar y Publicar'}
                </button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
}

'use client';
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { getSignedUploadUrl } from '../actions';
import FileUpload from '@/components/admin/FileUpload/FileUpload';
import Link from 'next/link';
import styles from '../page.module.css';

export default function CrearDocumentoPage() {
  const router = useRouter();
  const supabase = createClient();

  const [tipo, setTipo] = useState('ley_departamental');
  const [numero, setNumero] = useState('');
  const [titulo, setTitulo] = useState('');
  const [esPublico, setEsPublico] = useState(true);
  const [archivo, setArchivo] = useState(null);
  const [fechaPublicacion, setFechaPublicacion] = useState(() => new Date().toISOString().split('T')[0]);
  
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [uploadProgress, setUploadProgress] = useState(0);
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!titulo || !tipo || !numero) {
      setError('El tipo, número y título son obligatorios.');
      return;
    }
    if (!archivo) {
      setError('Debe subir un documento PDF.');
      return;
    }

    setIsSubmitting(true);
    setUploadProgress(10);
    setError('');

    try {
      // PASO 1: Pedir al servidor una URL firmada segura (no pasa el archivo por Next.js)
      const { signedUrl, publicUrl } = await getSignedUploadUrl(archivo.name);
      setUploadProgress(30);

      // PASO 2: Subir el archivo DIRECTAMENTE a Supabase desde el navegador
      // usando la URL firmada — el archivo nunca pasa por tu servidor de Next.js
      const uploadResponse = await fetch(signedUrl, {
        method: 'PUT',
        headers: {
          'Content-Type': archivo.type || 'application/pdf',
        },
        body: archivo,
      });

      if (!uploadResponse.ok) {
        const errText = await uploadResponse.text();
        throw new Error(`Error al subir a Supabase: ${errText}`);
      }
      setUploadProgress(80);

      // PASO 3: Guardar solo los metadatos (texto) en la base de datos
      const { error: insertError } = await supabase
        .from('documentos')
        .insert({
          tipo,
          numero,
          titulo,
          archivo_url: publicUrl,
          es_publico: esPublico,
          es_gaceta_oficial: esPublico, // Mostrar en sección Gaceta de la web pública
          fecha_publicacion: fechaPublicacion || new Date().toISOString().split('T')[0]
        });

      if (insertError) throw insertError;
      setUploadProgress(100);

      // Volver a la lista
      router.push('/admin/gaceta');
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
          <h1 className="adminTitle">Cargar Nuevo Documento</h1>
          <p className="adminSubtitle">Agrega una Ley, Decreto o Resolución a la Gaceta.</p>
        </div>
        <Link href="/admin/gaceta" className="btnSecondary">
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
                  <option value="ley_departamental">Ley Departamental</option>
                  <option value="decreto_departamental">Decreto Departamental</option>
                  <option value="decreto_ejecutivo">Decreto Ejecutivo</option>
                  <option value="resolucion_administrativa">Resolución Administrativa</option>
                  <option value="resolucion_secretarial">Resolución Secretarial</option>
                  <option value="convenio">Convenio</option>
                  <option value="contrato">Contrato</option>
                  <option value="otro">Otro</option>
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
                  maxLength={50}
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
            </div>

            <div className={styles.sideCol}>
              <div className="formGroup">
                <label className="formLabel">Archivo PDF *</label>
                <FileUpload 
                  onFileSelect={setArchivo} 
                  accept=".pdf"
                  label="Subir PDF"
                  icon="📄"
                  maxSizeMB={50}
                />
              </div>

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
                {isSubmitting ? `⏳ Publicando... ${uploadProgress}%` : '📤 Publicar Documento'}
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
}

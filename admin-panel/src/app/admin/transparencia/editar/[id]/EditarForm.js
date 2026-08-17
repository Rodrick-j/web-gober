'use client';
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { normalizarUrlDrive } from '@/lib/driveUtils';
import styles from '../../page.module.css';

export default function EditarForm({ documento }) {
  const router = useRouter();
  const supabase = createClient();

  const [tipo, setTipo] = useState(documento.tipo);
  const [gestion, setGestion] = useState(documento.gestion);
  const [titulo, setTitulo] = useState(documento.titulo);
  const [esPublico, setEsPublico] = useState(documento.es_publico);
  const [driveUrl, setDriveUrl] = useState(documento.archivo_url || '');

  const formattedDate = documento.fecha_publicacion ? documento.fecha_publicacion.split('T')[0] : '';
  const [fechaPublicacion, setFechaPublicacion] = useState(formattedDate);

  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!titulo || !tipo || !gestion) {
      setError('El tipo, gestión y título son obligatorios.');
      return;
    }

    setIsSubmitting(true);
    setError('');
    setSuccess('');

    try {
      const archivoUrl = driveUrl.trim() ? normalizarUrlDrive(driveUrl) : documento.archivo_url;

      const { error: updateError } = await supabase
        .from('transparencia_documentos')
        .update({
          tipo,
          gestion: parseInt(gestion, 10),
          titulo,
          es_publico: esPublico,
          archivo_url: archivoUrl,
          fecha_publicacion: fechaPublicacion || new Date().toISOString().split('T')[0],
        })
        .eq('id', documento.id);

      if (updateError) throw updateError;

      setSuccess('Documento actualizado correctamente.');
      setTimeout(() => {
        router.push('/admin/transparencia');
        router.refresh();
      }, 1000);
    } catch (err) {
      console.error(err);
      setError('Ocurrió un error al actualizar: ' + err.message);
      setIsSubmitting(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className={styles.formContainer}>
      {error && <div className={styles.errorAlert}>{error}</div>}
      {success && (
        <div style={{ background: '#dcfce7', color: '#166534', padding: '1rem', borderRadius: '8px', marginBottom: '1.5rem', fontWeight: 600 }}>
          {success}
        </div>
      )}

      <div className={styles.grid}>
        <div className={styles.mainCol}>
          <div className="formGroup">
            <label className="formLabel">Tipo de Documento *</label>
            <select className="formSelect" value={tipo} onChange={(e) => setTipo(e.target.value)} required disabled={isSubmitting}>
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
            <select className="formSelect" value={gestion} onChange={(e) => setGestion(e.target.value)} required disabled={isSubmitting}>
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
            <label className="formLabel">Link de Google Drive (PDF)</label>
            <input
              type="url"
              className="formInput"
              placeholder="https://drive.google.com/file/d/..."
              value={driveUrl}
              onChange={(e) => setDriveUrl(e.target.value)}
              disabled={isSubmitting}
            />
            {driveUrl && driveUrl.includes('drive.google.com') && (
              <p style={{ fontSize: '0.78rem', color: '#059669', marginTop: '0.3rem' }}>✅ Link de Drive detectado.</p>
            )}
            {driveUrl && !driveUrl.includes('drive.google.com') && driveUrl.startsWith('http') && (
              <p style={{ fontSize: '0.78rem', color: '#d97706', marginTop: '0.3rem' }}>⚠️ El link no parece ser de Google Drive.</p>
            )}
          </div>
        </div>

        <div className={styles.sideCol}>
          <div className="formGroup">
            <label className="formLabel">Estado de Publicación</label>
            <div style={{ display: 'flex', gap: '0.5rem', padding: '1rem', background: 'var(--admin-surface-2)', borderRadius: '12px', border: '1px solid var(--admin-border)' }}>
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
                  Si está marcado, aparecerá en el portal de Transparencia.
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
              {isSubmitting ? '⏳ Guardando...' : 'Guardar Cambios'}
            </button>
          </div>
        </div>
      </div>
    </form>
  );
}

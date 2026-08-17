'use client';
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { normalizarUrlDrive } from '@/lib/driveUtils';

export default function EditarForm({ documento }) {
  const router = useRouter();
  const supabase = createClient();

  const [tipo, setTipo] = useState(documento.tipo || 'ley_departamental');
  const [numero, setNumero] = useState(documento.numero || '');
  const [titulo, setTitulo] = useState(documento.titulo || '');
  const [esPublico, setEsPublico] = useState(documento.es_publico !== false);
  const [driveUrl, setDriveUrl] = useState(documento.archivo_url || '');

  const fechaOriginal = documento.fecha_publicacion ? documento.fecha_publicacion.split('T')[0] : '';
  const [fecha, setFecha] = useState(fechaOriginal);

  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!titulo || !tipo || !numero || !fecha) {
      setError('Todos los campos marcados con * son obligatorios.');
      return;
    }

    setIsSubmitting(true);
    setError('');

    try {
      const archivoUrl = driveUrl.trim() ? normalizarUrlDrive(driveUrl) : documento.archivo_url;

      const { error: updateError } = await supabase
        .from('documentos')
        .update({
          tipo,
          numero,
          titulo,
          es_publico: esPublico,
          es_gaceta_oficial: esPublico,
          fecha_publicacion: fecha,
          archivo_url: archivoUrl,
        })
        .eq('id', documento.id);

      if (updateError) throw updateError;

      router.push('/admin/gaceta');
      router.refresh();
    } catch (err) {
      console.error(err);
      setError('Ocurrió un error al actualizar: ' + err.message);
      setIsSubmitting(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} style={{ padding: '1rem' }}>
      {error && (
        <div style={{ background: '#fee2e2', color: '#b91c1c', padding: '1rem', borderRadius: '8px', marginBottom: '1.5rem', border: '1px solid #fca5a5' }}>
          {error}
        </div>
      )}

      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '2rem' }}>
        {/* Columna izquierda */}
        <div style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
          <div className="formGroup">
            <label className="formLabel">Tipo de Documento *</label>
            <select className="formSelect" value={tipo} onChange={(e) => setTipo(e.target.value)} required disabled={isSubmitting}>
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
              required
              disabled={isSubmitting}
            />
          </div>

          <div className="formGroup">
            <label className="formLabel">Título / Descripción Breve *</label>
            <textarea
              className="formTextarea"
              placeholder="Ej: Ley que declara..."
              value={titulo}
              onChange={(e) => setTitulo(e.target.value)}
              style={{ minHeight: '120px' }}
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

        {/* Columna derecha */}
        <div style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
          <div className="formGroup">
            <label className="formLabel">Fecha de Publicación *</label>
            <input
              type="date"
              className="formInput"
              value={fecha}
              onChange={(e) => setFecha(e.target.value)}
              required
              disabled={isSubmitting}
            />
          </div>

          <div className="formGroup">
            <label className="formLabel">Estado de Visibilidad</label>
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

          {documento.archivo_url && (
            <div style={{ background: 'var(--admin-surface-2)', padding: '1rem', borderRadius: '12px', border: '1px solid var(--admin-border)' }}>
              <p style={{ fontSize: '0.82rem', color: 'var(--admin-text-muted)', marginBottom: '0.75rem' }}>
                📄 PDF actual guardado:
              </p>
              <a href={documento.archivo_url} target="_blank" rel="noreferrer" className="btnSecondary" style={{ display: 'inline-block', fontSize: '0.82rem' }}>
                Ver PDF actual
              </a>
            </div>
          )}

          <button
            type="submit"
            className="btnPrimary"
            disabled={isSubmitting}
            style={{ width: '100%', padding: '1rem', fontSize: '1rem', marginTop: 'auto' }}
          >
            {isSubmitting ? 'Guardando...' : 'Guardar Cambios'}
          </button>
        </div>
      </div>
    </form>
  );
}

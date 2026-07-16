'use client';
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';

export default function EditarForm({ documento }) {
  const router = useRouter();
  const supabase = createClient();

  // Inicializar estado con los valores actuales
  const [tipo, setTipo] = useState(documento.tipo || 'ley_departamental');
  const [numero, setNumero] = useState(documento.numero || '');
  const [titulo, setTitulo] = useState(documento.titulo || '');
  const [esPublico, setEsPublico] = useState(documento.es_publico !== false);
  
  // Extraer solo la fecha de '2026-06-14T00:00:00+00:00' para el input type="date"
  const fechaPublicacionOriginal = documento.fecha_publicacion ? documento.fecha_publicacion.split('T')[0] : '';
  const [fecha, setFecha] = useState(fechaPublicacionOriginal);

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
      const { error: updateError } = await supabase
        .from('documentos')
        .update({
          tipo,
          numero,
          titulo,
          es_publico: esPublico,
          es_gaceta_oficial: esPublico, // Sincronizar visibilidad
          fecha_publicacion: fecha
        })
        .eq('id', documento.id);

      if (updateError) throw updateError;

      // Volver a la lista y forzar recarga
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
        <div style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
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
        </div>

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

          <div style={{ marginTop: 'auto', background: 'var(--admin-surface-2)', padding: '1rem', borderRadius: '12px', border: '1px solid var(--admin-border)' }}>
            <p style={{ fontSize: '0.85rem', color: 'var(--admin-text-muted)', marginBottom: '1rem' }}>
              ℹ️ El archivo PDF asociado a este documento no se puede cambiar desde aquí. Si subiste el archivo equivocado, debes eliminar este registro y crear uno nuevo.
            </p>
            {documento.archivo_url && (
              <a href={documento.archivo_url} target="_blank" rel="noreferrer" className="btnSecondary" style={{ width: '100%', justifyContent: 'center' }}>
                Ver PDF Actual
              </a>
            )}
          </div>

          <button 
            type="submit" 
            className="btnPrimary"
            disabled={isSubmitting}
            style={{ width: '100%', padding: '1rem', fontSize: '1.1rem' }}
          >
            {isSubmitting ? 'Guardando Cambios...' : 'Guardar Cambios'}
          </button>
        </div>
      </div>
    </form>
  );
}

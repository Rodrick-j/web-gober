'use client';
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import styles from '../../page.module.css';

export default function EditarForm({ documento }) {
  const router = useRouter();
  const supabase = createClient();

  const [tipo, setTipo] = useState(documento.tipo);
  const [gestion, setGestion] = useState(documento.gestion);
  const [titulo, setTitulo] = useState(documento.titulo);
  const [esPublico, setEsPublico] = useState(documento.es_publico);
  
  // Format date correctly for input type="date"
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
      const { error: updateError } = await supabase
        .from('transparencia_documentos')
        .update({
          tipo,
          gestion: parseInt(gestion, 10),
          titulo,
          es_publico: esPublico,
          fecha_publicacion: fechaPublicacion || new Date().toISOString().split('T')[0]
        })
        .eq('id', documento.id);

      if (updateError) throw updateError;
      
      setSuccess('Documento actualizado correctamente.');
      
      // Delay redirect slightly so user can see success message
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
      {success && <div style={{ background: '#dcfce7', color: '#166534', padding: '1rem', borderRadius: '8px', marginBottom: '1.5rem', fontWeight: 600 }}>{success}</div>}

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
              <option value={new Date().getFullYear() + 1}>{new Date().getFullYear() + 1}</option>
              <option value={new Date().getFullYear()}>{new Date().getFullYear()}</option>
              <option value={new Date().getFullYear() - 1}>{new Date().getFullYear() - 1}</option>
              <option value={new Date().getFullYear() - 2}>{new Date().getFullYear() - 2}</option>
              <option value={new Date().getFullYear() - 3}>{new Date().getFullYear() - 3}</option>
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
            <label className="formLabel">Archivo Actual</label>
            <div style={{
              border: '1px solid var(--admin-border)',
              borderRadius: '8px',
              padding: '1rem',
              background: 'var(--admin-surface-2)',
              display: 'flex',
              alignItems: 'center',
              gap: '0.75rem'
            }}>
              <span style={{ fontSize: '1.5rem' }}>📄</span>
              <div style={{ flex: 1, overflow: 'hidden' }}>
                <a 
                  href={documento.archivo_url} 
                  target="_blank" 
                  rel="noopener noreferrer"
                  style={{ color: 'var(--color-primary)', textDecoration: 'underline', fontWeight: 500, display: 'block', textOverflow: 'ellipsis', overflow: 'hidden', whiteSpace: 'nowrap' }}
                >
                  Ver PDF Actual
                </a>
              </div>
            </div>
            <p style={{ fontSize: '0.8rem', color: 'var(--admin-text-muted)', marginTop: '0.5rem' }}>
              Para subir un nuevo archivo, debe eliminar este registro y crear uno nuevo, o contactar a soporte.
            </p>
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
              {isSubmitting ? 'Guardando...' : 'Guardar Cambios'}
            </button>
          </div>
        </div>
      </div>
    </form>
  );
}

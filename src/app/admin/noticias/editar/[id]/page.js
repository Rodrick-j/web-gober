'use client';
import { useState, useEffect } from 'react';
import { useRouter, useParams } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { uploadFile } from '@/lib/supabase/storage';
import RichTextEditor from '@/components/admin/RichTextEditor/RichTextEditor';
import FileUpload from '@/components/admin/FileUpload/FileUpload';
import Link from 'next/link';
import styles from '../../crear/page.module.css'; // Reusing styles from crear

export default function EditarNoticiaPage() {
  const router = useRouter();
  const { id } = useParams();
  const supabase = createClient();

  const [titulo, setTitulo] = useState('');
  const [resumen, setResumen] = useState('');
  const [contenido, setContenido] = useState('');
  const [estado, setEstado] = useState('publicado');
  const [imagenUrlActual, setImagenUrlActual] = useState(null);
  const [imagen, setImagen] = useState(null);
  
  const [isLoading, setIsLoading] = useState(true);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState('');

  useEffect(() => {
    async function fetchNoticia() {
      try {
        const { data, error } = await supabase
          .from('noticias')
          .select('*')
          .eq('id', id)
          .single();

        if (error) throw error;
        if (data) {
          setTitulo(data.titulo || '');
          setResumen(data.resumen || '');
          setContenido(data.contenido || '');
          setEstado(data.estado || 'publicado');
          setImagenUrlActual(data.imagen_portada_url || null);
        }
      } catch (err) {
        console.error('Error fetching noticia:', err);
        setError('Error al cargar la noticia.');
      } finally {
        setIsLoading(false);
      }
    }
    
    if (id) fetchNoticia();
  }, [id, supabase]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!titulo || !contenido) {
      setError('El título y el contenido son obligatorios.');
      return;
    }

    setIsSubmitting(true);
    setError('');

    try {
      // 2. Subir imagen si hay una nueva
      let nuevaImagenUrl = imagenUrlActual;
      if (imagen) {
        nuevaImagenUrl = await uploadFile(imagen, 'noticias');
      }

      const slug = titulo.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)+/g, '') + '-' + id;
      const fechaPublicacion = estado === 'publicado' ? new Date().toISOString() : null;

      // 4. Actualizar en base de datos
      const updateData = {
        titulo,
        slug,
        resumen,
        contenido,
        imagen_portada_url: nuevaImagenUrl,
        estado
      };

      // Si cambia a publicado y no tenía fecha, ponerle fecha. 
      // Si cambia a borrador, no quitamos la fecha (o sí), vamos a dejar que mantenga la original si ya tenía.
      if (estado === 'publicado') {
        // En una app real, revisaríamos si ya tenía fecha. Por simplicidad, la actualizamos.
        updateData.fecha_publicacion = fechaPublicacion;
      }

      const { error: updateError } = await supabase
        .from('noticias')
        .update(updateData)
        .eq('id', id);

      if (updateError) throw updateError;

      router.push('/admin/noticias');
      router.refresh();

    } catch (err) {
      console.error(err);
      setError('Ocurrió un error al guardar la noticia: ' + err.message);
      setIsSubmitting(false);
    }
  };

  if (isLoading) {
    return <div className="adminPage" style={{ padding: '2rem' }}>Cargando noticia...</div>;
  }

  return (
    <div className="adminPage">
      <div className={styles.header}>
        <div>
          <h1 className="adminTitle">Editar Noticia</h1>
          <p className="adminSubtitle">Modifica los detalles del artículo.</p>
        </div>
        <Link href="/admin/noticias" className="btnSecondary">
          Volver
        </Link>
      </div>

      <div className="tableCard">
        <form onSubmit={handleSubmit} className={styles.formContainer}>
          
          {error && <div className={styles.errorAlert}>{error}</div>}

          <div className={styles.grid}>
            <div className={styles.mainCol}>
              <div className="formGroup">
                <label className="formLabel">Título de la Noticia *</label>
                <input 
                  type="text" 
                  className="formInput" 
                  placeholder="Ej: Inauguración de nuevo tramo carretero..."
                  value={titulo}
                  onChange={(e) => setTitulo(e.target.value)}
                  maxLength={255}
                  required
                />
              </div>

              <div className="formGroup">
                <label className="formLabel">Resumen corto (Opcional)</label>
                <textarea 
                  className="formTextarea" 
                  placeholder="Un breve texto que aparecerá en las tarjetas de la web principal..."
                  value={resumen}
                  onChange={(e) => setResumen(e.target.value)}
                  style={{ minHeight: '80px' }}
                />
              </div>

              <div className="formGroup">
                <label className="formLabel">Contenido Completo *</label>
                <RichTextEditor 
                  value={contenido}
                  onChange={setContenido}
                  placeholder="Escribe el artículo detallado aquí. Puedes usar negritas, colores y listas..."
                />
              </div>
            </div>

            <div className={styles.sideCol}>
              <div className="formGroup">
                <label className="formLabel">Imagen de Portada</label>
                {imagenUrlActual && !imagen && (
                  <div style={{ marginBottom: '1rem' }}>
                    <img src={imagenUrlActual} alt="Portada Actual" style={{ width: '100%', borderRadius: '8px', border: '1px solid var(--admin-border)' }} />
                    <p style={{ fontSize: '0.75rem', color: 'var(--admin-text-muted)', marginTop: '0.5rem' }}>Imagen actual. Sube una nueva para reemplazarla.</p>
                  </div>
                )}
                <FileUpload 
                  onFileSelect={setImagen} 
                  accept="image/*"
                  label=""
                  icon="📸"
                  maxSizeMB={5}
                />
              </div>

              <div className="formGroup">
                <label className="formLabel">Estado de Publicación</label>
                <select 
                  className="formSelect"
                  value={estado}
                  onChange={(e) => setEstado(e.target.value)}
                >
                  <option value="publicado">Publicado (Visible en la web)</option>
                  <option value="borrador">Borrador (Oculto)</option>
                </select>
              </div>

              <button 
                type="submit" 
                className={`btnPrimary ${styles.submitBtn}`}
                disabled={isSubmitting}
              >
                {isSubmitting ? 'Guardando Cambios...' : 'Guardar Cambios'}
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
}

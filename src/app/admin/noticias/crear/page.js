'use client';
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { uploadFile } from '@/lib/supabase/storage';
import RichTextEditor from '@/components/admin/RichTextEditor/RichTextEditor';
import FileUpload from '@/components/admin/FileUpload/FileUpload';
import Link from 'next/link';
import styles from './page.module.css';

export default function CrearNoticiaPage() {
  const router = useRouter();
  const supabase = createClient();

  const [titulo, setTitulo] = useState('');
  const [resumen, setResumen] = useState('');
  const [contenido, setContenido] = useState('');
  const [estado, setEstado] = useState('publicado');
  const [imagen, setImagen] = useState(null);
  
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!titulo || !contenido) {
      setError('El título y el contenido son obligatorios.');
      return;
    }

    setIsSubmitting(true);
    setError('');

    try {
      // 1. Obtener usuario actual y su secretaria
      const { data: { user } } = await supabase.auth.getUser();
      const { data: perfil } = await supabase
        .from('usuarios_admin')
        .select('secretaria_id')
        .eq('auth_user_id', user.id)
        .single();

      // 2. Subir imagen si hay una
      let imagenUrl = null;
      if (imagen) {
        imagenUrl = await uploadFile(imagen, 'noticias');
      }

      // 3. Generar slug a partir del título
      const slug = titulo.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)+/g, '') + '-' + Date.now();
      const fechaPublicacion = estado === 'publicado' ? new Date().toISOString() : null;

      // 4. Guardar en base de datos
      const { error: insertError } = await supabase
        .from('noticias')
        .insert({
          titulo,
          slug,
          resumen,
          contenido,
          imagen_portada_url: imagenUrl,
          estado,
          fecha_publicacion: fechaPublicacion,
          autor_id: user.id,
          secretaria_id: perfil?.secretaria_id || null // Automáticamente se enlaza a su secretaría
        });

      if (insertError) throw insertError;

      // Volver a la lista y refrescar
      router.push('/admin/noticias');
      router.refresh();

    } catch (err) {
      console.error(err);
      setError('Ocurrió un error al guardar la noticia: ' + err.message);
      setIsSubmitting(false);
    }
  };

  return (
    <div className="adminPage">
      <div className={styles.header}>
        <div>
          <h1 className="adminTitle">Crear Noticia</h1>
          <p className="adminSubtitle">Redacta un nuevo comunicado o artículo.</p>
        </div>
        <Link href="/admin/noticias" className="btnSecondary">
          Volver
        </Link>
      </div>

      <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '12px', padding: '1.25rem', marginBottom: '2rem', display: 'flex', gap: '1rem', alignItems: 'flex-start' }}>
        <div style={{ fontSize: '1.5rem', background: 'var(--admin-surface-2)', padding: '0.75rem', borderRadius: '10px' }}>✍️</div>
        <div>
          <h3 style={{ fontSize: '1rem', fontWeight: 700, color: 'var(--admin-text)', marginBottom: '0.25rem' }}>Consejos para redactar</h3>
          <p style={{ fontSize: '0.85rem', color: 'var(--admin-text-muted)', lineHeight: '1.5' }}>
            Asegúrate de escribir un título llamativo y usar el <strong>Resumen corto</strong> para destacar el punto principal. La imagen de portada es clave, aparecerá en las tarjetas de la web pública. Usa el editor para dar formato y estructurar bien el contenido.
          </p>
        </div>
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
                {/* Editor de Texto Avanzado */}
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
                {isSubmitting ? 'Guardando y Publicando...' : 'Guardar Noticia'}
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
}

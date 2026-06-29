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
  const [categoria, setCategoria] = useState('Todas');
  const [esComunicado, setEsComunicado] = useState(false);
  const [imagen, setImagen] = useState(null);
  const [fechaPublicacion, setFechaPublicacion] = useState('');
  const [enlaceFacebook, setEnlaceFacebook] = useState('');
  const [enlaceTwitter, setEnlaceTwitter] = useState('');
  const [enlaceInstagram, setEnlaceInstagram] = useState('');
  const [enlaceTiktok, setEnlaceTiktok] = useState('');
  
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
      const finalFechaPublicacion = fechaPublicacion 
        ? new Date(fechaPublicacion).toISOString() 
        : (estado === 'publicado' ? new Date().toISOString() : null);

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
          categoria,
          es_comunicado_rapido: esComunicado,
          fecha_publicacion: finalFechaPublicacion,
          enlace_facebook: enlaceFacebook || null,
          enlace_twitter: enlaceTwitter || null,
          enlace_instagram: enlaceInstagram || null,
          enlace_tiktok: enlaceTiktok || null,
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

              <div style={{ marginTop: '2rem', padding: '1.5rem', background: 'var(--admin-surface-2)', borderRadius: '12px', border: '1px solid var(--admin-border)' }}>
                <h4 style={{ fontSize: '1.1rem', marginBottom: '1rem', color: 'var(--admin-text)' }}>Enlaces a Redes Sociales (Opcional)</h4>
                
                <div className="formGroup">
                  <label className="formLabel">Enlace de Facebook</label>
                  <input 
                    type="url" 
                    className="formInput" 
                    placeholder="https://facebook.com/..."
                    value={enlaceFacebook}
                    onChange={(e) => setEnlaceFacebook(e.target.value)}
                  />
                </div>

                <div className="formGroup">
                  <label className="formLabel">Enlace de X (Twitter)</label>
                  <input 
                    type="url" 
                    className="formInput" 
                    placeholder="https://x.com/..."
                    value={enlaceTwitter}
                    onChange={(e) => setEnlaceTwitter(e.target.value)}
                  />
                </div>

                <div className="formGroup">
                  <label className="formLabel">Enlace de Instagram</label>
                  <input 
                    type="url" 
                    className="formInput" 
                    placeholder="https://instagram.com/..."
                    value={enlaceInstagram}
                    onChange={(e) => setEnlaceInstagram(e.target.value)}
                  />
                </div>

                <div className="formGroup">
                  <label className="formLabel">Enlace de TikTok</label>
                  <input 
                    type="url" 
                    className="formInput" 
                    placeholder="https://tiktok.com/..."
                    value={enlaceTiktok}
                    onChange={(e) => setEnlaceTiktok(e.target.value)}
                  />
                </div>
              </div>
            </div>

            <div className={styles.sideCol}>
              <div className="formGroup">
                <label className="formLabel">Imagen de Portada</label>
                <FileUpload 
                  onFileSelect={setImagen} 
                  accept="image/*"
                  label={esComunicado ? "Opcional para comunicados" : ""}
                  icon="📸"
                  maxSizeMB={5}
                />
              </div>

              <div className="formGroup" style={{ background: 'var(--admin-surface-2)', padding: '1rem', borderRadius: '10px', border: '1px solid var(--admin-border)' }}>
                <label className="formLabel" style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', cursor: 'pointer', marginBottom: 0 }}>
                  <input 
                    type="checkbox" 
                    checked={esComunicado}
                    onChange={(e) => setEsComunicado(e.target.checked)}
                    style={{ width: '1.2rem', height: '1.2rem', accentColor: 'var(--color-primary)' }}
                  />
                  <span>¿Es un comunicado rápido?</span>
                </label>
                <p style={{ fontSize: '0.8rem', color: 'var(--admin-text-muted)', marginTop: '0.5rem', marginBottom: 0 }}>
                  Aparecerá en la barra lateral sin necesidad de foto.
                </p>
              </div>

              <div className="formGroup">
                <label className="formLabel">Categoría</label>
                <select 
                  className="formSelect"
                  value={categoria}
                  onChange={(e) => setCategoria(e.target.value)}
                >
                  <option value="Todas">General / Todas</option>
                  <option value="Gobernador">Gobernador</option>
                  <option value="Salud">Salud</option>
                  <option value="Obras Públicas">Obras Públicas</option>
                  <option value="Educación">Educación</option>
                  <option value="Cultura y Turismo">Cultura y Turismo</option>
                  <option value="Deportes">Deportes</option>
                </select>
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

              <div className="formGroup">
                <label className="formLabel">Fecha y Hora de Publicación</label>
                <input 
                  type="datetime-local" 
                  className="formInput" 
                  value={fechaPublicacion}
                  onChange={(e) => setFechaPublicacion(e.target.value)}
                />
                <p style={{ fontSize: '0.8rem', color: 'var(--admin-text-muted)', marginTop: '0.5rem', marginBottom: 0 }}>
                  Si la dejas vacía, se usará la fecha actual al publicar.
                </p>
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

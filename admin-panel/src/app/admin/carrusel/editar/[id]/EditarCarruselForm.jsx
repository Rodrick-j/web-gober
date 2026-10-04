'use client';
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { uploadFile } from '@/lib/supabase/storage';
import Image from 'next/image';

function getSaveErrorMessage(error) {
  const message = typeof error?.message === 'string' ? error.message : '';

  if (message.includes('imagen_tablet_url')) {
    return 'La base de datos todavía no tiene habilitada la imagen para tablet. Ejecuta la migración SQL 33_carrusel_variantes_responsive.sql en Supabase y vuelve a intentarlo.';
  }

  return message || 'No se pudo guardar la imagen. Inténtalo nuevamente.';
}

export default function EditarCarruselForm({ banner }) {
  const router = useRouter();
  const supabase = createClient();

  const [titulo, setTitulo] = useState(banner.titulo || '');
  const [enlaceUrl, setEnlaceUrl] = useState(banner.enlace_url || '');
  const [animacionTexto, setAnimacionTexto] = useState(banner.animacion_texto || 'fade-in');
  const [animacionCarrusel, setAnimacionCarrusel] = useState(banner.animacion_carrusel || 'creative');
  const [activo, setActivo] = useState(banner.activo !== false);
  const [imagenTablet, setImagenTablet] = useState(null);
  const [imagenMovil, setImagenMovil] = useState(null);
  const [removeImagenTablet, setRemoveImagenTablet] = useState(false);
  const [removeImagenMovil, setRemoveImagenMovil] = useState(false);

  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    setIsSubmitting(true);
    setError('');

    try {
      let nuevaImagenTabletUrl = banner.imagen_tablet_url;
      if (removeImagenTablet) {
        nuevaImagenTabletUrl = null;
      } else if (imagenTablet) {
        nuevaImagenTabletUrl = await uploadFile(imagenTablet, 'general');
      }

      let nuevaImagenMovilUrl = banner.imagen_movil_url;
      
      if (removeImagenMovil) {
        nuevaImagenMovilUrl = null;
      } else if (imagenMovil) {
        nuevaImagenMovilUrl = await uploadFile(imagenMovil, 'general');
      }

      const { error: updateError } = await supabase
        .from('banners_inicio')
        .update({
          titulo,
          enlace_url: enlaceUrl,
          animacion_texto: animacionTexto,
          animacion_carrusel: animacionCarrusel,
          activo,
          imagen_tablet_url: nuevaImagenTabletUrl,
          imagen_movil_url: nuevaImagenMovilUrl
        })
        .eq('id', banner.id);

      if (updateError) throw updateError;

      router.push('/admin/carrusel');
      router.refresh();
    } catch (err) {
      const message = getSaveErrorMessage(err);

      // Next muestra un overlay vacío para algunos errores de Supabase y oculta
      // el detalle útil para quien está administrando el sitio.
      console.warn('No se pudo actualizar el carrusel:', {
        code: err?.code,
        message: err?.message
      });
      setError(message);
      setIsSubmitting(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} style={{ padding: '1.5rem' }}>
      {error && (
        <div style={{ background: '#fee2e2', color: '#b91c1c', padding: '1rem', borderRadius: '8px', marginBottom: '1.5rem', border: '1px solid #fca5a5' }}>
          {error}
        </div>
      )}

      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '2rem' }}>
        
        {/* Columna Izquierda */}
        <div style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
          <div className="formGroup">
            <label className="formLabel">Título del Banner (Opcional)</label>
            <input 
              type="text" 
              className="formInput" 
              placeholder="Ej: Festejando el 10 de Febrero"
              value={titulo}
              onChange={(e) => setTitulo(e.target.value)}
              disabled={isSubmitting}
            />
            <small style={{ color: 'var(--admin-text-muted)', marginTop: '0.5rem', display: 'block' }}>Este texto aparecerá flotando sobre la imagen.</small>
          </div>

          <div className="formGroup">
            <label className="formLabel">Enlace del botón (Opcional)</label>
            <input 
              type="text" 
              className="formInput" 
              placeholder="Ej: /noticias/festejo-febrero o https://google.com"
              value={enlaceUrl}
              onChange={(e) => setEnlaceUrl(e.target.value)}
              disabled={isSubmitting}
            />
            <small style={{ color: 'var(--admin-text-muted)', marginTop: '0.5rem', display: 'block' }}>Si lo llenas, aparecerá un botón &quot;Ver Detalles&quot; sobre la foto.</small>
          </div>

          <div className="formGroup">
            <label className="formLabel">Visibilidad</label>
            <select 
              className="formSelect"
              value={activo ? 'publico' : 'oculto'}
              onChange={(e) => setActivo(e.target.value === 'publico')}
              disabled={isSubmitting}
            >
              <option value="publico">Activo (Se muestra en el carrusel)</option>
              <option value="oculto">Oculto (Pausado temporalmente)</option>
            </select>
          </div>
        </div>

        {/* Columna Derecha */}
        <div style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
          
          <div className="formGroup" style={{ background: 'var(--admin-surface-2)', padding: '1rem', borderRadius: '12px', border: '1px solid var(--admin-border)' }}>
            <h4 style={{ margin: '0 0 1rem 0', color: 'var(--admin-text)' }}>🌟 Animaciones (NUEVO)</h4>
            
            <label className="formLabel" style={{ marginTop: '1rem' }}>Animación del Texto (Cómo aparece el título)</label>
            <select 
              className="formSelect"
              value={animacionTexto}
              onChange={(e) => setAnimacionTexto(e.target.value)}
              disabled={isSubmitting}
            >
              <option value="fade-in">Aparición Suave (Fade In)</option>
              <option value="slide-up">Subir desde abajo (Slide Up)</option>
              <option value="zoom-in">Acercamiento (Zoom In)</option>
            </select>

            <label className="formLabel" style={{ marginTop: '1.5rem' }}>Efecto de Transición hacia este banner</label>
            <select 
              className="formSelect"
              value={animacionCarrusel}
              onChange={(e) => setAnimacionCarrusel(e.target.value)}
              disabled={isSubmitting}
            >
              <option value="creative">Creativo 3D (Recomendado)</option>
              <option value="fade">Desvanecimiento (Fade)</option>
              <option value="slide">Deslizamiento Normal (Slide)</option>
              <option value="coverflow">Galería 3D (Coverflow)</option>
            </select>
          </div>

          <div style={{ marginTop: 'auto', background: '#111', padding: '0.5rem', borderRadius: '12px', border: '1px solid var(--admin-border)', textAlign: 'center' }}>
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, minmax(0, 1fr))', gap: '0.5rem' }}>
              <div style={{ position: 'relative', width: '100%', height: '100px', borderRadius: '8px', overflow: 'hidden' }}>
                <Image 
                  src={banner.imagen_url} 
                  alt="Banner PC" 
                  fill
                  style={{ objectFit: 'cover' }} 
                />
              </div>
              <div style={{ position: 'relative', width: '100%', height: '100px', borderRadius: '8px', overflow: 'hidden', background: '#333', display: 'flex', alignItems: 'center', justifyContent: 'center', color: '#666', fontSize: '0.8rem', flexDirection: 'column' }}>
                {(banner.imagen_tablet_url && !removeImagenTablet) || imagenTablet ? (
                  <>
                    <Image
                      src={imagenTablet ? URL.createObjectURL(imagenTablet) : banner.imagen_tablet_url}
                      alt="Banner Tablet"
                      fill
                      unoptimized={Boolean(imagenTablet)}
                      style={{ objectFit: 'cover' }}
                    />
                    <div style={{ position: 'absolute', inset: 0, display: 'flex', alignItems: 'center', justifyContent: 'center', background: 'rgba(0,0,0,0.5)', opacity: 0, transition: 'opacity 0.2s', cursor: 'pointer' }} onMouseEnter={(e) => e.currentTarget.style.opacity = 1} onMouseLeave={(e) => e.currentTarget.style.opacity = 0}>
                      <button
                        type="button"
                        onClick={() => { setRemoveImagenTablet(true); setImagenTablet(null); }}
                        style={{ background: '#ef4444', color: 'white', border: 'none', padding: '6px 12px', borderRadius: '4px', cursor: 'pointer', fontSize: '0.75rem', fontWeight: 'bold' }}
                      >
                        Quitar Imagen
                      </button>
                    </div>
                  </>
                ) : (
                  <span style={{ padding: '0 0.4rem', textAlign: 'center' }}>{removeImagenTablet ? 'Imagen eliminada' : 'Sin imagen tablet'}</span>
                )}
              </div>
              <div style={{ position: 'relative', width: '100%', height: '100px', borderRadius: '8px', overflow: 'hidden', background: '#333', display: 'flex', alignItems: 'center', justifyContent: 'center', color: '#666', fontSize: '0.8rem', flexDirection: 'column' }}>
                {(banner.imagen_movil_url && !removeImagenMovil) || imagenMovil ? (
                  <>
                    <Image 
                      src={imagenMovil ? URL.createObjectURL(imagenMovil) : banner.imagen_movil_url} 
                      alt="Banner Móvil" 
                      fill
                      style={{ objectFit: 'cover' }} 
                    />
                    <div style={{ position: 'absolute', inset: 0, display: 'flex', alignItems: 'center', justifyContent: 'center', background: 'rgba(0,0,0,0.5)', opacity: 0, transition: 'opacity 0.2s', cursor: 'pointer' }} onMouseEnter={(e) => e.currentTarget.style.opacity = 1} onMouseLeave={(e) => e.currentTarget.style.opacity = 0}>
                      <button 
                        type="button" 
                        onClick={() => { setRemoveImagenMovil(true); setImagenMovil(null); }} 
                        style={{ background: '#ef4444', color: 'white', border: 'none', padding: '6px 12px', borderRadius: '4px', cursor: 'pointer', fontSize: '0.75rem', fontWeight: 'bold' }}
                      >
                        Quitar Imagen
                      </button>
                    </div>
                  </>
                ) : (
                  <span style={{ padding: '0 1rem' }}>{removeImagenMovil ? 'Imagen eliminada (Guardar para aplicar)' : 'Sin imagen móvil'}</span>
                )}
              </div>
            </div>
            <p style={{ fontSize: '0.75rem', color: '#999', margin: '0.5rem 0' }}>Para cambiar la imagen principal de PC, debes subir un banner nuevo.</p>

            <div style={{ marginTop: '1rem', textAlign: 'left' }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <label className="formLabel" style={{ color: 'white', fontSize: '0.85rem' }}>Cambiar Imagen Tablet Vertical</label>
                {(banner.imagen_tablet_url || imagenTablet) && !removeImagenTablet && (
                  <button
                    type="button"
                    onClick={() => { setRemoveImagenTablet(true); setImagenTablet(null); }}
                    style={{ background: 'transparent', border: '1px solid #ef4444', color: '#ef4444', fontSize: '0.7rem', padding: '2px 8px', borderRadius: '4px', cursor: 'pointer' }}
                  >
                    Quitar
                  </button>
                )}
              </div>
              <input
                type="file"
                accept="image/*"
                onChange={(e) => {
                  const file = e.target.files?.[0] || null;
                  setImagenTablet(file);
                  if (file) setRemoveImagenTablet(false);
                }}
                disabled={isSubmitting}
                style={{ marginTop: '0.5rem', width: '100%', fontSize: '0.8rem', color: '#ccc' }}
              />
              <small style={{ color: '#999', display: 'block', marginTop: '0.35rem' }}>Recomendada: 1440x1920px (3:4), con el contenido importante centrado. Se usa en Surface Pro e iPad vertical.</small>
            </div>

            <div style={{ marginTop: '1rem', textAlign: 'left' }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <label className="formLabel" style={{ color: 'white', fontSize: '0.85rem' }}>Cambiar Imagen Celular (Vertical)</label>
                {(banner.imagen_movil_url || imagenMovil) && !removeImagenMovil && (
                  <button 
                    type="button" 
                    onClick={() => { setRemoveImagenMovil(true); setImagenMovil(null); }}
                    style={{ background: 'transparent', border: '1px solid #ef4444', color: '#ef4444', fontSize: '0.7rem', padding: '2px 8px', borderRadius: '4px', cursor: 'pointer' }}
                  >
                    Quitar
                  </button>
                )}
              </div>
              <input 
                type="file" 
                accept="image/*"
                onChange={(e) => {
                  setImagenMovil(e.target.files[0]);
                  if (e.target.files[0]) setRemoveImagenMovil(false);
                }}
                disabled={isSubmitting}
                style={{ marginTop: '0.5rem', width: '100%', fontSize: '0.8rem', color: '#ccc' }}
              />
            </div>
          </div>

          <button 
            type="submit" 
            className="btnPrimary"
            disabled={isSubmitting}
            style={{ width: '100%', padding: '1rem', fontSize: '1.1rem' }}
          >
            {isSubmitting ? 'Guardando Cambios...' : 'Guardar Configuración'}
          </button>
        </div>
      </div>
    </form>
  );
}

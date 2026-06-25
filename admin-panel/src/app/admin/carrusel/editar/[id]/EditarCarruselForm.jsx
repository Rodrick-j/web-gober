'use client';
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { uploadFile } from '@/lib/supabase/storage';
import Image from 'next/image';

export default function EditarCarruselForm({ banner }) {
  const router = useRouter();
  const supabase = createClient();

  const [titulo, setTitulo] = useState(banner.titulo || '');
  const [enlaceUrl, setEnlaceUrl] = useState(banner.enlace_url || '');
  const [animacionTexto, setAnimacionTexto] = useState(banner.animacion_texto || 'fade-in');
  const [animacionCarrusel, setAnimacionCarrusel] = useState(banner.animacion_carrusel || 'creative');
  const [activo, setActivo] = useState(banner.activo !== false);
  const [imagenMovil, setImagenMovil] = useState(null);

  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    setIsSubmitting(true);
    setError('');

    try {
      let nuevaImagenMovilUrl = banner.imagen_movil_url;
      if (imagenMovil) {
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
          imagen_movil_url: nuevaImagenMovilUrl
        })
        .eq('id', banner.id);

      if (updateError) throw updateError;

      router.push('/admin/carrusel');
      router.refresh();
    } catch (err) {
      console.error(err);
      setError('Ocurrió un error al actualizar: ' + err.message);
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
            <small style={{ color: 'var(--admin-text-muted)', marginTop: '0.5rem', display: 'block' }}>Si lo llenas, aparecerá un botón "Ver Detalles" sobre la foto.</small>
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
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '0.5rem' }}>
              <div style={{ position: 'relative', width: '100%', height: '100px', borderRadius: '8px', overflow: 'hidden' }}>
                <Image 
                  src={banner.imagen_url} 
                  alt="Banner PC" 
                  fill
                  style={{ objectFit: 'cover' }} 
                />
              </div>
              <div style={{ position: 'relative', width: '100%', height: '100px', borderRadius: '8px', overflow: 'hidden', background: '#333', display: 'flex', alignItems: 'center', justifyContent: 'center', color: '#666', fontSize: '0.8rem' }}>
                {banner.imagen_movil_url ? (
                  <Image 
                    src={banner.imagen_movil_url} 
                    alt="Banner Móvil" 
                    fill
                    style={{ objectFit: 'cover' }} 
                  />
                ) : 'Sin imagen móvil'}
              </div>
            </div>
            <p style={{ fontSize: '0.75rem', color: '#999', margin: '0.5rem 0' }}>Para cambiar la imagen principal de PC, debes subir un banner nuevo.</p>

            <div style={{ marginTop: '1rem', textAlign: 'left' }}>
              <label className="formLabel" style={{ color: 'white', fontSize: '0.85rem' }}>Cambiar Imagen Celular (Vertical)</label>
              <input 
                type="file" 
                accept="image/*"
                onChange={(e) => setImagenMovil(e.target.files[0])}
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

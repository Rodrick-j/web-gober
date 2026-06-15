'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';
import { uploadFile } from '@/lib/supabase/storage';
import MultiFileUpload from '@/components/admin/FileUpload/MultiFileUpload';

export default function CrearBannerPage() {
  const router = useRouter();
  const supabase = createClient();

  const [imagenes, setImagenes] = useState([]);
  const [guardando, setGuardando] = useState(false);
  const [errorMsj, setErrorMsj] = useState('');

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (imagenes.length === 0) {
      setErrorMsj('Debes seleccionar al menos una imagen para el carrusel.');
      return;
    }

    setGuardando(true);
    setErrorMsj('');

    try {
      // Obtener el orden máximo actual
      const { data: maxOrderData } = await supabase
        .from('banners_inicio')
        .select('orden')
        .order('orden', { ascending: false })
        .limit(1);
      
      let nextOrder = maxOrderData && maxOrderData.length > 0 ? maxOrderData[0].orden + 1 : 1;

      // Subir y guardar cada imagen
      for (const img of imagenes) {
        // 1. Subir imagen
        const imagenUrl = await uploadFile(img, 'general');

        // 2. Guardar en BD
        const { error: insertError } = await supabase
          .from('banners_inicio')
          .insert({
            titulo: '', // Por defecto sin título cuando es subida múltiple
            imagen_url: imagenUrl,
            orden: nextOrder
          });

        if (insertError) throw insertError;
        nextOrder++;
      }

      // 3. Volver a la lista
      router.push('/admin/carrusel');
      router.refresh();

    } catch (error) {
      console.error('Error:', error);
      setErrorMsj('Ocurrió un error al guardar: ' + error.message);
      setGuardando(false);
    }
  };

  return (
    <div className="adminPage">
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '1.5rem' }}>
        <div>
          <h1 className="adminTitle">Agregar al Carrusel</h1>
          <p className="adminSubtitle">Sube múltiples imágenes de una sola vez para la pantalla principal.</p>
        </div>
      </div>

      <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '12px', padding: '1.25rem', marginBottom: '2rem', display: 'flex', gap: '1rem', alignItems: 'flex-start' }}>
        <div style={{ fontSize: '1.5rem', background: 'var(--admin-surface-2)', padding: '0.75rem', borderRadius: '10px' }}>🖼️</div>
        <div>
          <h3 style={{ fontSize: '1rem', fontWeight: 700, color: 'var(--admin-text)', marginBottom: '0.25rem' }}>Consejos de formato</h3>
          <p style={{ fontSize: '0.85rem', color: 'var(--admin-text-muted)', lineHeight: '1.5' }}>
            Las imágenes deben ser horizontales (preferiblemente de <strong>1920x1080px</strong>). Evita fotos con mucho texto, ya que la página añade su propio texto superpuesto de forma automática.
          </p>
        </div>
      </div>

      {errorMsj && (
        <div style={{ padding: '1rem', background: 'rgba(239, 68, 68, 0.1)', color: 'var(--admin-danger)', border: '1px solid rgba(239, 68, 68, 0.2)', borderRadius: '10px', marginBottom: '1.5rem', fontWeight: '500' }}>
          {errorMsj}
        </div>
      )}

      <div className="tableCard" style={{ padding: '2rem' }}>
        <form onSubmit={handleSubmit} style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
          
          <div>
            <label style={{ display: 'block', fontWeight: 'bold', marginBottom: '0.5rem' }}>
              Imágenes Principales
            </label>
            <MultiFileUpload 
              onFilesSelect={setImagenes} 
              accept="image/*"
              label="Haz clic o arrastra las imágenes aquí"
            />
            <p style={{ fontSize: '0.8rem', color: '#666', marginTop: '0.5rem' }}>
              Puedes elegir varias imágenes a la vez. Se recomienda resolución 1920x1080px (horizontal).
            </p>
          </div>

          <div style={{ display: 'flex', gap: '1rem', marginTop: '1rem' }}>
            <button 
              type="submit" 
              className="btnPrimary" 
              disabled={guardando || imagenes.length === 0}
              style={{ padding: '0.75rem 2rem', fontSize: '1rem' }}
            >
              {guardando ? 'Subiendo y Publicando...' : `Publicar ${imagenes.length} imágenes`}
            </button>
            <button 
              type="button" 
              onClick={() => router.back()}
              className="btnSecondary"
              style={{ padding: '0.75rem 2rem', fontSize: '1rem' }}
            >
              Cancelar
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}

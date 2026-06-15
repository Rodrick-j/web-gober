'use client';

import { useState } from 'react';
import { createClient } from '@/lib/supabase/client';
import { useRouter } from 'next/navigation';
import { deleteFile } from '@/lib/supabase/storage';

export default function DeleteBannerBtn({ banner }) {
  const [isDeleting, setIsDeleting] = useState(false);
  const router = useRouter();
  const supabase = createClient();

  const handleDelete = async () => {
    if (!window.confirm('¿Estás seguro de que quieres eliminar esta imagen del carrusel?')) return;
    
    setIsDeleting(true);
    
    try {
      // 1. Borrar de la BD
      const { error } = await supabase
        .from('banners_inicio')
        .delete()
        .eq('id', banner.id);
        
      if (error) throw error;

      // 2. Borrar del Storage (para no dejar basura)
      if (banner.imagen_url) {
        await deleteFile(banner.imagen_url);
      }

      router.refresh();
    } catch (err) {
      console.error(err);
      alert('Hubo un error al eliminar');
      setIsDeleting(false);
    }
  };

  return (
    <button 
      onClick={handleDelete}
      disabled={isDeleting}
      className="btnSecondary" 
      style={{ padding: '0.4rem 0.8rem', fontSize: '0.75rem', color: 'red', borderColor: 'red' }}
    >
      {isDeleting ? 'Borrando...' : 'Eliminar'}
    </button>
  );
}

'use client';

import { useEffect, useRef, useState } from 'react';
import Script from 'next/script';

export default function FacebookEmbed({ url, className = '' }) {
  const [isClient, setIsClient] = useState(false);

  useEffect(() => {
    setIsClient(true);
  }, []);

  if (!url) return null;

  // Determinar si es un video para usar el plugin correcto
  const isVideo = url.includes('/video') || url.includes('/watch');
  const pluginType = isVideo ? 'video.php' : 'post.php';
  
  const encodedUrl = encodeURIComponent(url);
  const iframeSrc = `https://www.facebook.com/plugins/${pluginType}?href=${encodedUrl}&show_text=true&width=500`;

  return (
    <div className={className} style={wrapperStyle}>
      {!isClient ? (
        <div style={skeletonStyle}>
          <span style={{ color: '#aaa', fontSize: '0.8rem' }}>Cargando publicación oficial...</span>
        </div>
      ) : (
        <div style={{ width: '100%', display: 'flex', flexDirection: 'column', alignItems: 'center', gap: '1.5rem' }}>
          {/* Botón arriba para que siempre sea visible sin importar si el iframe falla o deja mucho espacio en blanco */}
          <div style={{ padding: '0 1rem', width: '100%', display: 'flex', justifyContent: 'center' }}>
            <a 
              href={url} 
              target="_blank" 
              rel="noopener noreferrer"
              style={{
                display: 'inline-flex',
                alignItems: 'center',
                gap: '0.5rem',
                background: '#1877F2',
                color: 'white',
                padding: '0.5rem 1rem',
                borderRadius: '8px',
                fontSize: '0.9rem',
                fontWeight: '600',
                textDecoration: 'none',
                boxShadow: '0 2px 5px rgba(24, 119, 242, 0.3)'
              }}
            >
              <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
                <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.469h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.469h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
              </svg>
              Abrir publicación original en Facebook
            </a>
          </div>

          <iframe
            src={iframeSrc}
            width="500"
            height={isVideo ? "600" : "550"}
            style={{ border: 'none', overflow: 'hidden', maxWidth: '100%', background: 'transparent' }}
            scrolling="no"
            frameBorder="0"
            allowFullScreen={true}
            allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"
          ></iframe>
        </div>
      )}
    </div>
  );
}

const wrapperStyle = {
  width: '100%',
  display: 'flex',
  justifyContent: 'center',
  marginTop: '2rem',
  background: '#fff',
  borderRadius: '12px',
  padding: '1rem 0',
  boxShadow: '0 4px 15px rgba(0,0,0,0.05)',
  border: '1px solid #E5E7EB'
};

const skeletonStyle = {
  display: 'flex',
  flexDirection: 'column',
  alignItems: 'center',
  justifyContent: 'center',
  minHeight: '200px',
  background: '#F0F2F5',
  width: '100%',
  borderRadius: '8px'
};

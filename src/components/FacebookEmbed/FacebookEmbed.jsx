'use client';

import { useEffect, useRef, useState } from 'react';
import Script from 'next/script';

/**
 * Extrae la URL base de la PÁGINA de Facebook a partir de cualquier URL.
 * Ej: https://www.facebook.com/GobernacionDeOruro/posts/123
 *  → https://www.facebook.com/GobernacionDeOruro
 */
function extractPageUrl(url, fallbackPage = 'GobernacionDeOruro') {
  try {
    const u = new URL(url);
    const parts = u.pathname.split('/').filter(Boolean);
    // /watch, /video, etc. no tienen slug de página → usar fallback
    if (parts.length === 0 || ['watch', 'video', 'reel', 'reels'].includes(parts[0])) {
      return `https://www.facebook.com/${fallbackPage}`;
    }
    return `https://www.facebook.com/${parts[0]}`;
  } catch {
    return `https://www.facebook.com/${fallbackPage}`;
  }
}

export default function FacebookEmbed({ url, fallbackPage = 'GobernacionDeOruro', className = '' }) {
  const containerRef = useRef(null);
  const [sdkLoaded, setSdkLoaded] = useState(false);
  const [isClient, setIsClient] = useState(false);

  const pageUrl = extractPageUrl(url, fallbackPage);

  useEffect(() => {
    setIsClient(true);
    if (typeof window !== 'undefined' && window.FB) {
      setSdkLoaded(true);
    }
  }, []);

  useEffect(() => {
    if (sdkLoaded && containerRef.current) {
      try {
        window.FB.XFBML.parse(containerRef.current);
      } catch (e) {
        console.error('Facebook XFBML error:', e);
      }
    }
  }, [sdkLoaded, pageUrl]);

  if (!url) return null;

  return (
    <div className={className} style={wrapperStyle}>
      <Script
        id="facebook-jssdk-page"
        src="https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v19.0"
        strategy="lazyOnload"
        onLoad={() => setSdkLoaded(true)}
      />

      {!isClient ? (
        /* Skeleton SSR */
        <div style={skeletonStyle}>
          <svg width="32" height="32" viewBox="0 0 24 24" fill="#1877F2" opacity="0.3">
            <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.469h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.469h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
          </svg>
          <span style={{ color: '#aaa', fontSize: '0.8rem', marginTop: '0.5rem' }}>Cargando Facebook...</span>
        </div>
      ) : (
        <div ref={containerRef}>
          <div
            className="fb-page"
            data-href={pageUrl}
            data-tabs="timeline"
            data-width=""
            data-height="400"
            data-small-header="false"
            data-adapt-container-width="true"
            data-hide-cover="false"
            data-show-facepile="true"
          >
            {/* Fallback si el SDK falla */}
            <blockquote cite={pageUrl} className="fb-xfbml-parse-ignore">
              <a href={pageUrl} target="_blank" rel="noopener noreferrer">
                Ver página en Facebook
              </a>
            </blockquote>
          </div>
        </div>
      )}
    </div>
  );
}

const wrapperStyle = {
  borderRadius: '12px',
  overflow: 'hidden',
  border: '1px solid #D8DADF',
  background: '#fff',
};

const skeletonStyle = {
  display: 'flex',
  flexDirection: 'column',
  alignItems: 'center',
  justifyContent: 'center',
  minHeight: '200px',
  background: '#F0F2F5',
};

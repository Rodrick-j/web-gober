'use client';

import React, { useEffect, useRef, useState } from 'react';
import Script from 'next/script';

export default function FacebookPageFeed({
  pageUrl = 'https://www.facebook.com/GobernacionDeOruro',
  tabs = 'timeline',
  width = '',
  height = 500,
  smallHeader = false,
  adaptContainerWidth = true,
  hideCover = false,
  showFacepile = true,
  locale = 'es_LA',
  version = 'v19.0',
  className = '',
}) {
  const containerRef = useRef(null);
  const [sdkLoaded, setSdkLoaded] = useState(false);
  const [isClient, setIsClient] = useState(false);

  // Garantizar que solo renderizamos e hidratamos del lado del cliente (SSR safe)
  useEffect(() => {
    setIsClient(true);
    if (typeof window !== 'undefined' && window.FB) {
      setSdkLoaded(true);
    }
  }, []);

  // Función encargada de pedir a Facebook que analice y renderice el widget XFBML dentro del contenedor
  const parseFacebookPlugin = () => {
    if (typeof window !== 'undefined' && window.FB && window.FB.XFBML && containerRef.current) {
      try {
        window.FB.XFBML.parse(containerRef.current);
      } catch (error) {
        console.error('Error al analizar el widget de Facebook (XFBML):', error);
      }
    }
  };

  // Re-analizar el widget si cambian las props o cuando el SDK termina de cargar
  useEffect(() => {
    if (sdkLoaded) {
      parseFacebookPlugin();
    }
  }, [sdkLoaded, pageUrl, tabs, width, height]);

  // Manejo responsivo inteligente: si el usuario redimensiona la ventana,
  // volvemos a llamar a XFBML.parse con un debounce para reajustar al nuevo ancho en móviles/tablets
  useEffect(() => {
    if (!sdkLoaded || typeof window === 'undefined') return;

    let resizeTimer;
    const handleResize = () => {
      clearTimeout(resizeTimer);
      resizeTimer = setTimeout(() => {
        parseFacebookPlugin();
      }, 500);
    };

    window.addEventListener('resize', handleResize);
    return () => {
      clearTimeout(resizeTimer);
      window.removeEventListener('resize', handleResize);
    };
  }, [sdkLoaded]);

  if (!isClient) {
    // Skeleton / placeholder de carga durante el SSR para evitar Hydration Mismatch
    return (
      <div
        className={`w-full max-w-[500px] mx-auto overflow-hidden rounded-xl bg-slate-100 border border-slate-200 shadow-sm animate-pulse flex flex-col items-center justify-center ${className}`}
        style={{ minHeight: typeof height === 'number' ? `${height}px` : '500px' }}
      >
        <div className="w-12 h-12 rounded-full bg-blue-500/20 mb-3 flex items-center justify-center">
          <span className="text-blue-600 font-bold text-xl">f</span>
        </div>
        <p className="text-sm font-medium text-slate-400">Cargando feed de Facebook...</p>
      </div>
    );
  }

  return (
    <div className={`w-full max-w-[500px] mx-auto flex flex-col items-center ${className}`}>
      {/* 1. CARGA ASÍNCRONA DEL SDK MEDIANTE next/script */}
      <Script
        id="facebook-jssdk"
        src={`https://connect.facebook.net/${locale}/sdk.js#xfbml=1&version=${version}`}
        strategy="lazyOnload"
        onLoad={() => {
          setSdkLoaded(true);
          parseFacebookPlugin();
        }}
      />

      {/* 2. CONTENEDOR RESPONSIVO CON REF */}
      <div
        ref={containerRef}
        className="w-full flex justify-center overflow-hidden rounded-xl bg-white shadow-sm border border-slate-100"
      >
        {/* Contenedor nativo que lee y transforma el sdk.js */}
        <div
          className="fb-page w-full"
          data-href={pageUrl}
          data-tabs={tabs}
          data-width={width || ''}
          data-height={height}
          data-small-header={smallHeader}
          data-adapt-container-width={adaptContainerWidth}
          data-hide-cover={hideCover}
          data-show-facepile={showFacepile}
        >
          {/* Fallback semántico y accesible si el script aún no ha cargado o falla por adblockers */}
          <blockquote cite={pageUrl} className="fb-xfbml-parse-ignore hidden">
            <a href={pageUrl} target="_blank" rel="noopener noreferrer">
              Ver página oficial en Facebook
            </a>
          </blockquote>
        </div>
      </div>
    </div>
  );
}

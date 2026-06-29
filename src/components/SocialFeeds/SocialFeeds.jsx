'use client';

import React, { useEffect } from 'react';
import styles from './SocialFeeds.module.css';

export default function SocialFeeds({ redes }) {
  useEffect(() => {
    // Cargar script de TikTok dinámicamente
    const script = document.createElement('script');
    script.src = 'https://www.tiktok.com/embed.js';
    script.async = true;
    document.body.appendChild(script);
    
    return () => {
      if (document.body.contains(script)) {
        document.body.removeChild(script);
      }
    };
  }, []);

  // URLs por defecto si no existen
  const fbUrl = redes?.facebook && redes.facebook !== '#' ? redes.facebook : 'https://www.facebook.com/GobernacionDeOruro';
  const igUrl = redes?.instagram && redes.instagram !== '#' ? redes.instagram : 'https://www.instagram.com/infounicom.gador/';
  const tkUrl = redes?.tiktok && redes.tiktok !== '#' ? redes.tiktok : 'https://www.tiktok.com/@gobiernodeunidad';
  const ytUrl = redes?.youtube && redes.youtube !== '#' ? redes.youtube : 'https://www.youtube.com/channel/UC5q5rDsXdlXm3fbYSk-AcuA';

  // Helper para extraer un "username" limpio de las URLs para que se vea bien en el UI
  const extractHandle = (url, prefix = '@') => {
    try {
      const u = new URL(url);
      const paths = u.pathname.split('/').filter(Boolean);
      return paths.length > 0 ? `${prefix}${paths[paths.length - 1]}` : `${prefix}gador`;
    } catch (e) {
      return `${prefix}gador`;
    }
  };

  return (
    <section className={styles.container}>
      <h2 className={styles.title}>Nuestras Redes Sociales</h2>
      <p className={styles.subtitle}>
        Mantente informado y conectado con todas las actividades, noticias y comunicados del Gobierno Autónomo Departamental de Oruro.
      </p>

      <div className={styles.grid}>

        {/* 1. FACEBOOK (Iframe nativo) */}
        <div className={styles.card}>
          <iframe
            src={`https://www.facebook.com/plugins/page.php?href=${encodeURIComponent(fbUrl)}&tabs=timeline&width=340&height=400&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId`}
            width="100%"
            height="100%"
            style={{ border: 'none', overflow: 'hidden' }}
            scrolling="no"
            frameBorder="0"
            allowFullScreen={true}
            allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"
            title="Facebook Feed"
            className={styles.fbContainer}
          ></iframe>
        </div>

        {/* 2. INSTAGRAM (Profile Card) */}
        <div className={styles.card}>
          <div className={`${styles.profileHeader} ${styles.igHeader}`}>
            <div className={styles.profileAvatar}>
              <img src="/footer_icon.jpg" alt="Logo GADOR" />
            </div>
          </div>
          <div className={styles.profileBody}>
            <h3 className={styles.profileName}>GADOR Oruro</h3>
            <span className={styles.profileHandle}>{extractHandle(igUrl, '@')}</span>
            
            <div className={styles.profileStats}>
              <div className={styles.stat}>
                <span className={styles.statValue}>5K+</span>
                <span className={styles.statLabel}>Seguidores</span>
              </div>
              <div className={styles.stat}>
                <span className={styles.statValue}>1.2K</span>
                <span className={styles.statLabel}>Publicaciones</span>
              </div>
            </div>

            <a href={igUrl} target="_blank" rel="noopener noreferrer" className={`${styles.profileBtn} ${styles.igBtn}`}>
              <svg stroke="currentColor" fill="currentColor" strokeWidth="0" viewBox="0 0 448 512" height="1.2em" width="1.2em" xmlns="http://www.w3.org/2000/svg"><path d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"></path></svg>
              Ver perfil en Instagram
            </a>
          </div>
        </div>

        {/* 3. TIKTOK (Profile Card) */}
        <div className={styles.card}>
          <div className={`${styles.profileHeader} ${styles.tkHeader}`}>
            <div className={styles.profileAvatar}>
              <img src="/footer_icon.jpg" alt="Logo GADOR" />
            </div>
          </div>
          <div className={styles.profileBody}>
            <h3 className={styles.profileName}>Gobierno de Unidad</h3>
            <span className={styles.profileHandle}>{extractHandle(tkUrl, '@')}</span>
            
            <div className={styles.profileStats}>
              <div className={styles.stat}>
                <span className={styles.statValue}>15K+</span>
                <span className={styles.statLabel}>Seguidores</span>
              </div>
              <div className={styles.stat}>
                <span className={styles.statValue}>500K</span>
                <span className={styles.statLabel}>Me gusta</span>
              </div>
            </div>

            <a href={tkUrl} target="_blank" rel="noopener noreferrer" className={`${styles.profileBtn} ${styles.tkBtn}`}>
              <svg stroke="currentColor" fill="currentColor" strokeWidth="0" viewBox="0 0 448 512" height="1.2em" width="1.2em" xmlns="http://www.w3.org/2000/svg"><path d="M448,209.91a210.06,210.06,0,0,1-122.77-39.25V349.38A162.55,162.55,0,1,1,185,188.31V278.2a74.62,74.62,0,1,0,52.23,71.18V0l88,0a121.18,121.18,0,0,0,1.86,22.17h0A122.18,122.18,0,0,0,381,102.39a121.43,121.43,0,0,0,67,20.14Z"></path></svg>
              Descubrir más en TikTok
            </a>
          </div>
        </div>

        {/* 4. YOUTUBE (Iframe Embed o Profile Card) */}
        <div className={styles.card}>
          {ytUrl.includes('channel/UC') || ytUrl.includes('@GobOruro') ? (
            <iframe
              src={`https://www.youtube.com/embed/videoseries?list=${
                ytUrl.includes('channel/UC') 
                  ? ytUrl.split('channel/')[1].split('?')[0].replace('UC', 'UU') 
                  : 'UU5q5rDsXdlXm3fbYSk-AcuA' // ID exacto del canal de GobOruro
              }`}
              width="100%"
              height="100%"
              style={{ border: 'none', overflow: 'hidden' }}
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowFullScreen
              title="YouTube Feed"
              className={styles.fbContainer}
            ></iframe>
          ) : (
            <>
              <div className={`${styles.profileHeader} ${styles.ytHeader}`}>
                <div className={styles.profileAvatar}>
                  <img src="/footer_icon.jpg" alt="Logo GADOR" />
                </div>
              </div>
              <div className={styles.profileBody}>
                <h3 className={styles.profileName}>Gobernación Oruro</h3>
                <span className={styles.profileHandle}>{extractHandle(ytUrl, '@')}</span>
                
                <div className={styles.profileStats}>
                  <div className={styles.stat}>
                    <span className={styles.statValue}>▶️</span>
                    <span className={styles.statLabel}>Videos Exclusivos</span>
                  </div>
                  <div className={styles.stat}>
                    <span className={styles.statValue}>HD</span>
                    <span className={styles.statLabel}>Calidad</span>
                  </div>
                </div>

                <a href={ytUrl} target="_blank" rel="noopener noreferrer" className={`${styles.profileBtn} ${styles.ytBtn}`}>
                  <svg stroke="currentColor" fill="currentColor" strokeWidth="0" viewBox="0 0 576 512" height="1.2em" width="1.2em" xmlns="http://www.w3.org/2000/svg"><path d="M549.655 124.083c-6.281-23.65-24.787-42.276-48.284-48.597C458.781 64 288 64 288 64S117.22 64 74.629 75.486c-23.497 6.322-42.003 24.947-48.284 48.597-11.412 42.867-11.412 132.305-11.412 132.305s0 89.438 11.412 132.305c6.281 23.65 24.787 41.5 48.284 47.821C117.22 448 288 448 288 448s170.78 0 213.371-11.486c23.497-6.321 42.003-24.171 48.284-47.821 11.412-42.867 11.412-132.305 11.412-132.305s0-89.438-11.412-132.305zm-317.51 213.508V175.185l142.739 81.205-142.739 81.201z"></path></svg>
                  Suscribirse al canal
                </a>
              </div>
            </>
          )}
        </div>

      </div>
    </section>
  );
}

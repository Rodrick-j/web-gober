'use client';

import React from 'react';
import styles from './SocialFeeds.module.css';

export default function SocialFeeds({ redes }) {
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
      <div className={styles.bgGlow1}></div>
      <div className={styles.bgGlow2}></div>

      <div className={styles.headerArea}>
        <span className={styles.badge}>Canales Oficiales</span>
        <h2 className={styles.title}>Nuestras Redes Sociales</h2>
        <p className={styles.subtitle}>
          Mantente informado y conectado con todas las actividades, noticias y comunicados del Gobierno Autónomo Departamental de Oruro.
        </p>
      </div>

      <div className={styles.grid}>

        {/* 1. CARD FACEBOOK */}
        <div className={`${styles.card} ${styles.fbCard}`}>
          <div className={`${styles.banner} ${styles.fbBanner}`}>
            <div className={styles.platformBadge}>
              <svg className={styles.platformIcon} viewBox="0 0 24 24" fill="currentColor">
                <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
              </svg>
            </div>
            <div className={styles.avatarWrapper}>
              <img src="/footer_icon.jpg" alt="Avatar GADOR" className={styles.avatar} />
              <div className={`${styles.statusRing} ${styles.fbRing}`}></div>
            </div>
          </div>

          <div className={styles.body}>
            <div className={styles.profileInfo}>
              <div className={styles.nameRow}>
                <h3 className={styles.name}>Gobernación de Oruro</h3>
                <span className={`${styles.verifiedBadge} ${styles.fbVerified}`} title="Cuenta Oficial Verificada">✓</span>
              </div>
              <span className={styles.handle}>{extractHandle(fbUrl, '@')}</span>
            </div>

            <div className={styles.stats}>
              <div className={styles.stat}>
                <span className={styles.statVal}>120K+</span>
                <span className={styles.statLbl}>Seguidores</span>
              </div>
              <div className={styles.divider}></div>
              <div className={styles.stat}>
                <span className={styles.statVal}>95K+</span>
                <span className={styles.statLbl}>Me gusta</span>
              </div>
            </div>

            <div className={styles.previewContainer}>
              <div className={styles.fbPostMock}>
                <div className={styles.mockHeader}>
                  <img src="/footer_icon.jpg" alt="Avatar" className={styles.mockMiniAvatar} />
                  <div>
                    <div className={styles.mockUser}>GAD-OR Oruro</div>
                    <div className={styles.mockTime}>Hace 2 horas · 📌 Fijado</div>
                  </div>
                </div>
                <p className={styles.mockText}>
                  El Gobierno Autónomo Departamental de Oruro realiza la entrega oficial de equipamiento y medicamentos esenciales...
                </p>
                <div className={styles.mockInteractions}>
                  <span>👍 482</span>
                  <span>💬 54</span>
                  <span>🔄 38</span>
                </div>
              </div>
            </div>

            <a href={fbUrl} target="_blank" rel="noopener noreferrer" className={`${styles.btn} ${styles.fbBtn}`}>
              Seguir en Facebook
            </a>
          </div>
        </div>

        {/* 2. CARD INSTAGRAM */}
        <div className={`${styles.card} ${styles.igCard}`}>
          <div className={`${styles.banner} ${styles.igBanner}`}>
            <div className={styles.platformBadge}>
              <svg className={styles.platformIcon} viewBox="0 0 24 24" fill="currentColor">
                <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zM12 0C8.741 0 8.333.014 7.053.072 2.695.272.273 2.69.073 7.051.014 8.333 0 8.741 0 12c0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98C15.668.014 15.259 0 12 0zm0 5.838a6.162 6.162 0 100 12.324 6.162 6.162 0 000-12.324zM12 16a4 4 0 110-8 4 4 0 010 8zm6.406-11.845a1.44 1.44 0 100 2.881 1.44 1.44 0 000-2.881z"/>
              </svg>
            </div>
            <div className={styles.avatarWrapper}>
              <img src="/footer_icon.jpg" alt="Avatar GADOR" className={styles.avatar} />
              <div className={`${styles.statusRing} ${styles.igRing}`}></div>
            </div>
          </div>

          <div className={styles.body}>
            <div className={styles.profileInfo}>
              <div className={styles.nameRow}>
                <h3 className={styles.name}>GADOR Oruro</h3>
                <span className={`${styles.verifiedBadge} ${styles.igVerified}`} title="Cuenta Oficial Verificada">✓</span>
              </div>
              <span className={styles.handle}>{extractHandle(igUrl, '@')}</span>
            </div>

            <div className={styles.stats}>
              <div className={styles.stat}>
                <span className={styles.statVal}>8.5K</span>
                <span className={styles.statLbl}>Seguidores</span>
              </div>
              <div className={styles.divider}></div>
              <div className={styles.stat}>
                <span className={styles.statVal}>1.2K</span>
                <span className={styles.statLbl}>Publicaciones</span>
              </div>
            </div>

            <div className={styles.previewContainer}>
              <div className={styles.igGridMock}>
                <div className={styles.igMockItem} style={{ background: 'linear-gradient(135deg, #ffb843, #d61432)' }}>
                  <div className={styles.igMockOverlay}>❤️ 142</div>
                </div>
                <div className={styles.igMockItem} style={{ background: 'linear-gradient(135deg, #079c81, #0052C2)' }}>
                  <div className={styles.igMockOverlay}>❤️ 98</div>
                </div>
                <div className={styles.igMockItem} style={{ background: 'linear-gradient(135deg, #67181a, #ffb843)' }}>
                  <div className={styles.igMockOverlay}>❤️ 215</div>
                </div>
              </div>
            </div>

            <a href={igUrl} target="_blank" rel="noopener noreferrer" className={`${styles.btn} ${styles.igBtn}`}>
              Ver en Instagram
            </a>
          </div>
        </div>

        {/* 3. CARD TIKTOK */}
        <div className={`${styles.card} ${styles.tkCard}`}>
          <div className={`${styles.banner} ${styles.tkBanner}`}>
            <div className={styles.platformBadge}>
              <svg className={styles.platformIcon} viewBox="0 0 24 24" fill="currentColor">
                <path d="M12.525.02c1.31-.02 2.61-.01 3.91-.02.08 1.53.63 3.09 1.75 4.17 1.12 1.11 2.7 1.62 4.24 1.79v4.03c-1.44-.17-2.86-.74-3.99-1.72-.08-.07-.15-.15-.22-.23v6.52c-.03 2.32-.82 4.67-2.5 6.07-1.89 1.67-4.66 2.05-6.96 1.16-2.87-1.11-4.73-4.21-4.52-7.3.18-3.32 2.76-6.19 6.07-6.52v4.1c-1.38.16-2.59 1.18-2.89 2.53-.4 1.83.74 3.75 2.58 4.11 1.56.33 3.23-.46 3.73-1.97.1-.31.14-.63.14-.95V.02z"/>
              </svg>
            </div>
            <div className={styles.avatarWrapper}>
              <img src="/footer_icon.jpg" alt="Avatar GADOR" className={styles.avatar} />
              <div className={`${styles.statusRing} ${styles.tkRing}`}></div>
            </div>
          </div>

          <div className={styles.body}>
            <div className={styles.profileInfo}>
              <div className={styles.nameRow}>
                <h3 className={styles.name}>Gobierno de Unidad</h3>
                <span className={`${styles.verifiedBadge} ${styles.tkVerified}`} title="Cuenta Oficial Verificada">✓</span>
              </div>
              <span className={styles.handle}>{extractHandle(tkUrl, '@')}</span>
            </div>

            <div className={styles.stats}>
              <div className={styles.stat}>
                <span className={styles.statVal}>25.4K</span>
                <span className={styles.statLbl}>Seguidores</span>
              </div>
              <div className={styles.divider}></div>
              <div className={styles.stat}>
                <span className={styles.statVal}>500K+</span>
                <span className={styles.statLbl}>Me gusta</span>
              </div>
            </div>

            <div className={styles.previewContainer}>
              <div className={styles.tkVideoMock}>
                <div className={styles.tkVideoThumbnail}>
                  <div className={styles.playIconWrapper}>
                    <div className={styles.playIcon}></div>
                  </div>
                  <span className={styles.tkViewCount}>▶ 38.2K views</span>
                  <div className={styles.tkMockText}>¡Oruro avanza en infraestructura vial! 🚀 #Gestión #Oruro</div>
                </div>
              </div>
            </div>

            <a href={tkUrl} target="_blank" rel="noopener noreferrer" className={`${styles.btn} ${styles.tkBtn}`}>
              Seguir en TikTok
            </a>
          </div>
        </div>

        {/* 4. CARD YOUTUBE */}
        <div className={`${styles.card} ${styles.ytCard}`}>
          <div className={`${styles.banner} ${styles.ytBanner}`}>
            <div className={styles.platformBadge}>
              <svg className={styles.platformIcon} viewBox="0 0 24 24" fill="currentColor">
                <path d="M23.498 6.163a3.003 3.003 0 00-2.11-2.11C19.518 3.545 12 3.545 12 3.545s-7.518 0-9.388.508a3.003 3.003 0 00-2.11 2.11C0 8.033 0 12 0 12s0 3.967.502 5.837a3.003 3.003 0 002.11 2.11c1.87.508 9.388.508 9.388.508s7.518 0 9.388-.508a3.003 3.003 0 002.11-2.11C24 15.967 24 12 24 12s0-3.967-.502-5.837zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>
              </svg>
            </div>
            <div className={styles.avatarWrapper}>
              <img src="/footer_icon.jpg" alt="Avatar GADOR" className={styles.avatar} />
              <div className={`${styles.statusRing} ${styles.ytRing}`}></div>
            </div>
          </div>

          <div className={styles.body}>
            <div className={styles.profileInfo}>
              <div className={styles.nameRow}>
                <h3 className={styles.name}>Gobernación Oruro</h3>
                <span className={`${styles.verifiedBadge} ${styles.ytVerified}`} title="Cuenta Oficial Verificada">✓</span>
              </div>
              <span className={styles.handle}>{extractHandle(ytUrl, '@')}</span>
            </div>

            <div className={styles.stats}>
              <div className={styles.stat}>
                <span className={styles.statVal}>10.2K</span>
                <span className={styles.statLbl}>Suscriptores</span>
              </div>
              <div className={styles.divider}></div>
              <div className={styles.stat}>
                <span className={styles.statVal}>340</span>
                <span className={styles.statLbl}>Videos</span>
              </div>
            </div>

            <div className={styles.previewContainer}>
              <div className={styles.ytVideoMock}>
                <div className={styles.ytVideoThumbnail}>
                  <div className={styles.ytPlayBtnWrapper}>
                    <div className={styles.ytPlayBtn}></div>
                  </div>
                  <span className={styles.ytDuration}>14:20</span>
                  <div className={styles.ytMockTitle}>Resumen Semanal de Gestión y Obras Públicas - Oruro 2026</div>
                </div>
              </div>
            </div>

            <a href={ytUrl} target="_blank" rel="noopener noreferrer" className={`${styles.btn} ${styles.ytBtn}`}>
              Ver en YouTube
            </a>
          </div>
        </div>

      </div>
    </section>
  );
}


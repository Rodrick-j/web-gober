'use client';

import { Swiper, SwiperSlide } from 'swiper/react';
import { Autoplay, EffectCreative, EffectFade, EffectCoverflow, Pagination, Navigation } from 'swiper/modules';
import Link from 'next/link';
import Image from 'next/image';

// Importar los estilos core de Swiper
import 'swiper/css';
import 'swiper/css/effect-creative';
import 'swiper/css/effect-fade';
import 'swiper/css/effect-coverflow';
import 'swiper/css/pagination';
import 'swiper/css/navigation';

import styles from './HeroSlider.module.css';

export default function HeroSlider({ banners, redes }) {
  // Si no hay banners, mostramos un fallback
  if (!banners || banners.length === 0) {
    return (
      <section className={styles.heroFallback}>
        <div className={styles.overlay}></div>
        <div className={styles.content}>
          <h1 className={styles.title}>
            Gobierno Autónomo<br />Departamental de <span className={styles.highlight}>Oruro</span>
          </h1>
          <p className={styles.subtitle}>
            Trabajando por el desarrollo integral, la transparencia and el bienestar de todos los ciudadanos del Departamento de Oruro.
          </p>
        </div>
      </section>
    );
  }

  const globalEffect = banners[0]?.animacion_carrusel || 'fade'; // Fade es mucho más cinematográfico y elegante

  return (
    <section className={styles.sliderSection}>
      <div className={styles.sliderFrame}>
        <Swiper
          modules={[Autoplay, EffectCreative, EffectFade, EffectCoverflow, Pagination, Navigation]}
          effect={globalEffect}
          speed={globalEffect === 'fade' ? 1200 : 1000}
          creativeEffect={
            globalEffect === 'creative' ? {
              prev: { shadow: true, translate: ['-20%', 0, -1] },
              next: { translate: ['100%', 0, 0] },
            } : undefined
          }
          coverflowEffect={
            globalEffect === 'coverflow' ? {
              rotate: 30, stretch: 0, depth: 100, modifier: 1, slideShadows: true,
            } : undefined
          }
          fadeEffect={
            globalEffect === 'fade' ? { crossFade: true } : undefined
          }
          autoplay={{ delay: 5000, disableOnInteraction: false }}
          pagination={{
            clickable: true,
            bulletClass: `swiper-pagination-bullet ${styles.customBullet}`,
            bulletActiveClass: `swiper-pagination-bullet-active ${styles.customBulletActive}`,
          }}
          navigation={{
            prevEl: '.custom-nav-prev',
            nextEl: '.custom-nav-next',
          }}
          loop={true}
          className={styles.swiperRoot}
        >
          {banners.map((banner, index) => (
            <SwiperSlide key={banner.id}>
              <div className={styles.slideInner}>
                {/* Fondo desenfocado para evitar bordes vacíos */}
                <div className={styles.bgBlur}>
                  <Image
                    src={banner.imagen_url}
                    alt=""
                    fill
                    style={{ objectFit: 'cover' }}
                    sizes="100vw"
                    priority={index === 0}
                    quality={20}
                  />
                </div>
                <div className={styles.bgOverlay} />

                {/* Imagen principal */}
                <div className={styles.bgImage}>
                  {/* Desktop Image */}
                  <Image
                    src={banner.imagen_url}
                    alt={banner.titulo || 'Banner Gobernación de Oruro'}
                    fill
                    sizes="100vw"
                    priority={index === 0}
                    className={`${styles.mainImage} ${banner.imagen_movil_url ? styles.hideOnMobile : ''}`}
                  />
                  
                  {/* Mobile Image */}
                  {banner.imagen_movil_url && (
                    <Image
                      src={banner.imagen_movil_url}
                      alt={`${banner.titulo || 'Banner'} móvil`}
                      fill
                      sizes="100vw"
                      priority={index === 0}
                      className={`${styles.mainImage} ${styles.showOnlyOnMobile}`}
                    />
                  )}
                </div>
                
                {/* Capa fotográfica y degradados */}
                <div className={styles.gradientOverlay} />
                <div className={styles.lightLeakOverlay} />

                {/* Contenido flotante: Solo si hay un título o enlace */}
                {(banner.titulo || banner.enlace_url) && (
                  <div className={styles.slideContentWrapper}>
                    <div className={`${styles.slideContentCard} ${styles[banner.animacion_texto || 'fade-up']}`}>
                      <div className={styles.cardHeader}>
                        <span className={styles.tagLine}>Comunicación Oficial</span>
                        <div className={styles.activeIndicator}></div>
                      </div>
                      
                      <h2 className={styles.slideTitle}>
                        {banner.titulo}
                      </h2>
                      
                      <p className={styles.slideDesc}>
                        Impulsando el desarrollo integral del departamento con gestión eficiente, transparencia y obras de impacto para toda la población orureña.
                      </p>
                      
                      {banner.enlace_url && (
                        <div className={styles.actionWrapper}>
                          <Link href={banner.enlace_url} className={styles.slideLink}>
                            <span>Ver Detalles</span>
                            <svg className={styles.linkArrow} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
                              <path d="M5 12h14M12 5l7 7-7 7"/>
                            </svg>
                          </Link>
                        </div>
                      )}
                    </div>
                  </div>
                )}
              </div>
            </SwiperSlide>
          ))}
        </Swiper>

        {/* Custom Navigation Arrows */}
        <button className={`${styles.customNav} ${styles.navPrev} custom-nav-prev`} aria-label="Anterior">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
            <path d="M15 18l-6-6 6-6"/>
          </svg>
        </button>
        <button className={`${styles.customNav} ${styles.navNext} custom-nav-next`} aria-label="Siguiente">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
            <path d="M9 18l6-6-6-6"/>
          </svg>
        </button>

        {/* Floating Social Networks */}
        {redes && (
          <div className={styles.floatingSocials}>
            {redes.facebook && redes.facebook !== '#' && (
              <a href={redes.facebook} target="_blank" rel="noopener noreferrer" aria-label="Facebook" className={`${styles.socialIcon} ${styles.fb}`}>
                <svg viewBox="0 0 24 24" fill="currentColor"><path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/></svg>
              </a>
            )}
            <a href="https://www.instagram.com/infounicom.gador/" target="_blank" rel="noopener noreferrer" aria-label="Instagram" className={`${styles.socialIcon} ${styles.ig}`}>
              <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zM12 0C8.741 0 8.333.014 7.053.072 2.695.272.273 2.69.073 7.051.014 8.333 0 8.741 0 12c0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98C15.668.014 15.259 0 12 0zm0 5.838a6.162 6.162 0 100 12.324 6.162 6.162 0 000-12.324zM12 16a4 4 0 110-8 4 4 0 010 8zm6.406-11.845a1.44 1.44 0 100 2.881 1.44 1.44 0 000-2.881z"/></svg>
            </a>
            <a href="https://www.tiktok.com/@gobiernodeunidad?_r=1&_t=ZS-97VsdEjk5VS" target="_blank" rel="noopener noreferrer" aria-label="TikTok" className={`${styles.socialIcon} ${styles.tk}`}>
              <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12.525.02c1.31-.02 2.61-.01 3.91-.02.08 1.53.63 3.09 1.75 4.17 1.12 1.11 2.7 1.62 4.24 1.79v4.03c-1.44-.17-2.86-.74-3.99-1.72-.08-.07-.15-.15-.22-.23v6.52c-.03 2.32-.82 4.67-2.5 6.07-1.89 1.67-4.66 2.05-6.96 1.16-2.87-1.11-4.73-4.21-4.52-7.3.18-3.32 2.76-6.19 6.07-6.52v4.1c-1.38.16-2.59 1.18-2.89 2.53-.4 1.83.74 3.75 2.58 4.11 1.56.33 3.23-.46 3.73-1.97.1-.31.14-.63.14-.95V.02z"/></svg>
            </a>
            <a href="https://www.youtube.com/channel/UC5q5rDsXdlXm3fbYSk-AcuA" target="_blank" rel="noopener noreferrer" aria-label="YouTube" className={`${styles.socialIcon} ${styles.yt}`}>
              <svg viewBox="0 0 24 24" fill="currentColor"><path d="M23.498 6.163a3.003 3.003 0 00-2.11-2.11C19.518 3.545 12 3.545 12 3.545s-7.518 0-9.388.508a3.003 3.003 0 00-2.11 2.11C0 8.033 0 12 0 12s0 3.967.502 5.837a3.003 3.003 0 002.11 2.11c1.87.508 9.388.508 9.388.508s7.518 0 9.388-.508a3.003 3.003 0 002.11-2.11C24 15.967 24 12 24 12s0-3.967-.502-5.837zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/></svg>
            </a>
          </div>
        )}
      </div>
    </section>
  );
}

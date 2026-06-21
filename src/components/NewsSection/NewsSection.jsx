'use client';
import Link from 'next/link';
import Image from 'next/image';
import ScrollReveal from '@/components/ScrollReveal/ScrollReveal';
import styles from './NewsSection.module.css';

export default function NewsSection({ noticias = [] }) {
  // Use DB data if available
  const displayNoticias = noticias.length > 0 ? noticias : [];
  
  // Separate featured (first one) and others (next 4)
  const featured = displayNoticias.length > 0 ? {
    id: displayNoticias[0].id,
    category: displayNoticias[0].secretarias?.nombre_corto || 'Institucional',
    date: new Date(displayNoticias[0].fecha_publicacion).toLocaleDateString('es-ES', { day: 'numeric', month: 'short', year: 'numeric' }),
    title: displayNoticias[0].titulo,
    excerpt: displayNoticias[0].resumen,
    readTime: '3 min', // Placeholder or calculated
    emoji: displayNoticias[0].secretarias?.icono || '📰',
    imagen: displayNoticias[0].imagen_portada_url || '/placeholder-news.jpg',
    video: displayNoticias[0].video_youtube_url || null,
  } : null;

  const news = displayNoticias.length > 1 ? displayNoticias.slice(1).map(n => ({
    id: n.id,
    category: n.secretarias?.nombre_corto || 'Institucional',
    date: new Date(n.fecha_publicacion).toLocaleDateString('es-ES', { day: 'numeric', month: 'short', year: 'numeric' }),
    title: n.titulo,
    excerpt: n.resumen,
    emoji: n.secretarias?.icono || '📰',
    imagen: n.imagen_portada_url || '/placeholder-news.jpg',
    video: n.video_youtube_url || null,
  })) : [];

  const videos = displayNoticias.filter(n => n.video_youtube_url);

  return (
    <section className={`section ${styles.newsSection}`} id="noticias">
      <div className="container">

        {/* Header */}
        <ScrollReveal direction="up" className={`section-header ${styles.newsHeader}`}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-end', flexWrap: 'wrap', gap: '1rem' }}>
            <div>
              <span className="section-label">Sala de Prensa</span>
              <h2 className="section-title" style={{ textAlign: 'left' }}>Últimas Noticias</h2>
              <div className="divider divider-left" />
            </div>
            <Link href="/noticias" className="btn btn-outline" id="all-news-btn">
              Ver todas las noticias
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <path d="M5 12h14M12 5l7 7-7 7"/>
              </svg>
            </Link>
          </div>
        </ScrollReveal>

        {/* News Grid */}
        <div className={styles.newsGrid}>

          {/* Featured — slides in from left */}
          {featured && (
            <ScrollReveal direction="left" className={styles.featuredReveal}>
              <article className={`${styles.featuredCard} card`} id={`news-featured-${featured.id}`}>
                <div className={styles.featuredImageWrapper}>
                  <Image 
                    src={featured.imagen} 
                    alt={featured.title} 
                    fill
                    className={styles.featuredImage}
                    sizes="(max-width: 768px) 100vw, 50vw"
                    quality={80}
                  />                </div>
                <div className={styles.featuredContent}>
                  <div className={styles.cardMeta}>
                    <span className="badge badge-red">{featured.category}</span>
                    <span className={styles.cardDate}>{featured.date}</span>
                    <span className={styles.readTime}>⏱ {featured.readTime} lectura</span>
                  </div>
                  <h3 className={styles.featuredTitle}>{featured.title}</h3>
                  <p className={styles.featuredExcerpt}>{featured.excerpt}</p>
                  <Link href={`/noticias/${featured.id}`} className={`btn btn-primary ${styles.readMoreBtn}`} id={`read-more-${featured.id}`}>
                    Leer nota completa
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                      <path d="M5 12h14M12 5l7 7-7 7"/>
                    </svg>
                  </Link>
                </div>
              </article>
            </ScrollReveal>
          )}

          {/* Secondary news — staggered from right */}
          {news.length > 0 && (
            <ScrollReveal direction="right" wrapChildren stagger={0.1} className={styles.newsList}>
              {news.map((item) => (
                <article
                  key={item.id}
                className={`${styles.newsCard} card`}
                id={`news-card-${item.id}`}
              >
                <div className={styles.newsEmoji}>{item.emoji}</div>
                <div className={styles.newsCardContent}>
                  <div className={styles.cardMeta}>
                    <span className="badge badge-gray">{item.category}</span>
                    <span className={styles.cardDate}>{item.date}</span>
                  </div>
                  <h4 className={styles.newsCardTitle}>{item.title}</h4>
                  <p className={styles.newsCardExcerpt}>{item.excerpt}</p>
                  <Link href={`/noticias/${item.id}`} className={styles.readLink} id={`news-link-${item.id}`}>
                    Leer más
                    <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                      <path d="M5 12h14M12 5l7 7-7 7"/>
                    </svg>
                  </Link>
                </div>
              </article>
              ))}
            </ScrollReveal>
          )}

        </div>

        {/* Sección de Videos (Nueva) */}
        {videos.length > 0 && (
          <div className={styles.videoSection}>
            <ScrollReveal direction="up" className={`section-header ${styles.videoHeader}`}>
              <div>
                <span className="section-label">Multimedia</span>
                <h3 className="section-title" style={{ textAlign: 'left', fontSize: '2rem' }}>Videos Destacados</h3>
                <div className="divider divider-left" />
              </div>
            </ScrollReveal>
            
            <ScrollReveal direction="up" wrapChildren stagger={0.2} className={styles.videoGrid}>
              {videos.slice(0, 3).map(v => {
                const isShort = v.video_youtube_url?.includes('shorts');
                return (
                  <div key={v.id} className={`${styles.videoCard} ${isShort ? styles.videoShort : ''}`}>
                    <iframe 
                      src={v.video_youtube_url.replace('watch?v=', 'embed/').replace('youtu.be/', 'www.youtube.com/embed/').replace('/shorts/', '/embed/')}
                      title="YouTube video player" 
                      frameBorder="0" 
                      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                      allowFullScreen
                      loading="lazy"
                      className={styles.videoIframe}
                    ></iframe>
                    <div className={styles.videoMeta}>
                      <h4>{v.titulo}</h4>
                    </div>
                  </div>
                );
              })}
            </ScrollReveal>
          </div>
        )}

      </div>
    </section>
  );
}

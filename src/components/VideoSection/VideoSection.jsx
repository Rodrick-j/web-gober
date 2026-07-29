import React from 'react';
import ScrollReveal from '@/components/ScrollReveal/ScrollReveal';
import styles from './VideoSection.module.css';

export default function VideoSection({ urls = [] }) {
  // Extraer los IDs de los videos
  const videoIds = urls.map(url => {
    let videoId = null;
    const regex = /(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/i;
    const match = url.match(regex);
    if (match && match[1]) {
      videoId = match[1];
    }
    return videoId;
  }).filter(id => id !== null);

  if (videoIds.length === 0) return null;

  return (
    <section className={`section ${styles.videoSection}`} id="video-destacado">
      <div className="container">
        <ScrollReveal direction="up" className="section-header">
          <span className="section-label">Gobernación en Acción</span>
          <h2 className="section-title">{videoIds.length > 1 ? 'Videos Destacados' : 'Video Destacado'}</h2>
          <div className="divider" />
          <p className="section-subtitle">
            Conoce más sobre las últimas obras, proyectos y gestión del Gobierno Autónomo Departamental de Oruro.
          </p>
        </ScrollReveal>
        
        <ScrollReveal direction="up" delay={0.2}>
          <div className={styles.videosGrid} style={{ gridTemplateColumns: videoIds.length === 1 ? 'minmax(300px, 900px)' : 'repeat(auto-fit, minmax(300px, 1fr))', justifyContent: 'center' }}>
            {videoIds.map((id, index) => (
              <div key={index} className={styles.videoContainerWrapper}>
                <div className={styles.videoContainer}>
                  <iframe
                    src={`https://www.youtube.com/embed/${id}?autoplay=0&rel=0`}
                    title="Video de la Gobernación"
                    frameBorder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    allowFullScreen
                  ></iframe>
                </div>
              </div>
            ))}
          </div>
        </ScrollReveal>
      </div>
    </section>
  );
}

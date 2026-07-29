"use client";
import React, { useState } from 'react';
import ScrollReveal from '@/components/ScrollReveal/ScrollReveal';
import styles from './VideoSection.module.css';
import { Play, X } from 'lucide-react';

export default function VideoSection({ urls = [] }) {
  const [activeVideo, setActiveVideo] = useState(null);

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
          <div className={styles.videosGrid}>
            {videoIds.map((id, index) => (
              <div 
                key={index} 
                className={styles.videoContainerWrapper}
                onClick={() => setActiveVideo(id)}
              >
                <div className={styles.thumbnailContainer}>
                  <img 
                    src={`https://img.youtube.com/vi/${id}/maxresdefault.jpg`} 
                    onError={(e) => { e.target.src = `https://img.youtube.com/vi/${id}/hqdefault.jpg`; }}
                    alt="Miniatura del video" 
                    className={styles.thumbnail}
                  />
                </div>
              </div>
            ))}
          </div>
        </ScrollReveal>
      </div>

      {/* Modal / Pestaña emergente para el video */}
      {activeVideo && (
        <div className={styles.modalOverlay} onClick={() => setActiveVideo(null)}>
          <button className={styles.closeButton} onClick={() => setActiveVideo(null)}>
            <X size={40} color="white" />
          </button>
          <div className={styles.modalContent} onClick={e => e.stopPropagation()}>
            <div className={styles.videoContainer}>
              <iframe
                src={`https://www.youtube.com/embed/${activeVideo}?autoplay=1&rel=0&modestbranding=1`}
                title="Video Modal"
                frameBorder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                allowFullScreen
              ></iframe>
            </div>
          </div>
        </div>
      )}
    </section>
  );
}

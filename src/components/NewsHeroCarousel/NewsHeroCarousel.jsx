'use client';

import { useEffect, useState } from 'react';
import Image from 'next/image';
import styles from './NewsHeroCarousel.module.css';

export default function NewsHeroCarousel({ images, title }) {
  const [activeIndex, setActiveIndex] = useState(0);
  const [isPaused, setIsPaused] = useState(false);
  const hasMultipleImages = images.length > 1;

  useEffect(() => {
    if (!hasMultipleImages || isPaused) return undefined;
    if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return undefined;

    const intervalId = window.setInterval(() => {
      setActiveIndex((current) => (current + 1) % images.length);
    }, 5000);

    return () => window.clearInterval(intervalId);
  }, [hasMultipleImages, images.length, isPaused]);

  const showPrevious = () => {
    setActiveIndex((current) => (current - 1 + images.length) % images.length);
  };

  const showNext = () => {
    setActiveIndex((current) => (current + 1) % images.length);
  };

  const handleKeyDown = (event) => {
    if (!hasMultipleImages) return;
    if (event.key === 'ArrowLeft') showPrevious();
    if (event.key === 'ArrowRight') showNext();
  };

  return (
    <div
      className={styles.carousel}
      role="region"
      aria-roledescription="carrusel"
      aria-label={`Galería de la noticia: ${title}`}
      tabIndex={hasMultipleImages ? 0 : undefined}
      onKeyDown={handleKeyDown}
      onMouseEnter={() => setIsPaused(true)}
      onMouseLeave={() => setIsPaused(false)}
      onFocus={() => setIsPaused(true)}
      onBlur={(event) => {
        if (!event.currentTarget.contains(event.relatedTarget)) setIsPaused(false);
      }}
    >
      <div className={styles.backgroundLayer} aria-hidden="true">
        {images.map((src, index) => (
          <div
            key={`${src}-background`}
            className={`${styles.backgroundSlide} ${index === activeIndex ? styles.activeSlide : ''}`}
          >
            <Image src={src} alt="" fill sizes="100vw" className={styles.backgroundImage} priority={index === 0} />
          </div>
        ))}
      </div>

      {images.map((src, index) => (
        <div
          key={src}
          className={`${styles.slide} ${index === activeIndex ? styles.activeSlide : ''}`}
          aria-hidden={index !== activeIndex}
        >
          <Image
            src={src}
            alt={index === activeIndex ? `${title} — imagen ${index + 1} de ${images.length}` : ''}
            fill
            sizes="100vw"
            className={styles.image}
            priority={index === 0}
            quality={90}
          />
        </div>
      ))}

      {hasMultipleImages && (
        <>
          <button type="button" className={`${styles.arrow} ${styles.previous}`} onClick={showPrevious} aria-label="Ver imagen anterior">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true"><path d="m15 18-6-6 6-6" /></svg>
          </button>
          <button type="button" className={`${styles.arrow} ${styles.next}`} onClick={showNext} aria-label="Ver imagen siguiente">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true"><path d="m9 18 6-6-6-6" /></svg>
          </button>

          <div className={styles.status}>
            <span className={styles.galleryLabel}>
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true"><rect x="3" y="3" width="18" height="18" rx="2" /><circle cx="8.5" cy="8.5" r="1.5" /><path d="m21 15-5-5L5 21" /></svg>
              Galería
            </span>
            <div className={styles.dots} aria-label="Seleccionar imagen del banner">
              {images.map((src, index) => (
                <button
                  key={`${src}-dot`}
                  type="button"
                  className={`${styles.dot} ${index === activeIndex ? styles.activeDot : ''}`}
                  onClick={() => setActiveIndex(index)}
                  aria-label={`Ver imagen ${index + 1} de ${images.length}`}
                  aria-current={index === activeIndex ? 'true' : undefined}
                />
              ))}
            </div>
            <span className={styles.counter} aria-live="polite">{activeIndex + 1} / {images.length}</span>
          </div>
        </>
      )}
    </div>
  );
}

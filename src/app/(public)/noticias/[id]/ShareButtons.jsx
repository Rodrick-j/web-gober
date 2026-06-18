'use client';
import { useEffect, useState } from 'react';
import styles from './noticia-detail.module.css';

export default function ShareButtons({ title }) {
  const [url, setUrl] = useState('');

  useEffect(() => {
    setUrl(window.location.href);
  }, []);

  if (!url) return null;

  const encodedUrl = encodeURIComponent(url);
  const encodedTitle = encodeURIComponent(title);

  return (
    <div className={styles.shareButtons}>
      <a 
        href={`https://www.facebook.com/sharer/sharer.php?u=${encodedUrl}`}
        target="_blank" 
        rel="noopener noreferrer"
        className={styles.shareBtn}
        aria-label="Compartir en Facebook"
      >
        <svg stroke="currentColor" fill="currentColor" strokeWidth="0" viewBox="0 0 320 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.08 44.38-121.08 124.72v70.62H22.89V288h81.39v224h100.17V288z"></path></svg>
      </a>
      
      <a 
        href={`https://twitter.com/intent/tweet?url=${encodedUrl}&text=${encodedTitle}`}
        target="_blank" 
        rel="noopener noreferrer"
        className={styles.shareBtn}
        aria-label="Compartir en Twitter/X"
      >
        <svg stroke="currentColor" fill="currentColor" strokeWidth="0" viewBox="0 0 512 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M389.2 48h70.6L305.6 224.2 487 464H345L233.7 318.6 106.5 464H35.8L200.7 275.5 26.8 48H172.4L272.9 180.9 389.2 48zM364.4 421.8h39.1L151.1 88h-42L364.4 421.8z"></path></svg>
      </a>

      <a 
        href={`https://api.whatsapp.com/send?text=${encodedTitle} - ${encodedUrl}`}
        target="_blank" 
        rel="noopener noreferrer"
        className={styles.shareBtn}
        aria-label="Compartir en WhatsApp"
      >
        <svg stroke="currentColor" fill="currentColor" strokeWidth="0" viewBox="0 0 448 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zM223.9 414.8c-32 0-63.1-8.3-90.6-24.2l-6.4-3.8-67.1 17.6 17.9-65.5-4.2-6.7c-17.6-28-26.9-60-26.9-92.4 0-104.9 85.3-190.2 190.3-190.2 50.8 0 98.6 19.8 134.6 55.8 36 36 55.8 83.8 55.8 134.6 0 104.9-85.4 190.2-190.4 190.2zM327.5 301.1c-5.7-2.8-33.8-16.7-39.1-18.6-5.3-1.9-9.1-2.8-12.8 2.8-3.8 5.6-14.7 18.6-18 22.4-3.3 3.7-6.6 4.2-12.3 1.4-5.7-2.8-24.2-8.9-46.1-28.5-17.1-15.3-28.6-34.3-32-40-3.3-5.6-.4-8.7 2.4-11.5 2.5-2.5 5.7-6.6 8.5-9.9 2.8-3.3 3.8-5.6 5.6-9.4 1.9-3.7.9-7-1.4-9.8-2.8-2.8-12.8-30.9-17.5-42.3-4.6-11.1-9.3-9.6-12.8-9.8-3.3-.2-7.1-.2-10.9-.2-3.8 0-10 1.4-15.2 7-5.2 5.6-19.9 19.5-19.9 47.5 0 28 20.4 55.1 23.3 58.8 2.8 3.8 40.1 61.2 97.1 84.4 13.6 5.5 24.2 8.8 32.5 11.3 13.7 4.3 26.2 3.7 36 2.3 11-1.6 33.8-13.8 38.6-27.1 4.7-13.3 4.7-24.7 3.3-27.1-1.4-2.4-5.2-3.8-10.9-6.6z"></path></svg>
      </a>
    </div>
  );
}

'use client';

import React, { useEffect, useState } from 'react';
import Image from 'next/image';
import styles from './CenefaCultural.module.css';

export default function CenefaCultural() {
  const [items, setItems] = useState([]);

  const motifs = [
    '/motivos/motivo_10.png',
    '/motivos/motivo_11.png'
  ];

  useEffect(() => {
    // Generate enough items to fill the screen depending on width
    const generateItems = (width) => {
      const numItems = Math.ceil(width / 45);
      return Array.from({ length: numItems }).map((_, index) => motifs[index % motifs.length]);
    };

    setItems(generateItems(window.innerWidth));

    // Debounced resize handler
    let resizeTimer;
    const handleResize = () => {
      clearTimeout(resizeTimer);
      resizeTimer = setTimeout(() => {
        setItems(generateItems(window.innerWidth));
      }, 200);
    };

    window.addEventListener('resize', handleResize);
    return () => {
      window.removeEventListener('resize', handleResize);
      clearTimeout(resizeTimer);
    };
  }, []);

  if (items.length === 0) return <div className={styles.cenefaContainer}></div>;

  return (
    <div className={styles.cenefaContainer}>
      {items.map((src, index) => (
        <div key={index} className={styles.motifItem}>
          <Image
            src={src}
            alt={`Motivo Cultural ${index}`}
            fill
            sizes="30px"
            style={{ objectFit: 'contain' }}
          />
        </div>
      ))}
    </div>
  );
}

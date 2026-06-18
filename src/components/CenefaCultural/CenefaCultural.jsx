'use client';

import React, { useEffect, useState } from 'react';
import Image from 'next/image';
import styles from './CenefaCultural.module.css';

export default function CenefaCultural() {
  const [items, setItems] = useState([]);
  
  const motifs = [
    '/motivos/motivo_10.png',
    '/motivos/motivo_11.png',
    '/motivos/motivo_14.png',
    '/motivos/motivo_16.png'
  ];

  useEffect(() => {
    // Generate enough items to fill the screen depending on width
    const screenWidth = window.innerWidth;
    // Assume each motif takes about 80px of space
    const numItems = Math.ceil(screenWidth / 60);
    const generatedItems = Array.from({ length: numItems }).map((_, index) => {
      // Rotate through the 4 motifs
      return motifs[index % motifs.length];
    });
    setItems(generatedItems);
    
    // Handle resize
    const handleResize = () => {
      const newNumItems = Math.ceil(window.innerWidth / 60);
      const newItems = Array.from({ length: newNumItems }).map((_, index) => motifs[index % motifs.length]);
      setItems(newItems);
    };
    
    window.addEventListener('resize', handleResize);
    return () => window.removeEventListener('resize', handleResize);
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
            sizes="60px"
            style={{ objectFit: 'contain' }}
          />
        </div>
      ))}
    </div>
  );
}

'use client';

import React, { useEffect, useState } from 'react';
import { motion } from 'framer-motion';

const Chakana = ({ color, opacity }) => (
  <svg viewBox="0 0 100 100" style={{ width: '100%', height: '100%', opacity, color }} fill="currentColor">
    <rect x="40" y="0" width="20" height="100" />
    <rect x="0" y="40" width="100" height="20" />
    <rect x="25" y="15" width="50" height="70" />
    <rect x="15" y="25" width="70" height="50" />
    <circle cx="50" cy="50" r="8" fill="#F3F4F6" />
  </svg>
);

export default function AnimatedBackground() {
  const [elements, setElements] = useState([]);

  useEffect(() => {
    // Generar elementos aleatorios solo en el cliente para evitar mismatch de hidratación
    const newElements = Array.from({ length: 20 }).map((_, i) => ({
      id: i,
      size: Math.random() * 150 + 50,
      x: Math.random() * 100,
      y: Math.random() * 100,
      duration: Math.random() * 30 + 20,
      delay: Math.random() * -30,
      rotation: Math.random() * 360,
      color: Math.random() > 0.5 ? '#9C0720' : '#d32f2f', // Tonos de rojo institucional
      opacity: Math.random() * 0.05 + 0.02, // Muy sutil para no molestar la lectura
    }));
    setElements(newElements);
  }, []);

  return (
    <div
      style={{
        position: 'fixed',
        top: 0,
        left: 0,
        width: '100vw',
        height: '100vh',
        zIndex: -1,
        pointerEvents: 'none',
        backgroundColor: '#F3F4F6', // Gris muy claro de fondo
        overflow: 'hidden',
      }}
    >
      {/* Trama tejida muy suave de fondo (estilo aguayo) */}
      <div 
        style={{
          position: 'absolute',
          top: 0, left: 0, width: '100%', height: '100%',
          backgroundImage: 'linear-gradient(45deg, rgba(156,7,32,0.02) 25%, transparent 25%, transparent 75%, rgba(156,7,32,0.02) 75%, rgba(156,7,32,0.02)), linear-gradient(45deg, rgba(156,7,32,0.02) 25%, transparent 25%, transparent 75%, rgba(156,7,32,0.02) 75%, rgba(156,7,32,0.02))',
          backgroundSize: '40px 40px',
          backgroundPosition: '0 0, 20px 20px',
          opacity: 0.5,
          animation: 'scrollWeave 60s linear infinite'
        }}
      />
      
      {/* Chakanas animadas flotando */}
      {elements.map((el) => (
        <motion.div
          key={el.id}
          initial={{ 
            x: `${el.x}vw`, 
            y: `${el.y}vh`, 
            rotate: el.rotation,
            scale: 0.8
          }}
          animate={{
            x: [`${el.x}vw`, `${el.x + (Math.random() * 20 - 10)}vw`, `${el.x}vw`],
            y: [`${el.y}vh`, `${el.y + (Math.random() * 20 - 10)}vh`, `${el.y}vh`],
            rotate: [el.rotation, el.rotation + 180, el.rotation + 360],
            scale: [0.8, 1.2, 0.8]
          }}
          transition={{
            duration: el.duration,
            delay: el.delay,
            repeat: Infinity,
            ease: "linear"
          }}
          style={{
            position: 'absolute',
            width: el.size,
            height: el.size,
          }}
        >
          <Chakana color={el.color} opacity={el.opacity} />
        </motion.div>
      ))}

      <style>{`
        @keyframes scrollWeave {
          0% { background-position: 0 0, 20px 20px; }
          100% { background-position: 400px 400px, 420px 420px; }
        }
      `}</style>
    </div>
  );
}

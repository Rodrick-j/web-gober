'use client';

import React, { useEffect, useState } from 'react';

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
    // Reduce to 10 elements (was 20) for better performance
    const newElements = Array.from({ length: 10 }).map((_, i) => ({
      id: i,
      size: Math.random() * 120 + 40,
      x: Math.random() * 100,
      y: Math.random() * 100,
      duration: Math.random() * 40 + 30,
      delay: Math.random() * -40,
      color: Math.random() > 0.5 ? '#9C0720' : '#d32f2f',
      opacity: Math.random() * 0.04 + 0.02,
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
      {/* Trama tejida muy suave de fondo */}
      <div 
        style={{
          position: 'absolute',
          top: 0, left: 0, width: '100%', height: '100%',
          backgroundImage: 'linear-gradient(45deg, rgba(156,7,32,0.02) 25%, transparent 25%, transparent 75%, rgba(156,7,32,0.02) 75%), linear-gradient(45deg, rgba(156,7,32,0.02) 25%, transparent 25%, transparent 75%, rgba(156,7,32,0.02) 75%)',
          backgroundSize: '40px 40px',
          backgroundPosition: '0 0, 20px 20px',
          opacity: 0.5,
          animation: 'scrollWeave 80s linear infinite'
        }}
      />
      
      {/* Chakanas animadas flotando — usando CSS para mejor rendimiento GPU */}
      {elements.map((el) => (
        <div
          key={el.id}
          style={{
            position: 'absolute',
            width: el.size,
            height: el.size,
            left: `${el.x}vw`,
            top: `${el.y}vh`,
            willChange: 'transform',
            animation: `floatChakana ${el.duration}s ${el.delay}s linear infinite`,
          }}
        >
          <Chakana color={el.color} opacity={el.opacity} />
        </div>
      ))}

      <style>{`
        @keyframes scrollWeave {
          0% { background-position: 0 0, 20px 20px; }
          100% { background-position: 400px 400px, 420px 420px; }
        }
        @keyframes floatChakana {
          0%   { transform: translateY(0px) rotate(0deg) scale(0.8); }
          33%  { transform: translateY(-15px) rotate(120deg) scale(1.1); }
          66%  { transform: translateY(10px) rotate(240deg) scale(0.9); }
          100% { transform: translateY(0px) rotate(360deg) scale(0.8); }
        }
      `}</style>
    </div>
  );
}

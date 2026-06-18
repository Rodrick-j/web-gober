import React from 'react';
import InteractiveMap from '@/components/InteractiveMap/InteractiveMap';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';

export const metadata = {
  title: 'Historia de Oruro | GADOR',
  description: 'Conoce la historia del departamento de Oruro y sus municipios interactuando con nuestro mapa.',
};

export default function HistoriaPage() {
  return (
    <main style={{ position: 'relative', minHeight: '100vh', padding: '6rem 1rem 4rem', zIndex: 1 }}>
      <AnimatedBackground />
      
      <div style={{ maxWidth: '1200px', margin: '0 auto', textAlign: 'center', marginBottom: '3rem' }}>
        <h1 style={{ fontSize: '3.5rem', color: '#9C0720', fontWeight: '900', marginBottom: '1rem', textShadow: '0 2px 4px rgba(0,0,0,0.1)' }}>
          Historia y Geografía de Oruro
        </h1>
        <p style={{ fontSize: '1.2rem', color: '#424242', maxWidth: '800px', margin: '0 auto', lineHeight: '1.6' }}>
          Descubre el rico patrimonio histórico de nuestro departamento. 
          Interactúa con el mapa rompecabezas a continuación para conocer los datos y la historia de los principales municipios de Oruro.
        </p>
      </div>

      <InteractiveMap />
      
    </main>
  );
}

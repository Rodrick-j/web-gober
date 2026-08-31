'use client';

import React, { useState } from 'react';
import HistorySection from '@/components/HistorySection/HistorySection';
import MisionVisionSection from '@/components/MisionVisionSection/MisionVisionSection';
import { motion, AnimatePresence } from 'framer-motion';

export default function HistoriaTabs() {
  const [activeTab, setActiveTab] = useState('historia');

  return (
    <div style={{ paddingBottom: '4rem' }}>
      {/* Tab Buttons */}
      <div style={{ 
        display: 'flex', 
        justifyContent: 'center', 
        gap: '1rem', 
        padding: '2rem 1rem',
        background: '#fff',
        borderBottom: '1px solid #eaeaea',
        position: 'sticky',
        top: '80px',
        zIndex: 10
      }}>
        <button 
          onClick={() => setActiveTab('historia')}
          style={{
            padding: '0.75rem 2rem',
            fontSize: '1.1rem',
            fontWeight: '600',
            borderRadius: '50px',
            border: 'none',
            cursor: 'pointer',
            transition: 'all 0.3s ease',
            background: activeTab === 'historia' ? '#8B0000' : '#f0f0f0',
            color: activeTab === 'historia' ? '#fff' : '#333',
            boxShadow: activeTab === 'historia' ? '0 4px 10px rgba(139, 0, 0, 0.3)' : 'none'
          }}
        >
          📜 Historia de la Institución
        </button>
        
        <button 
          onClick={() => setActiveTab('mision_vision')}
          style={{
            padding: '0.75rem 2rem',
            fontSize: '1.1rem',
            fontWeight: '600',
            borderRadius: '50px',
            border: 'none',
            cursor: 'pointer',
            transition: 'all 0.3s ease',
            background: activeTab === 'mision_vision' ? '#8B0000' : '#f0f0f0',
            color: activeTab === 'mision_vision' ? '#fff' : '#333',
            boxShadow: activeTab === 'mision_vision' ? '0 4px 10px rgba(139, 0, 0, 0.3)' : 'none'
          }}
        >
          🎯 Misión y Visión
        </button>
      </div>

      {/* Tab Content */}
      <div style={{ minHeight: '60vh' }}>
        <AnimatePresence mode="wait">
          {activeTab === 'historia' && (
            <motion.div
              key="historia"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              transition={{ duration: 0.3 }}
            >
              <div style={{ paddingTop: '0' }}>
                <HistorySection />
              </div>
            </motion.div>
          )}

          {activeTab === 'mision_vision' && (
            <motion.div
              key="mision_vision"
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -20 }}
              transition={{ duration: 0.3 }}
            >
              <div style={{ maxWidth: '1200px', margin: '0 auto', padding: '4rem 2rem' }}>
                <h2 style={{ textAlign: 'center', fontSize: '2.5rem', fontWeight: '800', color: '#1a1a1a', marginBottom: '3rem' }}>
                  Nuestra Misión y Visión
                </h2>
                <MisionVisionSection 
                  mision="Promover, estimular y coordinar la construcción colectiva del desarrollo productivo, humano, social, económico, territorial, y la protección de los principios derechos y deberes para mejorar el bienestar y calidad de vida de la población, suministrando a los sectores, mediante la ejecución de proyectos y programas de una manera oportuna, eficiente, equitativa y con calidad según competencias que determine la ley con el uso eficiente y transparente de los recursos públicos en alianza con la iniciativa privada, facilitando nuevos procesos productivos."
                  vision="Gobierno Autónomo Departamental de Oruro, una entidad pública autónoma con identidad propia, que planifica, inicia, ejecuta políticas, planes, programas y proyectos promoviendo la construcción colectiva del desarrollo productivo, económico, social, comunitario y territorial del departamento de Oruro articulando el desarrollo con alianzas estratégicas institucionales."
                />
              </div>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </div>
  );
}

'use client';

import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Swiper, SwiperSlide } from 'swiper/react';
import { Pagination, Autoplay } from 'swiper/modules';
import Link from 'next/link';

import 'swiper/css';
import 'swiper/css/pagination';
import './SecretariatsSection.css';

export default function SecretariatsSection({ secretarias = [] }) {
  // Use DB data if available, fallback to empty state
  const displaySecretariats = secretarias.length > 0 ? secretarias : [];
  const [selectedSec, setSelectedSec] = useState(null);

  const getSecretariaImage = (slug, banner_url) => {
    if (banner_url) return banner_url;
    if (!slug) return null;
    if (slug.includes('general')) return '/images/secretarias/sec_general.png';
    if (slug.includes('productiv')) return '/images/secretarias/desarrollo_productivo.png';
    if (slug.includes('cultur')) return '/images/secretarias/cultura_turismo.png';
    if (slug.includes('obras')) return '/images/secretarias/obras_publicas.png';
    if (slug.includes('miner')) return '/images/secretarias/mineria.png';
    return null;
  };

  return (
    <section className="secretariats-section">
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true, margin: "-100px" }}
        transition={{ duration: 0.6 }}
        className="container"
      >
        <motion.div 
          className="secretariats-header-text"
          initial={{ opacity: 0, scale: 0.9, y: -20 }}
          whileInView={{ opacity: 1, scale: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8, type: "spring" }}
        >
          <div className="secretariats-subtitle">Autoridades</div>
          <h2 className="secretariats-title">Secretarías Departamentales</h2>
          <p className="secretariats-desc">Conoce a los Secretarios del Gobierno Autónomo Departamental de Oruro</p>
        </motion.div>

        <Swiper
          modules={[Pagination, Autoplay]}
          spaceBetween={20}
          slidesPerView={1}
          pagination={{ clickable: true }}
          autoplay={{ delay: 4000, disableOnInteraction: false }}
          breakpoints={{
            576: { slidesPerView: 2 },
            768: { slidesPerView: 3 },
            1024: { slidesPerView: 4 },
            1280: { slidesPerView: 5 },
          }}
          className="secretariats-swiper"
        >
          {displaySecretariats.map((sec, index) => (
            <SwiperSlide key={sec.id}>
              <motion.div 
                className="secretariat-card"
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true }}
                transition={{ duration: 0.5, delay: index * 0.1 }}
                style={{ '--sec-color': sec.color_acento || '#C1272D' }}
                onClick={() => setSelectedSec(sec)}
              >
                {/* Image Placeholder / Icon Box */}
                <div className="secretariat-image-placeholder" style={{ background: `linear-gradient(135deg, ${sec.color_acento || '#C1272D'}, ${sec.color_acento || '#C1272D'}dd)` }}>
                  {getSecretariaImage(sec.slug, sec.banner_url) ? (
                    <img src={getSecretariaImage(sec.slug, sec.banner_url)} alt={sec.nombre_corto || sec.nombre} className="secretariat-image" />
                  ) : (
                    <span className="secretariat-image-icon" style={{ fontSize: '3rem', color: 'white' }}>
                      {sec.icono || '🏛️'}
                    </span>
                  )}
                </div>
                
                <div className="secretariat-info">
                  <h3 className="secretariat-name" style={{ fontSize: '1.1rem' }}>{sec.nombre_corto || sec.nombre}</h3>
                  {sec.secretario_nombre ? (
                    <p className="secretariat-role">{sec.secretario_nombre}</p>
                  ) : (
                    <p className="secretariat-role pending-shimmer">Designación Pendiente</p>
                  )}
                  <p style={{ fontSize: '0.75rem', color: 'var(--color-text-muted)', marginTop: '0.2rem' }}>
                    {sec.secretario_cargo || 'Autoridad Departamental'}
                  </p>
                </div>
              </motion.div>
            </SwiperSlide>
          ))}
        </Swiper>
      </motion.div>

      {/* Modal Épico para la Biografía */}
      <AnimatePresence>
        {selectedSec && (
          <motion.div 
            className="sec-modal-overlay"
            initial={{ opacity: 0, backdropFilter: 'blur(0px)' }}
            animate={{ opacity: 1, backdropFilter: 'blur(12px)' }}
            exit={{ opacity: 0, backdropFilter: 'blur(0px)' }}
            onClick={() => setSelectedSec(null)}
          >
            <motion.div 
              className="sec-modal-content"
              initial={{ scale: 0.8, opacity: 0, y: 100, rotateX: 20 }}
              animate={{ scale: 1, opacity: 1, y: 0, rotateX: 0 }}
              exit={{ scale: 0.8, opacity: 0, y: 100, rotateX: -20 }}
              transition={{ type: "spring", damping: 25, stiffness: 300 }}
              onClick={(e) => e.stopPropagation()}
              style={{ '--theme-color': selectedSec.color_acento || '#a3161c' }}
            >
              <button className="sec-modal-close" onClick={() => setSelectedSec(null)}>
                ✕
              </button>
              
              <div className="sec-modal-layout">
                {/* Lado Izquierdo: Foto */}
                <div className="sec-modal-left" style={{ background: `linear-gradient(135deg, var(--theme-color) 0%, #111 100%)` }}>
                  <div className="sec-modal-photo-wrapper">
                    {selectedSec.secretario_foto_url ? (
                      <img src={selectedSec.secretario_foto_url} alt={selectedSec.secretario_nombre} className="sec-modal-photo" />
                    ) : (
                      <div className="sec-modal-photo-placeholder">
                        <span className="sec-modal-icon">{selectedSec.icono || '👤'}</span>
                      </div>
                    )}
                  </div>
                </div>
                
                {/* Lado Derecho: Contenido */}
                <div className="sec-modal-right">
                  <div className="sec-modal-badge">{selectedSec.nombre_corto || selectedSec.nombre}</div>
                  {selectedSec.secretario_nombre ? (
                    <h3 className="sec-modal-name">{selectedSec.secretario_nombre}</h3>
                  ) : (
                    <h3 className="sec-modal-name pending-shimmer">Designación Pendiente</h3>
                  )}
                  <p className="sec-modal-role">{selectedSec.secretario_cargo || 'Autoridad Departamental'}</p>
                  
                  <div className="sec-modal-bio">
                    {selectedSec.secretario_bio ? (
                      selectedSec.secretario_bio.split('\n').map((paragraph, idx) => (
                        <p key={idx}>{paragraph}</p>
                      ))
                    ) : (
                      <p className="sec-modal-empty-bio">Biografía no disponible por el momento.</p>
                    )}
                  </div>
                  
                  <div className="sec-modal-actions">
                    <Link href={`/secretarias/${selectedSec.slug}`} className="sec-modal-btn">
                      Visitar Portal de la Secretaría →
                    </Link>
                  </div>
                </div>
              </div>
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>
    </section>
  );
}

'use client';

import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Swiper, SwiperSlide } from 'swiper/react';
import { Pagination, Autoplay, Navigation } from 'swiper/modules';
import Link from 'next/link';

import 'swiper/css';
import 'swiper/css/pagination';
import 'swiper/css/navigation';
import './SecretariatsSection.css';

export default function SecretariatsSection({ secretarias = [] }) {
  // Use DB data if available
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
    if (slug.includes('medio-ambiente')) return '/images/secretarias/medio_ambiente.png';
    if (slug.includes('desarrollo-social')) return '/images/secretarias/desarrollo_social.png';
    if (slug.includes('planificacion')) return '/images/secretarias/planificacion.jpg';
    if (slug.includes('juridicos')) return '/images/secretarias/asuntos_juridicos.jpg';
    if (slug.includes('finanzas')) return '/images/secretarias/admin_finanzas.jpg';
    return null;
  };

  return (
    <section className="secretariats-section">
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true, margin: "-100px" }}
        transition={{ duration: 0.6 }}
        className="container secretariats-container"
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

        <div className="swiper-outer-wrapper">
          <Swiper
            modules={[Pagination, Autoplay, Navigation]}
            spaceBetween={24}
            slidesPerView={1}
            pagination={{ 
              clickable: true,
              bulletClass: 'swiper-pagination-bullet sec-bullet',
              bulletActiveClass: 'swiper-pagination-bullet-active sec-bullet-active'
            }}
            autoplay={{ delay: 5000, disableOnInteraction: false }}
            navigation={{
              prevEl: '.sec-nav-prev',
              nextEl: '.sec-nav-next',
            }}
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
                  initial={{ opacity: 0, y: 25 }}
                  whileInView={{ opacity: 1, y: 0 }}
                  viewport={{ once: true }}
                  transition={{ duration: 0.5, delay: index * 0.08 }}
                  style={{ '--sec-color': sec.color_acento || '#C1272D' }}
                  onClick={() => setSelectedSec(sec)}
                >
                  {/* Background Image Container */}
                  <div className="secretariat-card-bg">
                    {getSecretariaImage(sec.slug, sec.banner_url) ? (
                      <img loading="lazy" src={getSecretariaImage(sec.slug, sec.banner_url)} alt={sec.nombre_corto || sec.nombre} className="secretariat-image" />
                    ) : (
                      <div className="secretariat-card-fallback-bg" style={{ background: `linear-gradient(135deg, ${sec.color_acento || '#C1272D'} 0%, #1a1a2e 100%)` }}>
                        <span className="fallback-icon">{sec.icono || '🏛️'}</span>
                      </div>
                    )}
                  </div>
                  
                  {/* Gradient Card Vignette */}
                  <div className="secretariat-card-vignette" />

                  {/* Dark Glassmorphic info overlay card at the bottom */}
                  <div className="secretariat-info-overlay">
                    <div className="overlay-header">
                      <span className="overlay-tag" style={{ color: sec.color_acento || '#ffb843' }}>Secretaría</span>
                      {sec.secretario_nombre && <div className="active-dot" style={{ backgroundColor: sec.color_acento || '#C1272D' }}></div>}
                    </div>
                    
                    <h3 className="secretariat-name">{sec.nombre_corto || sec.nombre}</h3>
                    
                    {sec.secretario_nombre ? (
                      <div className="secretary-details">
                        <p className="secretariat-role">{sec.secretario_nombre}</p>
                        <p className="secretariat-subrole">{sec.secretario_cargo || 'Secretario/a Departamental'}</p>
                      </div>
                    ) : (
                      <div className="pending-badge">
                        <span className="pending-dot"></span>
                        <span className="pending-text">Designación Pendiente</span>
                      </div>
                    )}
                    
                    <div className="card-hover-action">
                      <span>Ver Perfil de Autoridad</span>
                      <svg className="action-arrow" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
                        <path d="M5 12h14M12 5l7 7-7 7"/>
                      </svg>
                    </div>
                  </div>
                </motion.div>
              </SwiperSlide>
            ))}
          </Swiper>

          {/* Navigation Controls */}
          <button className="sec-nav-btn sec-nav-prev" aria-label="Anterior">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
              <path d="M15 18l-6-6 6-6"/>
            </svg>
          </button>
          <button className="sec-nav-btn sec-nav-next" aria-label="Siguiente">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5">
              <path d="M9 18l6-6-6-6"/>
            </svg>
          </button>
        </div>
      </motion.div>

      {/* Modal Épico para la Biografía */}
      <AnimatePresence>
        {selectedSec && (
          <motion.div 
            className="sec-modal-overlay"
            initial={{ opacity: 0, backdropFilter: 'blur(0px)' }}
            animate={{ opacity: 1, backdropFilter: 'blur(16px)' }}
            exit={{ opacity: 0, backdropFilter: 'blur(0px)' }}
            onClick={() => setSelectedSec(null)}
          >
            <motion.div 
              className="sec-modal-content"
              initial={{ scale: 0.9, opacity: 0, y: 50 }}
              animate={{ scale: 1, opacity: 1, y: 0 }}
              exit={{ scale: 0.9, opacity: 0, y: 50 }}
              transition={{ type: "spring", damping: 26, stiffness: 280 }}
              onClick={(e) => e.stopPropagation()}
              style={{ '--theme-color': selectedSec.color_acento || '#a3161c' }}
            >
              <button className="sec-modal-close" onClick={() => setSelectedSec(null)} aria-label="Cerrar modal">
                ✕
              </button>
              
              <div className="sec-modal-layout">
                {/* Lado Izquierdo: Foto */}
                <div className="sec-modal-left" style={{ background: `linear-gradient(135deg, var(--theme-color) 0%, #0d0d11 100%)` }}>
                  <div className="sec-modal-photo-wrapper">
                    {selectedSec.secretario_foto_url ? (
                      <img loading="lazy" src={selectedSec.secretario_foto_url} alt={selectedSec.secretario_nombre} className="sec-modal-photo" />
                    ) : (
                      <div className="sec-modal-photo-placeholder">
                        <span className="sec-modal-icon">{selectedSec.icono || '🏛️'}</span>
                      </div>
                    )}
                  </div>
                  <div className="sec-modal-left-overlay" />
                </div>
                
                {/* Lado Derecho: Contenido */}
                <div className="sec-modal-right">
                  <div className="sec-modal-badge" style={{ borderColor: selectedSec.color_acento }}>
                    {selectedSec.nombre_corto || selectedSec.nombre}
                  </div>
                  
                  {selectedSec.secretario_nombre ? (
                    <>
                      <h3 className="sec-modal-name">{selectedSec.secretario_nombre}</h3>
                      <p className="sec-modal-role">{selectedSec.secretario_cargo || 'Secretario/a Departamental'}</p>
                    </>
                  ) : (
                    <div className="sec-modal-pending">
                      <span className="pulse-dot"></span>
                      <h3 className="sec-modal-name-pending">Designación Pendiente</h3>
                    </div>
                  )}
                  
                  <div className="sec-modal-bio">
                    {selectedSec.secretario_bio ? (
                      selectedSec.secretario_bio.split('\n').map((paragraph, idx) => (
                        <p key={idx}>{paragraph}</p>
                      ))
                    ) : (
                      <p className="sec-modal-empty-bio">Biografía e información de gestión oficial no cargada aún.</p>
                    )}
                  </div>
                  
                  <div className="sec-modal-actions">
                    <Link href={`/secretarias/${selectedSec.slug}`} className="sec-modal-btn">
                      <span>Visitar Portal de la Secretaría</span>
                      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" width="16" height="16">
                        <path d="M5 12h14M12 5l7 7-7 7"/>
                      </svg>
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

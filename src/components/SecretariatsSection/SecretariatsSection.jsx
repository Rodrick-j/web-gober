'use client';

import React from 'react';
import { motion } from 'framer-motion';
import { Swiper, SwiperSlide } from 'swiper/react';
import { Pagination, Autoplay } from 'swiper/modules';

import 'swiper/css';
import 'swiper/css/pagination';
import './SecretariatsSection.css';

export default function SecretariatsSection({ secretarias = [] }) {
  // Use DB data if available, fallback to empty state
  const displaySecretariats = secretarias.length > 0 ? secretarias : [];
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
              >
                {/* Image Placeholder / Icon Box */}
                <div className="secretariat-image-placeholder" style={{ background: `linear-gradient(135deg, ${sec.color_acento || '#C1272D'}, ${sec.color_acento || '#C1272D'}dd)` }}>
                  <span className="secretariat-image-icon" style={{ fontSize: '3rem', color: 'white' }}>
                    {sec.icono || '🏛️'}
                  </span>
                </div>
                
                <div className="secretariat-info">
                  <h3 className="secretariat-name" style={{ fontSize: '1.1rem' }}>{sec.nombre_corto || sec.nombre}</h3>
                  <p className="secretariat-role">{sec.secretario_nombre || 'Sin autoridad asignada'}</p>
                  <p style={{ fontSize: '0.75rem', color: 'var(--color-text-muted)', marginTop: '0.2rem' }}>
                    {sec.secretario_cargo || 'Secretario/a Departamental'}
                  </p>
                </div>
              </motion.div>
            </SwiperSlide>
          ))}
        </Swiper>
      </motion.div>
    </section>
  );
}

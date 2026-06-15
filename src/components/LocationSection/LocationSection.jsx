'use client';

import React from 'react';
import { motion } from 'framer-motion';
import './LocationSection.css';

export default function LocationSection({ contacto }) {
  const lat = contacto?.latitud || -17.969520017575668;
  const lon = contacto?.longitud || -67.11512711053955;
  const mapUrl = `https://maps.google.com/maps?q=${lat},${lon}&hl=es&z=16&output=embed`;

  return (
    <section className="location-section">
      <motion.div
        initial={{ opacity: 0, scale: 0.95, y: 20 }}
        whileInView={{ opacity: 1, scale: 1, y: 0 }}
        viewport={{ once: true, margin: "-100px" }}
        transition={{ duration: 0.7, ease: [0.175, 0.885, 0.32, 1.275] }}
        className="contact-card"
      >
        <div className="contact-header">
          <h2 className="contact-title">Contáctanos</h2>
          <div className="contact-badge">SEDE - CIUDAD DE ORURO</div>
        </div>

        <div className="contact-content">
          {/* Column 1: Map */}
          <div className="map-container">
            <iframe
              src={mapUrl}
              allowFullScreen=""
              loading="lazy"
              referrerPolicy="no-referrer-when-downgrade"
              title="Ubicación de la Gobernación de Oruro"
            ></iframe>
          </div>

          {/* Column 2: Video and Text */}
          <div className="video-column">
            <div className="video-container">
              <video 
                src="/videos/oruro.mp4" 
                poster="/videos/oruro-poster.jpg"
                autoPlay 
                loop 
                muted 
                playsInline
                controls={false}
              />
            </div>
            <div className="video-text">
              El Edificio Central de la Gobernación de Oruro (históricamente conocido como el Palacio de Gobierno de Oruro o Prefectura) posee un gran legado arquitectónico y político estrechamente ligado a la historia de Bolivia.
            </div>
          </div>

          {/* Column 3: Contact Info */}
          <div className="info-container">
            <div className="info-item">
              <div className="info-icon">
                <svg stroke="currentColor" fill="none" strokeWidth="2" viewBox="0 0 24 24" strokeLinecap="round" strokeLinejoin="round" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
              </div>
              <div className="info-text">
                <span className="info-label">Sede Principal</span>
                <span className="info-value">Gobierno Autónomo Departamental de Oruro</span>
              </div>
            </div>

            <div className="info-item">
              <div className="info-icon">
                <svg stroke="currentColor" fill="none" strokeWidth="2" viewBox="0 0 24 24" strokeLinecap="round" strokeLinejoin="round" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
              </div>
              <div className="info-text">
                <span className="info-label">Dirección</span>
                <span className="info-value">{contacto?.direccion || 'Plaza 10 de Febrero s/n, Oruro'}</span>
              </div>
            </div>

            <div className="info-item">
              <div className="info-icon">
                <svg stroke="currentColor" fill="none" strokeWidth="2" viewBox="0 0 24 24" strokeLinecap="round" strokeLinejoin="round" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>
              </div>
              <div className="info-text">
                <span className="info-label">Teléfono</span>
                <span className="info-value">{contacto?.telefono || '(591-2) 5270-000'}</span>
              </div>
            </div>

            <div className="info-item">
              <div className="info-icon">
                <svg stroke="currentColor" fill="none" strokeWidth="2" viewBox="0 0 24 24" strokeLinecap="round" strokeLinejoin="round" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
              </div>
              <div className="info-text">
                <span className="info-label">Atención Ciudadana</span>
                <span className="info-value">{contacto?.email || 'contacto@oruro.gob.bo'}</span>
              </div>
            </div>
          </div>
        </div>
      </motion.div>
    </section>
  );
}

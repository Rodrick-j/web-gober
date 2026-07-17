'use client';

import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import './LocationSection.css';

/* ── Icono SVG reutilizable ── */
function Icon({ d, viewBox = '0 0 24 24' }) {
  return (
    <svg viewBox={viewBox} fill="none" stroke="currentColor" strokeWidth="2"
      strokeLinecap="round" strokeLinejoin="round" width="1em" height="1em">
      {Array.isArray(d)
        ? d.map((path, i) => <path key={i} d={path} />)
        : <path d={d} />}
    </svg>
  );
}

const TABS = [
  { id: 'mapa',    label: 'Mapa',     icon: 'M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z' },
  { id: 'horario', label: 'Horarios', icon: 'M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zM12 6v6l4 2' },
  { id: 'contacto',label: 'Contactar',icon: 'M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2zM22 6l-10 7L2 6' },
];

const HORARIOS = [
  { dia: 'Lunes – Viernes',  hora: '08:00 – 16:00',  activo: true },
  { dia: 'Sábados',          hora: '08:30 – 12:30',  activo: false },
  { dia: 'Domingos',         hora: 'Cerrado',         activo: false, cerrado: true },
];

export default function LocationSection({ contacto }) {
  const lat    = contacto?.latitud   || -17.969520017575668;
  const lon    = contacto?.longitud  || -67.11512711053955;
  const mapUrl = `https://maps.google.com/maps?q=${lat},${lon}&hl=es&z=17&output=embed`;
  const mapsDirectUrl = `https://www.google.com/maps/dir/?api=1&destination=${lat},${lon}`;

  const [activeTab,   setActiveTab]   = useState('mapa');
  const [formData,    setFormData]    = useState({ nombre: '', email: '', asunto: '', mensaje: '' });
  const [formStatus,  setFormStatus]  = useState('idle'); // idle | sending | sent

  const handleFormChange = (e) => setFormData(p => ({ ...p, [e.target.name]: e.target.value }));

  const handleFormSubmit = (e) => {
    e.preventDefault();
    setFormStatus('sending');
    // Simula envío — conectar con backend/email real
    setTimeout(() => setFormStatus('sent'), 1800);
  };

  // ── Día actual para resaltar horario
  const todayName = (() => {
    const d = new Date().getDay();
    if (d === 0) return 'Domingos';
    if (d === 6) return 'Sábados';
    return 'Lunes – Viernes';
  })();

  return (
    <section className="location-section">
      <motion.div
        initial={{ opacity: 0, y: 24 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true, margin: '-80px' }}
        transition={{ duration: 0.7, ease: [0.16, 1, 0.3, 1] }}
        className="contact-card"
      >
        {/* ── Header ── */}
        <div className="contact-header">
          <div>
            <h2 className="contact-title">Contáctanos</h2>
            <p className="contact-subtitle">Estamos para servirte, ciudadano</p>
          </div>
          <div className="contact-badge">SEDE – CIUDAD DE ORURO</div>
        </div>

        {/* ── Tabs ── */}
        <div className="loc-tabs">
          {TABS.map(tab => (
            <button
              key={tab.id}
              className={`loc-tab${activeTab === tab.id ? ' loc-tab--active' : ''}`}
              onClick={() => setActiveTab(tab.id)}
              id={`loc-tab-${tab.id}`}
            >
              <Icon d={tab.icon} />
              {tab.label}
            </button>
          ))}
        </div>

        {/* ── Contenido por tab ── */}
        <AnimatePresence mode="wait">
          <motion.div
            key={activeTab}
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -6 }}
            transition={{ duration: 0.3, ease: 'easeOut' }}
            className="contact-content"
          >

            {/* ════ TAB MAPA ════ */}
            {activeTab === 'mapa' && (
              <div className="tab-mapa">
                {/* Mapa grande */}
                <div className="map-container">
                  <iframe
                    src={mapUrl}
                    allowFullScreen=""
                    loading="lazy"
                    referrerPolicy="no-referrer-when-downgrade"
                    title="Ubicación Gobernación de Oruro"
                  />
                  {/* Overlay de acciones sobre el mapa */}
                  <div className="map-actions">
                    <a
                      href={mapsDirectUrl}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="map-action-btn map-action-btn--primary"
                      id="btn-como-llegar"
                    >
                      <Icon d="M3 12h18M12 5l7 7-7 7" />
                      Cómo llegar
                    </a>
                    <a
                      href={`https://www.google.com/maps/search/?api=1&query=${lat},${lon}`}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="map-action-btn"
                      id="btn-ver-maps"
                    >
                      <Icon d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0zM12 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
                      Ver en Maps
                    </a>
                  </div>
                </div>

                {/* Info lateral */}
                <div className="map-sidebar">
                  {/* Miniatura edificio */}
                  <div className="building-card">
                    <video
                      src="/videos/oruro.mp4"
                      poster="/videos/oruro-poster.jpg"
                      autoPlay loop muted playsInline
                      className="building-video"
                    />
                    <div className="building-overlay">
                      <span className="building-tag">📍 Sede Principal</span>
                    </div>
                  </div>

                  <p className="map-desc">
                    El Edificio Central de la Gobernación de Oruro — Palacio de Gobierno o Prefectura —
                    posee un gran legado arquitectónico y político ligado a la historia de Bolivia.
                  </p>

                  {/* Info items compactos */}
                  <div className="info-container">
                    {[
                      { label: 'Sede Principal',    value: 'Gobierno Autónomo Departamental de Oruro', icon: 'M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2zM9 22V12h6v10' },
                      { label: 'Dirección',         value: contacto?.direccion || 'Plaza 10 de Febrero s/n, Oruro', icon: 'M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0zM12 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2z' },
                      { label: 'Teléfono',          value: contacto?.telefono  || '(591-2) 5270-000', icon: 'M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z' },
                      { label: 'Atención Ciudadana',value: contacto?.email     || 'contacto@oruro.gob.bo', icon: 'M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2zM22 6l-10 7L2 6' },
                    ].map(item => (
                      <div key={item.label} className="info-item">
                        <div className="info-icon"><Icon d={item.icon} /></div>
                        <div className="info-text">
                          <span className="info-label">{item.label}</span>
                          <span className="info-value">{item.value}</span>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            )}

            {/* ════ TAB HORARIOS ════ */}
            {activeTab === 'horario' && (
              <div className="tab-horario">
                <div className="horario-hero">
                  <div className="horario-clock">
                    {/* Reloj SVG animado */}
                    <svg viewBox="0 0 80 80" className="clock-svg">
                      <circle cx="40" cy="40" r="36" stroke="rgba(255,255,255,0.2)" strokeWidth="2" fill="none"/>
                      <circle cx="40" cy="40" r="36" stroke="#ffb843" strokeWidth="2" fill="none"
                        strokeDasharray="226" strokeDashoffset="56" strokeLinecap="round"/>
                      <line x1="40" y1="40" x2="40" y2="16" stroke="white" strokeWidth="2.5" strokeLinecap="round"/>
                      <line x1="40" y1="40" x2="54" y2="40" stroke="rgba(255,184,67,0.9)" strokeWidth="2" strokeLinecap="round"/>
                      <circle cx="40" cy="40" r="3" fill="#ffb843"/>
                    </svg>
                    <div className="horario-now">
                      <span className="horario-now-label">Hoy</span>
                      <span className="horario-now-day">{todayName}</span>
                    </div>
                  </div>
                  <div className="horario-status">
                    {todayName === 'Domingos'
                      ? <span className="status-badge status-closed">Cerrado hoy</span>
                      : <span className="status-badge status-open">Abierto ahora</span>
                    }
                  </div>
                </div>

                <div className="horario-list">
                  {HORARIOS.map(h => (
                    <div
                      key={h.dia}
                      className={`horario-row${h.dia === todayName ? ' horario-row--today' : ''}${h.cerrado ? ' horario-row--closed' : ''}`}
                    >
                      <div className="horario-dot" />
                      <span className="horario-dia">{h.dia}</span>
                      <span className="horario-hora">{h.hora}</span>
                    </div>
                  ))}
                </div>

                <div className="horario-note">
                  <Icon d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10zM12 8v4M12 16h.01" />
                  Los horarios pueden variar en días festivos nacionales y departamentales.
                </div>

                {/* Info extra */}
                <div className="horario-extra">
                  <div className="extra-card">
                    <Icon d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z" />
                    <div>
                      <span className="extra-card-label">Línea ciudadana</span>
                      <span className="extra-card-value">{contacto?.telefono || '(591-2) 5270-000'}</span>
                    </div>
                  </div>
                  <div className="extra-card">
                    <Icon d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2zM22 6l-10 7L2 6" />
                    <div>
                      <span className="extra-card-label">Correo institucional</span>
                      <span className="extra-card-value">{contacto?.email || 'contacto@oruro.gob.bo'}</span>
                    </div>
                  </div>
                </div>
              </div>
            )}

            {/* ════ TAB FORMULARIO ════ */}
            {activeTab === 'contacto' && (
              <div className="tab-contacto">
                {formStatus === 'sent' ? (
                  <motion.div
                    className="form-success"
                    initial={{ opacity: 0, scale: 0.9 }}
                    animate={{ opacity: 1, scale: 1 }}
                  >
                    <div className="success-icon">✓</div>
                    <h3>¡Mensaje enviado!</h3>
                    <p>Nos pondremos en contacto contigo a la brevedad posible.</p>
                    <button className="form-reset" onClick={() => { setFormStatus('idle'); setFormData({ nombre:'', email:'', asunto:'', mensaje:'' }); }}>
                      Enviar otro mensaje
                    </button>
                  </motion.div>
                ) : (
                  <form className="contact-form" onSubmit={handleFormSubmit} noValidate>
                    <div className="form-row">
                      <div className="form-group">
                        <label htmlFor="cf-nombre">Nombre completo</label>
                        <input
                          id="cf-nombre" name="nombre" type="text"
                          placeholder="Tu nombre"
                          value={formData.nombre}
                          onChange={handleFormChange}
                          required
                        />
                      </div>
                      <div className="form-group">
                        <label htmlFor="cf-email">Correo electrónico</label>
                        <input
                          id="cf-email" name="email" type="email"
                          placeholder="tu@correo.com"
                          value={formData.email}
                          onChange={handleFormChange}
                          required
                        />
                      </div>
                    </div>
                    <div className="form-group">
                      <label htmlFor="cf-asunto">Asunto</label>
                      <input
                        id="cf-asunto" name="asunto" type="text"
                        placeholder="¿En qué podemos ayudarte?"
                        value={formData.asunto}
                        onChange={handleFormChange}
                        required
                      />
                    </div>
                    <div className="form-group">
                      <label htmlFor="cf-mensaje">Mensaje</label>
                      <textarea
                        id="cf-mensaje" name="mensaje"
                        placeholder="Describe tu consulta, sugerencia o reclamo..."
                        rows={5}
                        value={formData.mensaje}
                        onChange={handleFormChange}
                        required
                      />
                    </div>
                    <button
                      type="submit"
                      className={`form-submit${formStatus === 'sending' ? ' form-submit--loading' : ''}`}
                      disabled={formStatus === 'sending'}
                      id="btn-enviar-contacto"
                    >
                      {formStatus === 'sending' ? (
                        <><span className="spinner" />Enviando...</>
                      ) : (
                        <><Icon d="M22 2L11 13M22 2L15 22 11 13 2 9l20-7z" />Enviar mensaje</>
                      )}
                    </button>
                  </form>
                )}
              </div>
            )}

          </motion.div>
        </AnimatePresence>
      </motion.div>
    </section>
  );
}

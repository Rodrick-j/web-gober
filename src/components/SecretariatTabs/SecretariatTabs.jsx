'use client';
import React, { useState } from 'react';
import Image from 'next/image';
import MisionVisionSection from '@/components/MisionVisionSection/MisionVisionSection';
import PlanificacionSection from '@/app/(public)/secretarias/[slug]/PlanificacionSection';
import { secretariasContactData } from '@/data/secretariasContactData';
import styles from './SecretariatTabs.module.css';

export default function SecretariatTabs({ sec, slug }) {
  const [activeTab, setActiveTab] = useState('acerca');
  const [showFullBio, setShowFullBio] = useState(false);
  const hasPlanificacion = slug.includes('planificacion');
  const contactOverride = secretariasContactData[slug];

  const getAbreviatura = (sec) => {
    if (sec.sigla) return sec.sigla.toUpperCase();
    
    // Forzar lectura del nombre completo
    const nombreFull = sec.nombre || sec.nombre_corto || '';
    
    const skipWords = ['de', 'y', 'e', 'la', 'el', 'las', 'los', 'en', 'para', 'del'];
    let abr = nombreFull.split(' ')
      .filter(w => w.trim() && !skipWords.includes(w.toLowerCase()))
      .map(w => w.charAt(0).toUpperCase())
      .join('.');
      
    // Si la sigla no incluye S.D. (Secretaría Departamental), se lo añadimos
    if (abr && !abr.startsWith('S.D.')) {
      // Remover posibles 'S.' o 'D.' sueltos al inicio si estaban mal formados
      abr = abr.replace(/^(S\.|D\.|S\.D\.)+/, '');
      abr = `S.D.${abr}`;
    }
    
    return abr ? `${abr}.` : 'LA SECRETARÍA';
  };
  const siglaText = getAbreviatura(sec);

  return (
    <div className={styles.tabsContainer}>
      <div className={styles.tabButtons}>
        <button 
          className={`${styles.tabBtn} ${activeTab === 'acerca' ? styles.active : ''}`}
          onClick={() => setActiveTab('acerca')}
          style={{ '--acento': sec.color_acento || '#8b0000' }}
        >
          ACERCA DE {siglaText}
        </button>
        <button 
          className={`${styles.tabBtn} ${activeTab === 'autoridad' ? styles.active : ''}`}
          onClick={() => setActiveTab('autoridad')}
          style={{ '--acento': sec.color_acento || '#8b0000' }}
        >
          Autoridad a Cargo
        </button>
        <button 
          className={`${styles.tabBtn} ${activeTab === 'contacto' ? styles.active : ''}`}
          onClick={() => setActiveTab('contacto')}
          style={{ '--acento': sec.color_acento || '#8b0000' }}
        >
          Atención al Ciudadano
        </button>
        {hasPlanificacion && (
          <button 
            className={`${styles.tabBtn} ${activeTab === 'planificacion' ? styles.active : ''}`}
            onClick={() => setActiveTab('planificacion')}
            style={{ '--acento': sec.color_acento || '#8b0000' }}
          >
            Planificación Departamental
          </button>
        )}
      </div>

      <div className={styles.tabContent}>
        {activeTab === 'acerca' && (
          <div className={styles.contentBlock}>
            {sec.descripcion && (
              <>
                <h2 className={styles.sectionTitle}>ACERCA DE {siglaText}</h2>
                <div className={styles.textBody} style={{ fontSize: '1.2rem', color: '#222' }}>
                  {sec.descripcion}
                </div>
              </>
            )}
            <MisionVisionSection 
              mision={sec.mision} 
              vision={sec.vision} 
              titleClass={styles.sectionTitle} 
              textClass={styles.textBody} 
            />
            {!sec.descripcion && !sec.mision && !sec.vision && (
              <p className={styles.emptyText}>La información detallada de esta secretaría se está actualizando.</p>
            )}
          </div>
        )}


        {activeTab === 'autoridad' && (
          <div className={styles.contentBlock}>
            <div className={styles.secretarioInfo}>
              <div className={styles.secretarioFotoWrapper}>
                {sec.secretario_foto_url ? (
                  <Image 
                    src={sec.secretario_foto_url} 
                    alt={sec.secretario_nombre || 'Autoridad'} 
                    width={300}
                    height={350}
                    className={styles.secretarioFoto} 
                  />
                ) : (
                  <div className={styles.secretarioFotoPlaceholder}>👤</div>
                )}
              </div>
              <div className={styles.secretarioDetalles}>
                <h3 className={styles.secretarioNombre}>
                  {sec.secretario_nombre || 'Por designar'}
                </h3>
                <div className={styles.secretarioCargo} style={{ color: sec.color_acento || '#d32f2f', backgroundColor: `${sec.color_acento || '#d32f2f'}15` }}>
                  {sec.secretario_cargo || 'Autoridad Departamental'}
                </div>
                {sec.secretario_bio && (
                  <>
                    <p className={`${styles.secretarioBio} ${!showFullBio ? styles.bioTruncated : ''}`}>
                      {sec.secretario_bio}
                    </p>
                    {sec.secretario_bio.length > 250 && (
                      <button 
                        className={styles.verMasBtn} 
                        onClick={() => setShowFullBio(!showFullBio)}
                        style={{ color: sec.color_acento || '#0066cc' }}
                      >
                        {showFullBio ? 'Ver menos' : 'Ver más...'}
                      </button>
                    )}
                  </>
                )}
              </div>
            </div>
          </div>
        )}

        {activeTab === 'contacto' && (
          <div className={styles.contentBlock}>
            <h2 className={styles.sectionTitle}>Atención al Ciudadano</h2>
            
            <div className={styles.contactoSplitLayout}>
              <div className={styles.contactoInfoCol}>
                {(contactOverride?.contacto?.direccion || sec.direccion) && (
                  <div className={styles.contactoInfoItem}>
                    <div className={styles.contactoIconBox} style={{color: sec.color_acento || '#8b0000', backgroundColor: `${sec.color_acento || '#8b0000'}15`}}>📍</div>
                    <div className={styles.contactoTextCol}>
                      <span className={styles.contactoLabel}>Dirección</span>
                      <span className={styles.contactoValor}>{contactOverride?.contacto?.direccion || sec.direccion}</span>
                    </div>
                  </div>
                )}
                {(contactOverride?.contacto?.telefono || sec.telefono) && (
                  <div className={styles.contactoInfoItem}>
                    <div className={styles.contactoIconBox} style={{color: sec.color_acento || '#8b0000', backgroundColor: `${sec.color_acento || '#8b0000'}15`}}>📞</div>
                    <div className={styles.contactoTextCol}>
                      <span className={styles.contactoLabel}>Teléfono</span>
                      <span className={styles.contactoValor}>{contactOverride?.contacto?.telefono || sec.telefono}</span>
                    </div>
                  </div>
                )}
                {(contactOverride?.contacto?.correo || sec.email) && (
                  <div className={styles.contactoInfoItem}>
                    <div className={styles.contactoIconBox} style={{color: sec.color_acento || '#8b0000', backgroundColor: `${sec.color_acento || '#8b0000'}15`}}>✉️</div>
                    <div className={styles.contactoTextCol}>
                      <span className={styles.contactoLabel}>Correo Electrónico</span>
                      <span className={styles.contactoValor}>{contactOverride?.contacto?.correo || sec.email}</span>
                    </div>
                  </div>
                )}
                {sec.horario && (
                  <div className={styles.contactoInfoItem}>
                    <div className={styles.contactoIconBox} style={{color: sec.color_acento || '#8b0000', backgroundColor: `${sec.color_acento || '#8b0000'}15`}}>🕒</div>
                    <div className={styles.contactoTextCol}>
                      <span className={styles.contactoLabel}>Horarios de Atención</span>
                      <span className={styles.contactoValor}>{sec.horario}</span>
                    </div>
                  </div>
                )}
              </div>

              {contactOverride?.contacto?.mapa_query && (
                <div className={styles.contactoMapCol}>
                  <iframe 
                    src={`https://maps.google.com/maps?q=${encodeURIComponent(contactOverride.contacto.mapa_query)}&t=&z=15&ie=UTF8&iwloc=&output=embed`}
                    width="100%" 
                    height="100%" 
                    style={{ border: 0, borderRadius: '16px' }} 
                    allowFullScreen="" 
                    loading="lazy" 
                    referrerPolicy="no-referrer-when-downgrade"
                  ></iframe>
                </div>
              )}
            </div>
              {!contactOverride && !sec.direccion && !sec.telefono && !sec.email && !sec.horario && (
                <p className={styles.emptyText}>Información de contacto no disponible.</p>
              )}
            
            {contactOverride?.redes && (
              <div className={styles.redesContainer}>
                <h3 className={styles.redesTitle}>Nuestras Redes Sociales</h3>
                <div className={styles.redesGrid}>
                  {contactOverride.redes.facebook && (
                    <a href={contactOverride.redes.facebook} target="_blank" rel="noopener noreferrer" className={`${styles.socialLink} ${styles.fb}`} style={{'--acento': sec.color_acento}}>
                      <svg viewBox="0 0 24 24" fill="currentColor"><path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/></svg>
                      <span>Facebook</span>
                    </a>
                  )}
                  {contactOverride.redes.instagram && (
                    <a href={contactOverride.redes.instagram} target="_blank" rel="noopener noreferrer" className={`${styles.socialLink} ${styles.ig}`} style={{'--acento': sec.color_acento}}>
                      <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zM12 0C8.741 0 8.333.014 7.053.072 2.695.272.273 2.69.073 7.051.014 8.333 0 8.741 0 12c0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98C15.668.014 15.259 0 12 0zm0 5.838a6.162 6.162 0 100 12.324 6.162 6.162 0 000-12.324zM12 16a4 4 0 110-8 4 4 0 010 8zm6.406-11.845a1.44 1.44 0 100 2.881 1.44 1.44 0 000-2.881z"/></svg>
                      <span>Instagram</span>
                    </a>
                  )}
                  {contactOverride.redes.tiktok && (
                    <a href={contactOverride.redes.tiktok} target="_blank" rel="noopener noreferrer" className={`${styles.socialLink} ${styles.tk}`} style={{'--acento': sec.color_acento}}>
                      <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12.525.02c1.31-.02 2.61-.01 3.91-.02.08 1.53.63 3.09 1.75 4.17 1.12 1.11 2.7 1.62 4.24 1.79v4.03c-1.44-.17-2.86-.74-3.99-1.72-.08-.07-.15-.15-.22-.23v6.52c-.03 2.32-.82 4.67-2.5 6.07-1.89 1.67-4.66 2.05-6.96 1.16-2.87-1.11-4.73-4.21-4.52-7.3.18-3.32 2.76-6.19 6.07-6.52v4.1c-1.38.16-2.59 1.18-2.89 2.53-.4 1.83.74 3.75 2.58 4.11 1.56.33 3.23-.46 3.73-1.97.1-.31.14-.63.14-.95V.02z"/></svg>
                      <span>TikTok</span>
                    </a>
                  )}
                  {contactOverride.redes.youtube && (
                    <a href={contactOverride.redes.youtube} target="_blank" rel="noopener noreferrer" className={`${styles.socialLink} ${styles.yt}`} style={{'--acento': sec.color_acento}}>
                      <svg viewBox="0 0 24 24" fill="currentColor"><path d="M23.498 6.163a3.003 3.003 0 00-2.11-2.11C19.518 3.545 12 3.545 12 3.545s-7.518 0-9.388.508a3.003 3.003 0 00-2.11 2.11C0 8.033 0 12 0 12s0 3.967.502 5.837a3.003 3.003 0 002.11 2.11c1.87.508 9.388.508 9.388.508s7.518 0 9.388-.508a3.003 3.003 0 002.11-2.11C24 15.967 24 12 24 12s0-3.967-.502-5.837zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/></svg>
                      <span>YouTube</span>
                    </a>
                  )}
                </div>
              </div>
            )}
          </div>
        )}

        {activeTab === 'planificacion' && hasPlanificacion && (
          <div className={styles.contentBlockFull}>
            <PlanificacionSection secretariaId={sec.id} />
          </div>
        )}
      </div>
    </div>
  );
}

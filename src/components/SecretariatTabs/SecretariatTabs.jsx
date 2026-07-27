'use client';
import React, { useState } from 'react';
import Image from 'next/image';
import MisionVisionSection from '@/components/MisionVisionSection/MisionVisionSection';
import PlanificacionSection from '@/app/(public)/secretarias/[slug]/PlanificacionSection';
import styles from './SecretariatTabs.module.css';

export default function SecretariatTabs({ sec, slug }) {
  const [activeTab, setActiveTab] = useState('acerca');
  const hasPlanificacion = slug.includes('planificacion');

  return (
    <div className={styles.tabsContainer}>
      <div className={styles.tabButtons}>
        <button 
          className={`${styles.tabBtn} ${activeTab === 'acerca' ? styles.active : ''}`}
          onClick={() => setActiveTab('acerca')}
          style={{ '--acento': sec.color_acento || '#8b0000' }}
        >
          Acerca de nosotros
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
                <h2 className={styles.sectionTitle}>Acerca de nosotros</h2>
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
              <h3 className={styles.secretarioNombre}>
                {sec.secretario_nombre || 'Por designar'}
              </h3>
              <div className={styles.secretarioCargo} style={{ color: sec.color_acento || '#d32f2f', backgroundColor: `${sec.color_acento || '#d32f2f'}15` }}>
                {sec.secretario_cargo || 'Autoridad Departamental'}
              </div>
              {sec.secretario_bio && (
                <p className={styles.secretarioBio}>{sec.secretario_bio}</p>
              )}
            </div>
          </div>
        )}

        {activeTab === 'contacto' && (
          <div className={styles.contentBlock}>
            <h2 className={styles.sectionTitle}>Atención al Ciudadano</h2>
            <div className={styles.contactoGrid}>
              {sec.direccion && (
                <div className={styles.contactoItem}>
                  <div className={styles.contactoIcon}>📍</div>
                  <div>
                    <span className={styles.contactoLabel}>Dirección</span>
                    <span className={styles.contactoValor}>{sec.direccion}</span>
                  </div>
                </div>
              )}
              {sec.telefono && (
                <div className={styles.contactoItem}>
                  <div className={styles.contactoIcon}>📞</div>
                  <div>
                    <span className={styles.contactoLabel}>Teléfono</span>
                    <span className={styles.contactoValor}>{sec.telefono}</span>
                  </div>
                </div>
              )}
              {sec.email && (
                <div className={styles.contactoItem}>
                  <div className={styles.contactoIcon}>✉️</div>
                  <div>
                    <span className={styles.contactoLabel}>Correo Electrónico</span>
                    <span className={styles.contactoValor}>{sec.email}</span>
                  </div>
                </div>
              )}
              {sec.horario && (
                <div className={styles.contactoItem}>
                  <div className={styles.contactoIcon}>🕒</div>
                  <div>
                    <span className={styles.contactoLabel}>Horarios de Atención</span>
                    <span className={styles.contactoValor}>{sec.horario}</span>
                  </div>
                </div>
              )}
              {!sec.direccion && !sec.telefono && !sec.email && !sec.horario && (
                <p className={styles.emptyText}>Información de contacto no disponible.</p>
              )}
            </div>
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

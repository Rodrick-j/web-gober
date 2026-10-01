'use client';

import React, { useState } from 'react';
import { FileText, ShieldAlert, MessageSquare, BarChart, ExternalLink, Activity } from 'lucide-react';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import TransparencyHero from '@/components/TransparencyHero/TransparencyHero';
import FormularioDenunciaClient from './formulario-denuncia/FormularioDenunciaClient';
import SolicitudInformacionClient from './solicitud-informacion/SolicitudForm';
import ContenidoBloque from '@/components/ContenidoInstitucional/ContenidoBloque';
import GacetaClient from '@/app/(public)/gaceta/[tipo]/GacetaClient';
import tabsStyles from '@/components/SecretariatTabs/SecretariatTabs.module.css';
import styles from './page.module.css';

const TABS = [
  { id: 'unidad', label: 'Unidad de Transparencia', icon: <ShieldAlert size={18} /> },
  { id: 'formulario', label: 'Formulario de Denuncia', icon: <FileText size={18} /> },
  { id: 'solicitud', label: 'Solicitud de Información', icon: <MessageSquare size={18} /> },
  { id: 'rendicion', label: 'Rendición de Cuentas', icon: <BarChart size={18} /> },
  { id: 'actividades', label: 'Actividades y Campañas', icon: <Activity size={18} /> },
];

export default function TransparenciaClientHub({ 
  unidadData, 
  encargadoData, 
  rendicionDocumentos, 
  actividadesDocumentos 
}) {
  const [activeTab, setActiveTab] = useState('unidad');

  return (
    <main className={styles.main}>
      <AnimatedBackground />
      <TransparencyHero
        showBack={false}
        eyebrow="Gobierno Autónomo Departamental de Oruro"
        title="Transparencia institucional"
        description="Información pública clara, accesible y organizada para fortalecer la confianza y el control ciudadano."
      />

      <div className={styles.container} style={{ marginTop: '2rem' }}>
        
        <div className={tabsStyles.tabsContainer}>
          <div className={tabsStyles.tabButtons}>
            {TABS.map((tab) => (
              <button
                key={tab.id}
                className={`${tabsStyles.tabBtn} ${activeTab === tab.id ? tabsStyles.active : ''}`}
                onClick={() => setActiveTab(tab.id)}
                style={{ '--color-primary': '#8b0000' }}
              >
                <span style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                  {tab.icon} {tab.label}
                </span>
              </button>
            ))}
            
            <a 
              href="https://observatorio.gob.bo/#/acerca-de" 
              target="_blank" 
              rel="noopener noreferrer"
              className={tabsStyles.tabBtn}
              style={{ '--color-primary': '#444' }}
            >
              <span style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                <ExternalLink size={18} /> Observatorio Nacional
              </span>
            </a>
          </div>

          <div className={tabsStyles.tabContent}>
            
            {activeTab === 'unidad' && (
              <div className={tabsStyles.contentBlockFull} style={{ padding: '2rem', background: 'white' }}>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '2rem' }}>
                  <ContenidoBloque
                    titulo={unidadData?.titulo || 'Unidad de Transparencia y Lucha Contra la Corrupción'}
                    cuerpo={
                      unidadData?.cuerpo ||
                      '<p>La Unidad de Transparencia y Lucha Contra la Corrupción (UTLCC), en el marco de la <strong>Ley N.º 974</strong>, es responsable de gestionar las denuncias por presuntos actos de corrupción, promover la ética y la transparencia institucional, coordinar la Rendición Pública de Cuentas y asegurar el acceso a la información pública.</p>'
                    }
                    archivoUrl={unidadData?.archivo_url}
                    archivoLabel="Consultar documento oficial"
                  />
                  <ContenidoBloque
                    titulo={encargadoData?.titulo || 'Atención a la Ciudadanía'}
                    cuerpo={
                      encargadoData?.cuerpo ||
                      '<p>Para consultas, denuncias o solicitudes de información puede comunicarse con la Unidad de Transparencia a través de los canales oficiales publicados en la sección de contacto del portal.</p>'
                    }
                  />
                </div>
              </div>
            )}

            {activeTab === 'formulario' && (
              <div className={tabsStyles.contentBlockFull} style={{ padding: '0', background: 'transparent', boxShadow: 'none' }}>
                <FormularioDenunciaClient />
              </div>
            )}

            {activeTab === 'solicitud' && (
              <div className={tabsStyles.contentBlockFull} style={{ padding: '0', background: 'transparent', boxShadow: 'none' }}>
                <SolicitudInformacionClient />
              </div>
            )}

            {activeTab === 'rendicion' && (
              <div className={tabsStyles.contentBlockFull} style={{ padding: '0', background: 'transparent', boxShadow: 'none' }}>
                 <div style={{ backgroundColor: '#fcfcfc', paddingTop: '1rem', borderRadius: '16px' }}>
                  <GacetaClient
                    documentos={rendicionDocumentos}
                    tipoLabel="Rendición Pública de Cuentas"
                    icon="📊"
                  />
                </div>
              </div>
            )}

            {activeTab === 'actividades' && (
              <div className={tabsStyles.contentBlockFull} style={{ padding: '0', background: 'transparent', boxShadow: 'none' }}>
                 <div style={{ backgroundColor: '#fcfcfc', paddingTop: '1rem', borderRadius: '16px' }}>
                  <GacetaClient
                    documentos={actividadesDocumentos}
                    tipoLabel="Actividades y Campañas"
                    icon="📢"
                  />
                </div>
              </div>
            )}

          </div>
        </div>

      </div>
    </main>
  );
}

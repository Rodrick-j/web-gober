'use client';

import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { createClient } from '@/lib/supabase/client';
import styles from './organigrama.module.css';
import CenefaCultural from '@/components/CenefaCultural/CenefaCultural';

export default function OrganigramaPage() {
  const [secretarias, setSecretarias] = useState([]);
  const [selectedSec, setSelectedSec] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadSecretarias() {
      try {
        const supabase = createClient();
        const { data, error } = await supabase
          .from('secretarias')
          .select('id, nombre, nombre_corto, slug, color_acento')
          .eq('activo', true)
          .order('orden');
        
        if (data && !error) {
          setSecretarias(data);
          // Buscar Cultura y Turismo por defecto, o seleccionar la primera
          const cultura = data.find(s => s.slug === 'cultura-turismo');
          setSelectedSec(cultura || data[0]);
        }
      } catch (err) {
        console.error('Error cargando secretarías:', err);
      } finally {
        setLoading(false);
      }
    }
    loadSecretarias();
  }, []);

  const handleSecChange = (e) => {
    const sec = secretarias.find(s => s.slug === e.target.value);
    if (sec) {
      setSelectedSec(sec);
    }
  };

  const isCulturaTurismo = selectedSec?.slug === 'cultura-turismo';
  const accentColor = selectedSec?.color_acento || '#8B0000';

  return (
    <>
      <CenefaCultural />
      <div className={styles.pageWrapper} style={{ '--acento-dinamico': accentColor }}>
        
        {/* Header */}
        <div className={styles.header}>
          <motion.h1 
            className={styles.title}
            initial={{ opacity: 0, y: -20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
          >
            ORGANIGRAMA INSTITUCIONAL
          </motion.h1>
          <motion.p 
            className={styles.subtitle}
            initial={{ opacity: 0, y: -10 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6, delay: 0.15 }}
          >
            Gobierno Autónomo Departamental de Oruro
          </motion.p>
          <motion.div 
            className={styles.accentLine}
            initial={{ width: 0 }}
            animate={{ width: 80 }}
            transition={{ duration: 0.8, delay: 0.3 }}
          />

          {/* Selector / Filtro de Secretarías */}
          {!loading && secretarias.length > 0 && (
            <motion.div 
              className={styles.filterSection}
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ duration: 0.5, delay: 0.2 }}
            >
              <label className={styles.filterLabel} htmlFor="sec-select">
                Seleccione una Secretaría Departamental:
              </label>
              <div className={styles.selectWrapper}>
                <select 
                  id="sec-select"
                  className={styles.selectBox} 
                  value={selectedSec?.slug || ''}
                  onChange={handleSecChange}
                >
                  {secretarias.map((s) => (
                    <option key={s.id} value={s.slug}>
                      {s.nombre_corto}
                    </option>
                  ))}
                </select>
                <div className={styles.selectIcon}>
                  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="3"><path d="m6 9 6 6 6-6"/></svg>
                </div>
              </div>
            </motion.div>
          )}
        </div>

        {/* Carga */}
        {loading ? (
          <div className={styles.loadingWrapper}>
            <div className={styles.spinner} />
            <p>Cargando Estructura Organizacional...</p>
          </div>
        ) : (
          <AnimatePresence mode="wait">
            <motion.div
              key={selectedSec?.id}
              initial={{ opacity: 0, y: 15 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -15 }}
              transition={{ duration: 0.4 }}
              className={styles.chartScrollContainer}
            >
              <div className={styles.chartContainer}>
                
                {isCulturaTurismo ? (
                  /* ── ORGANIGRAMA OFICIAL: CULTURA Y TURISMO ── */
                  <>
                    <h2 className={styles.secTitle}>Estructura de la Secretaría Departamental de Cultura y Turismo</h2>
                    
                    {/* LEVEL 1: SECRETARIO & STAFF */}
                    <div className={styles.levelGroup}>
                      <div className={styles.groupVerticalLine} />

                      {/* Staff izquierdo */}
                      <div className={styles.supportColumnLeft}>
                        <div className={styles.supportNode}>
                          <span className={styles.nodeRole}>Secretaria</span>
                          <div className={styles.supportLineLeft} />
                        </div>
                        <div className={styles.supportNode}>
                          <span className={styles.nodeRole}>Chofer</span>
                          <div className={styles.supportLineLeft} />
                        </div>
                      </div>

                      {/* Main Secretario Card */}
                      <motion.div 
                        className={`${styles.nodeCard} ${styles.secretaryNode}`}
                        whileHover={{ scale: 1.04, translateY: -2 }}
                        transition={{ type: 'spring', stiffness: 350, damping: 18 }}
                      >
                        <div className={styles.nodeHeader}>Secretario Departamental</div>
                        <div className={styles.nodeName}>Cultura y Turismo</div>
                        <div className={styles.nodeSubText}>GADOR Oruro</div>
                      </motion.div>

                      {/* Staff derecho */}
                      <div className={styles.supportColumnRight}>
                        <div className={styles.supportNode}>
                          <span className={styles.nodeRole}>Técnico Sup. I Antropólogo</span>
                          <div className={styles.supportLineRight} />
                        </div>
                        <div className={styles.supportNode}>
                          <span className={styles.nodeRole}>Técnico Diseñador Gráfico</span>
                          <span className={styles.nodeRoleDetail}>Difusión Turística</span>
                          <div className={styles.supportLineRight} />
                        </div>
                      </div>
                    </div>

                    <div className={styles.verticalConnector} />

                    {/* LEVEL 2: JEFE DE UNIDAD */}
                    <div className={styles.levelGroupCentered}>
                      <motion.div 
                        className={`${styles.nodeCard} ${styles.jefeNode}`}
                        whileHover={{ scale: 1.04, translateY: -2 }}
                        transition={{ type: 'spring', stiffness: 350, damping: 18 }}
                      >
                        <div className={styles.nodeHeader}>Jefe de Unidad</div>
                        <div className={styles.nodeName}>Desarrollo Cultural</div>
                        <div className={styles.nodeSubText}>Área de Dirección</div>
                      </motion.div>
                    </div>

                    <div className={styles.verticalSplitWrapper}>
                      <div className={styles.splitHorizontalLine} />
                      <div className={styles.splitVerticalConnectors}>
                        <div className={styles.splitVerticalLine} />
                        <div className={styles.splitVerticalLine} />
                        <div className={styles.splitVerticalLine} />
                      </div>
                    </div>

                    {/* LEVEL 3: PROGRAMAS */}
                    <div className={styles.threeColumnsGrid}>
                      {/* Programa 1: Turismo */}
                      <div className={styles.programColumn}>
                        <motion.div 
                          className={`${styles.nodeCard} ${styles.programNode} ${styles.turismoNode}`}
                          whileHover={{ scale: 1.03 }}
                          transition={{ type: 'spring', stiffness: 300, damping: 20 }}
                        >
                          <div className={styles.nodeHeader}>Área Programa</div>
                          <div className={styles.nodeName}>Turismo</div>
                        </motion.div>

                        <div className={styles.verticalBranchLine} />

                        {/* Level 4 Leafs */}
                        <div className={styles.leafsContainer}>
                          <div className={styles.leafNode}>
                            <span className={styles.leafIcon}>📍</span>
                            <span className={styles.leafText}>Caseta de Información #1</span>
                          </div>
                          <div className={styles.leafNode}>
                            <span className={styles.leafIcon}>📍</span>
                            <span className={styles.leafText}>Caseta de Información #2</span>
                          </div>
                        </div>
                      </div>

                      {/* Programa 2: Fortalecimiento */}
                      <div className={styles.programColumn}>
                        <motion.div 
                          className={`${styles.nodeCard} ${styles.programNode} ${styles.fortalecimientoNode}`}
                          whileHover={{ scale: 1.03 }}
                          transition={{ type: 'spring', stiffness: 300, damping: 20 }}
                        >
                          <div className={styles.nodeHeader}>Responsable de Programa</div>
                          <div className={styles.nodeName}>Fortalecimiento para la Gestión y Desarrollo Artístico Cultural</div>
                        </motion.div>

                        <div className={styles.verticalBranchLine} />

                        {/* Level 4 Leafs */}
                        <div className={styles.leafsContainer}>
                          <div className={styles.leafNode}>
                            <span className={styles.leafIcon}>👤</span>
                            <span className={styles.leafText}>Comunicador Social</span>
                          </div>
                          <div className={styles.leafNode}>
                            <span className={styles.leafIcon}>🎨</span>
                            <span className={styles.leafText}>Gestor Cultural</span>
                          </div>
                        </div>
                      </div>

                      {/* Programa 3: Promoción y Salvaguardia */}
                      <div className={styles.programColumn}>
                        <motion.div 
                          className={`${styles.nodeCard} ${styles.programNode} ${styles.patrimonioNode}`}
                          whileHover={{ scale: 1.03 }}
                          transition={{ type: 'spring', stiffness: 300, damping: 20 }}
                        >
                          <div className={styles.nodeHeader}>Responsable de Programa</div>
                          <div className={styles.nodeName}>Promoción y Salvaguardia del Patrimonio Cultural Material e Inmaterial</div>
                        </motion.div>

                        <div className={styles.verticalBranchLine} />

                        {/* Level 4 Leafs */}
                        <div className={styles.leafsContainer}>
                          <div className={styles.leafNode}>
                            <span className={styles.leafIcon}>🏺</span>
                            <span className={styles.leafText}>Técnico Patrimonio Material e Inmaterial</span>
                          </div>
                          <div className={styles.leafNode}>
                            <span className={styles.leafIcon}>💼</span>
                            <span className={styles.leafText}>Administrador Financiero</span>
                          </div>
                          <div className={styles.leafNode}>
                            <span className={styles.leafIcon}>🔍</span>
                            <span className={styles.leafText}>Catalogador de Sitios Arqueológicos</span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </>
                ) : (
                  /* ── ORGANIGRAMA DINÁMICO PLANTILLA: OTRAS SECRETARÍAS ── */
                  <>
                    <h2 className={styles.secTitle}>Estructura de la {selectedSec?.nombre}</h2>

                    {/* LEVEL 1: SECRETARIO & STAFF */}
                    <div className={styles.levelGroup}>
                      <div className={styles.groupVerticalLine} />

                      {/* Staff izquierdo */}
                      <div className={styles.supportColumnLeft}>
                        <div className={styles.supportNode}>
                          <span className={styles.nodeRole}>Secretaría de Despacho</span>
                          <div className={styles.supportLineLeft} />
                        </div>
                      </div>

                      {/* Main Secretario Card */}
                      <motion.div 
                        className={`${styles.nodeCard} ${styles.secretaryNode}`}
                        style={{ background: `linear-gradient(135deg, ${accentColor} 0%, #1e293b 100%)`, borderColor: accentColor }}
                        whileHover={{ scale: 1.04, translateY: -2 }}
                        transition={{ type: 'spring', stiffness: 350, damping: 18 }}
                      >
                        <div className={styles.nodeHeader}>Secretario Departamental</div>
                        <div className={styles.nodeName}>{selectedSec?.nombre_corto}</div>
                        <div className={styles.nodeSubText}>GADOR Oruro</div>
                      </motion.div>

                      {/* Staff derecho */}
                      <div className={styles.supportColumnRight}>
                        <div className={styles.supportNode}>
                          <span className={styles.nodeRole}>Asesor Técnico / Legal</span>
                          <div className={styles.supportLineRight} />
                        </div>
                      </div>
                    </div>

                    <div className={styles.verticalConnector} />

                    {/* LEVEL 2: JEFE DE UNIDAD */}
                    <div className={styles.levelGroupCentered}>
                      <motion.div 
                        className={`${styles.nodeCard} ${styles.jefeNode}`}
                        style={{ background: `linear-gradient(135deg, ${accentColor} 0%, #334155 100%)` }}
                        whileHover={{ scale: 1.04, translateY: -2 }}
                        transition={{ type: 'spring', stiffness: 350, damping: 18 }}
                      >
                        <div className={styles.nodeHeader}>Jefe de Unidad</div>
                        <div className={styles.nodeName}>Planificación y Gestión</div>
                        <div className={styles.nodeSubText}>Coordinación General</div>
                      </motion.div>
                    </div>

                    <div className={styles.verticalSplitWrapper}>
                      <div className={styles.splitHorizontalLine} />
                      <div className={styles.splitVerticalConnectors}>
                        <div className={styles.splitVerticalLine} />
                        <div className={styles.splitVerticalLine} />
                        <div className={styles.splitVerticalLine} />
                      </div>
                    </div>

                    {/* LEVEL 3: PROGRAMAS */}
                    <div className={styles.threeColumnsGrid}>
                      {/* Programa 1 */}
                      <div className={styles.programColumn}>
                        <motion.div 
                          className={`${styles.nodeCard} ${styles.programNode}`}
                          style={{ background: 'linear-gradient(135deg, #0f172a 0%, #334155 100%)', color: '#ffffff' }}
                          whileHover={{ scale: 1.03 }}
                          transition={{ type: 'spring', stiffness: 300, damping: 20 }}
                        >
                          <div className={styles.nodeHeader}>Área Programa I</div>
                          <div className={styles.nodeName}>Operaciones y Proyectos</div>
                        </motion.div>

                        <div className={styles.verticalBranchLine} />

                        <div className={styles.leafsContainer}>
                          <div className={styles.leafNode} style={{ borderLeftColor: accentColor }}>
                            <span className={styles.leafIcon}>🛠️</span>
                            <span className={styles.leafText}>Técnico de Campo I</span>
                          </div>
                          <div className={styles.leafNode} style={{ borderLeftColor: accentColor }}>
                            <span className={styles.leafIcon}>🛠️</span>
                            <span className={styles.leafText}>Técnico de Campo II</span>
                          </div>
                        </div>
                      </div>

                      {/* Programa 2 */}
                      <div className={styles.programColumn}>
                        <motion.div 
                          className={`${styles.nodeCard} ${styles.programNode}`}
                          style={{ background: 'linear-gradient(135deg, #0f172a 0%, #334155 100%)', color: '#ffffff' }}
                          whileHover={{ scale: 1.03 }}
                          transition={{ type: 'spring', stiffness: 300, damping: 20 }}
                        >
                          <div className={styles.nodeHeader}>Área Programa II</div>
                          <div className={styles.nodeName}>Administración y Control</div>
                        </motion.div>

                        <div className={styles.verticalBranchLine} />

                        <div className={styles.leafsContainer}>
                          <div className={styles.leafNode} style={{ borderLeftColor: accentColor }}>
                            <span className={styles.leafIcon}>💼</span>
                            <span className={styles.leafText}>Administrador de Unidad</span>
                          </div>
                          <div className={styles.leafNode} style={{ borderLeftColor: accentColor }}>
                            <span className={styles.leafIcon}>📂</span>
                            <span className={styles.leafText}>Gestor Documental</span>
                          </div>
                        </div>
                      </div>

                      {/* Programa 3 */}
                      <div className={styles.programColumn}>
                        <motion.div 
                          className={`${styles.nodeCard} ${styles.programNode}`}
                          style={{ background: 'linear-gradient(135deg, #0f172a 0%, #334155 100%)', color: '#ffffff' }}
                          whileHover={{ scale: 1.03 }}
                          transition={{ type: 'spring', stiffness: 300, damping: 20 }}
                        >
                          <div className={styles.nodeHeader}>Área Programa III</div>
                          <div className={styles.nodeName}>Gestión Institucional</div>
                        </motion.div>

                        <div className={styles.verticalBranchLine} />

                        <div className={styles.leafsContainer}>
                          <div className={styles.leafNode} style={{ borderLeftColor: accentColor }}>
                            <span className={styles.leafIcon}>🤝</span>
                            <span className={styles.leafText}>Encargado de Enlace</span>
                          </div>
                          <div className={styles.leafNode} style={{ borderLeftColor: accentColor }}>
                            <span className={styles.leafIcon}>🔍</span>
                            <span className={styles.leafText}>Supervisor de Calidad</span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </>
                )}

              </div>
            </motion.div>
          </AnimatePresence>
        )}

      </div>
    </>
  );
}

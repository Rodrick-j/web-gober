'use client';

import React, { useMemo, useState, useRef, useEffect } from 'react';
import { motion } from 'framer-motion';
import planificacionData from '@/data/planificacion.json';
import { BarChart3, Calculator, MapPin, Search, ChevronDown, X } from 'lucide-react';
import styles from './ResumenMunicipios.module.css';
import { getMuniFullName } from '@/utils/formatMuni';
import { numeroALetras } from '@/utils/numeroALetras';

export default function ResumenMunicipios() {
  const [searchTerm, setSearchTerm] = useState('');
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);
  const dropdownRef = useRef(null);

  useEffect(() => {
    const handleClickOutside = (event) => {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
        setIsDropdownOpen(false);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);

  // 1. Agrupar y procesar datos por municipio
  const { dataPorMunicipio, totalesGenerales } = useMemo(() => {
    const mapa = {};
    const totales = {
      gastoCorriente: 0,
      inversion: 0,
      totalGeneral: 0
    };

    planificacionData.forEach(item => {
      if (item.is_header) return;
      
      const muni = item.municipio;
      const monto = Number(item.monto) || 0;
      const esGasto = item.tipo === 'GASTO CORRIENTE';
      const esInversion = item.tipo === 'INVERSION';

      if (!mapa[muni]) {
        mapa[muni] = { nombre: muni, gastoCorriente: 0, inversion: 0, total: 0 };
      }

      if (esGasto) {
        mapa[muni].gastoCorriente += monto;
        totales.gastoCorriente += monto;
      } else if (esInversion) {
        mapa[muni].inversion += monto;
        totales.inversion += monto;
      }

      mapa[muni].total += monto;
      totales.totalGeneral += monto;
    });

    const arrayData = Object.values(mapa)
      .filter(m => m.total > 0)
      .sort((a, b) => a.nombre.localeCompare(b.nombre));
    return { dataPorMunicipio: arrayData, totalesGenerales: totales };
  }, []);

  // 2. Filtrar por búsqueda y recalcular totales
  const { datosFiltrados, totalesFiltrados } = useMemo(() => {
    const filtrados = dataPorMunicipio.filter(m => m.nombre.toLowerCase().includes(searchTerm.toLowerCase()));
    
    const totales = {
      gastoCorriente: 0,
      inversion: 0,
      totalGeneral: 0
    };

    filtrados.forEach(item => {
      totales.gastoCorriente += item.gastoCorriente;
      totales.inversion += item.inversion;
      totales.totalGeneral += item.total;
    });

    return { datosFiltrados: filtrados, totalesFiltrados: totales };
  }, [dataPorMunicipio, searchTerm]);

  const formatMoney = (amount) => {
    if (!amount || amount === 0) return '-';
    return new Intl.NumberFormat('es-BO', { style: 'currency', currency: 'BOB', maximumFractionDigits: 0 }).format(amount);
  };

  const calcularPorcentaje = (valor, total) => {
    if (!total || total === 0) return 0;
    return ((valor / total) * 100).toFixed(1);
  };

  return (
    <div className={styles.container}>
      {/* Header y Buscador */}
      <div className={styles.header}>
        <div className={styles.titleGroup}>
          <BarChart3 className={styles.titleIcon} size={28} />
          <div>
            <h2 className={styles.title}>Resumen General por Municipio</h2>
            <p className={styles.subtitle}>Distribución de Gasto Corriente e Inversión</p>
          </div>
        </div>

        <div className={styles.searchGroup} ref={dropdownRef}>
          <div
            onClick={() => setIsDropdownOpen(!isDropdownOpen)}
            style={{
              width: '100%',
              background: '#f8f9fa',
              color: '#1a1a2e',
              border: '1.5px solid #dcdcdc',
              borderRadius: '10px',
              padding: '0.6rem 2.5rem 0.6rem 2.3rem',
              fontSize: '0.94rem',
              fontWeight: '800',
              cursor: 'pointer',
              boxShadow: '0 2px 6px rgba(0,0,0,0.03)',
              transition: 'all 0.2s',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'space-between',
              position: 'relative'
            }}
          >
            <MapPin size={16} color="#9c0720" style={{ position: 'absolute', left: '12px' }} />
            <span style={{ overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
              {searchTerm ? searchTerm : 'Todos los Municipios'}
            </span>
            {searchTerm ? (
              <X 
                size={16} 
                color="#555" 
                style={{ position: 'absolute', right: '35px', cursor: 'pointer' }} 
                onClick={(e) => { e.stopPropagation(); setSearchTerm(''); }}
              />
            ) : null}
            <ChevronDown size={18} color="#555" style={{ position: 'absolute', right: '12px', transform: isDropdownOpen ? 'rotate(180deg)' : 'rotate(0deg)', transition: 'transform 0.2s' }} />
          </div>

          {isDropdownOpen && (
            <motion.div
              initial={{ opacity: 0, y: -10 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: -10 }}
              transition={{ duration: 0.15 }}
              style={{
                position: 'absolute',
                top: '100%',
                left: 0,
                right: 0,
                marginTop: '0.5rem',
                background: '#ffffff',
                border: '1px solid #eaeaea',
                borderRadius: '10px',
                boxShadow: '0 10px 35px rgba(0,0,0,0.1)',
                zIndex: 999,
                overflow: 'hidden'
              }}
            >
              <div style={{ padding: '0.5rem', borderBottom: '1px solid #f0f0f0', display: 'flex', alignItems: 'center', gap: '0.5rem', background: '#fcfcfc' }}>
                <Search size={16} color="#888" />
                <input
                  type="text"
                  placeholder="Buscar municipio..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  style={{
                    width: '100%',
                    border: 'none',
                    outline: 'none',
                    background: 'transparent',
                    fontSize: '0.85rem',
                    color: '#333'
                  }}
                  autoFocus
                  onClick={(e) => e.stopPropagation()}
                />
              </div>
              <div style={{ maxHeight: '250px', overflowY: 'auto' }}>
                <div
                  onClick={() => {
                    setSearchTerm('');
                    setIsDropdownOpen(false);
                  }}
                  style={{
                    padding: '0.6rem 1rem',
                    fontSize: '0.85rem',
                    fontWeight: !searchTerm ? '800' : '500',
                    color: !searchTerm ? '#9c0720' : '#333',
                    background: !searchTerm ? '#fce8e8' : 'transparent',
                    cursor: 'pointer',
                    transition: 'background 0.15s'
                  }}
                  onMouseEnter={(e) => {
                    if (searchTerm) e.currentTarget.style.background = '#f5f5f5';
                  }}
                  onMouseLeave={(e) => {
                    if (searchTerm) e.currentTarget.style.background = 'transparent';
                  }}
                >
                  Todos los Municipios
                </div>
                {dataPorMunicipio
                  .filter(m => m.nombre.toLowerCase().includes(searchTerm.toLowerCase()))
                  .map((muni) => (
                    <div
                      key={muni.nombre}
                      onClick={() => {
                        setSearchTerm(muni.nombre);
                        setIsDropdownOpen(false);
                      }}
                      style={{
                        padding: '0.6rem 1rem',
                        fontSize: '0.85rem',
                        fontWeight: searchTerm === muni.nombre ? '800' : '500',
                        color: searchTerm === muni.nombre ? '#9c0720' : '#333',
                        background: searchTerm === muni.nombre ? '#fce8e8' : 'transparent',
                        cursor: 'pointer',
                        transition: 'background 0.15s'
                      }}
                      onMouseEnter={(e) => {
                        if (searchTerm !== muni.nombre) e.currentTarget.style.background = '#f5f5f5';
                      }}
                      onMouseLeave={(e) => {
                        if (searchTerm !== muni.nombre) e.currentTarget.style.background = 'transparent';
                      }}
                    >
                      {getMuniFullName(muni.nombre)}
                    </div>
                  ))}
                {dataPorMunicipio.filter(m => m.nombre.toLowerCase().includes(searchTerm.toLowerCase())).length === 0 && (
                  <div style={{ padding: '1rem', textAlign: 'center', fontSize: '0.85rem', color: '#888' }}>
                    No se encontraron resultados
                  </div>
                )}
              </div>
            </motion.div>
          )}
        </div>
      </div>

      {/* Totales Generales (Tarjetas Superiores) */}
      <div className={styles.totalesGrid}>
        <div className={styles.totalCard}>
          <div className={styles.tooltip}>{numeroALetras(totalesFiltrados.gastoCorriente)}</div>
          <div className={styles.totalLabel}>TOTAL GASTO CORRIENTE</div>
          <div className={styles.totalValueGasto}>{formatMoney(totalesFiltrados.gastoCorriente)}</div>
          <div className={styles.totalBar}>
            <div 
              className={styles.totalBarFillGasto} 
              style={{ width: `${calcularPorcentaje(totalesFiltrados.gastoCorriente, totalesFiltrados.totalGeneral)}%` }}
            ></div>
          </div>
          <div className={styles.totalPercentage}>
            {calcularPorcentaje(totalesFiltrados.gastoCorriente, totalesFiltrados.totalGeneral)}% del Presupuesto
          </div>
        </div>

        <div className={styles.totalCard}>
          <div className={styles.tooltip}>{numeroALetras(totalesFiltrados.inversion)}</div>
          <div className={styles.totalLabel}>TOTAL INVERSIÓN</div>
          <div className={styles.totalValueInversion}>{formatMoney(totalesFiltrados.inversion)}</div>
          <div className={styles.totalBar}>
            <div 
              className={styles.totalBarFillInversion} 
              style={{ width: `${calcularPorcentaje(totalesFiltrados.inversion, totalesFiltrados.totalGeneral)}%` }}
            ></div>
          </div>
          <div className={styles.totalPercentage}>
            {calcularPorcentaje(totalesFiltrados.inversion, totalesFiltrados.totalGeneral)}% del Presupuesto
          </div>
        </div>

        <div className={`${styles.totalCard} ${styles.totalCardMain}`}>
          <div className={styles.tooltip}>{numeroALetras(totalesFiltrados.totalGeneral)}</div>
          <div className={styles.totalLabel}>PRESUPUESTO TOTAL (FILTRADO)</div>
          <div className={styles.totalValueMain}>{formatMoney(totalesFiltrados.totalGeneral)}</div>
        </div>
      </div>

      {/* Tabla Resumen */}
      <div className={styles.tableContainer}>
        <div className={styles.tableResponsive}>
          <table className={styles.dataTable}>
            <thead>
              <tr>
                <th width="25%">Municipio (Etiquetas de fila)</th>
                <th width="30%">Gasto Corriente</th>
                <th width="30%">Inversión</th>
                <th width="15%" style={{ textAlign: 'right' }}>Total General</th>
              </tr>
            </thead>
            <tbody>
              {datosFiltrados.length > 0 ? (
                datosFiltrados.map((item, index) => {
                  const pctGasto = calcularPorcentaje(item.gastoCorriente, item.total);
                  const pctInversion = calcularPorcentaje(item.inversion, item.total);

                  return (
                    <tr key={index}>
                      <td className={styles.muniCell}>
                        <MapPin size={16} className={styles.muniIcon} />
                        {getMuniFullName(item.nombre)}
                      </td>
                      <td>
                        <div className={styles.valCell}>
                          <span>{formatMoney(item.gastoCorriente)}</span>
                          <span className={styles.pctGasto}>{pctGasto}%</span>
                        </div>
                        <div className={styles.barContainer}>
                          <div className={styles.barFillGasto} style={{ width: `${pctGasto}%` }}></div>
                        </div>
                      </td>
                      <td>
                        <div className={styles.valCell}>
                          <span>{formatMoney(item.inversion)}</span>
                          <span className={styles.pctInversion}>{pctInversion}%</span>
                        </div>
                        <div className={styles.barContainer}>
                          <div className={styles.barFillInversion} style={{ width: `${pctInversion}%` }}></div>
                        </div>
                      </td>
                      <td className={styles.totalCell}>
                        {formatMoney(item.total)}
                      </td>
                    </tr>
                  )
                })
              ) : (
                <tr>
                  <td colSpan="4" className={styles.emptyState}>No se encontró el municipio.</td>
                </tr>
              )}
            </tbody>
            <tfoot>
              <tr className={styles.tfootRow}>
                <td>TOTAL GENERAL</td>
                <td>{formatMoney(totalesFiltrados.gastoCorriente)}</td>
                <td>{formatMoney(totalesFiltrados.inversion)}</td>
                <td style={{ textAlign: 'right' }}>{formatMoney(totalesFiltrados.totalGeneral)}</td>
              </tr>
            </tfoot>
          </table>
        </div>
      </div>
    </div>
  );
}

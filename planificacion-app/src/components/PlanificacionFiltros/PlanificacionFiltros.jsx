'use client';

import React, { useState, useMemo, useEffect, useRef } from 'react';
import { Search, MapPin, Tag, ChevronLeft, ChevronRight, Calculator, X, ChevronDown } from 'lucide-react';
import { motion } from 'framer-motion';
import planificacionData from '@/data/planificacion.json';
import styles from './PlanificacionFiltros.module.css';
import { getMuniFullName } from '@/utils/formatMuni';

const ITEMS_PER_PAGE = 10;

export default function PlanificacionFiltros({ globalMunicipio, setGlobalMunicipio }) {
  const [searchTerm, setSearchTerm] = useState('');
  const [showMuniDropdown, setShowMuniDropdown] = useState(false);
  const [muniSearchText, setMuniSearchText] = useState('');
  const dropdownRef = useRef(null);
  
  useEffect(() => {
    const handleClickOutside = (event) => {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
        setShowMuniDropdown(false);
      }
    };
    document.addEventListener('mousedown', handleClickOutside);
    return () => document.removeEventListener('mousedown', handleClickOutside);
  }, []);
  
  // Sincronizar estado local con globalMunicipio
  const [localMuni, setLocalMuni] = useState('Todos');
  
  const RAW_TO_ID = {
    'oruro': 'oruro', 'challapata': 'challapata', 'huanuni': 'huanuni', 'caracollo': 'caracollo', 'corque': 'corque',
    'toledo': 'toledo', 'salinas de garci mendoza': 'salinas', 'turco': 'turco', 's. de huari': 'santiago_de_huari',
    'curahuara de carangas': 'curahuara_de_carangas', 'pazña': 'pazna', 'huallamarca': 'huayllamarca',
    'machacamarca': 'machacamarca', 'eucaliptus': 'eucaliptos', 'santiago de andamarca': 'santiago_de_andamarca',
    'sabaya': 'sabaya', 'santuario de quillacas': 'santuario_de_quillacas', 'antequera': 'antequera',
    'el choro': 'el_choro', 'totora': 'totora', 'poopó': 'poopo', 'belén de andamarca': 'belen_de_andamarca',
    'cruz de machacamarca': 'cruz_de_machacamarca', 'esmeralda': 'esmeralda', 'carangas': 'carangas',
    'coipasa': 'coipasa', 'escara': 'escara', 'huachacalla': 'huachacalla', 'la rivera': 'la_rivera',
    'pampa aullagas': 'pampa_aullagas', 'todos santos': 'todos_santos', 'yunguyo de litoral': 'yunyugo_de_litoral',
    'chipaya': 'chipaya', 'soracachi': 'soracachi', 'choquecota': 'choquecota'
  };

  const ID_TO_RAW = Object.fromEntries(Object.entries(RAW_TO_ID).map(([k, v]) => [v, k]));

  const getMappedMunicipio = (globalId) => {
    if (!globalId || globalId.toLowerCase() === 'todos') return 'Todos';
    const rawLower = ID_TO_RAW[globalId.toLowerCase()];
    if (!rawLower) return globalId.charAt(0).toUpperCase() + globalId.slice(1).toLowerCase();
    
    // Find the exact string from the JSON data that matches this lowercased raw name
    const exactMatch = Array.from(new Set(planificacionData.map(d => d.municipio))).find(m => m.toLowerCase() === rawLower);
    return exactMatch || rawLower.charAt(0).toUpperCase() + rawLower.slice(1);
  };

  const selectedMunicipio = getMappedMunicipio(globalMunicipio || localMuni);

  const handleMunicipioChange = (rawVal) => {
    if (setGlobalMunicipio) {
      if (rawVal === 'Todos') {
        setGlobalMunicipio('TODOS');
      } else {
        const id = RAW_TO_ID[rawVal.toLowerCase()] || rawVal.toLowerCase().replace(/\s/g, '_');
        setGlobalMunicipio(id);
      }
    }
    setLocalMuni(rawVal);
  };

  const [selectedTipo, setSelectedTipo] = useState('Todos');
  const [selectedPrg, setSelectedPrg] = useState('Todos');
  const [selectedProy, setSelectedProy] = useState('Todos');
  const [currentPage, setCurrentPage] = useState(1);
  const [isMounted, setIsMounted] = useState(false);

  useEffect(() => {
    setIsMounted(true);
  }, []);

  // Obtener municipios únicos, excluyendo basura
  const municipiosUnicos = useMemo(() => {
    const garbage = ['Municipio', 'Mnunicipio', 'Comunidad', 'Municipio '];
    const m = new Set(planificacionData.map(item => item.municipio).filter(x => !garbage.includes(x)));
    const sorted = Array.from(m).sort();
    return ['Todos', ...sorted];
  }, []);

  // Obtener PRG únicos (dependiendo del municipio y tipo seleccionado)
  const prgUnicos = useMemo(() => {
    const data = planificacionData.filter(item => {
      const matchMunicipio = selectedMunicipio === 'Todos' || item.municipio === selectedMunicipio;
      const matchTipo = selectedTipo === 'Todos' || item.tipo === selectedTipo;
      return matchMunicipio && matchTipo;
    });
    const p = new Set(data.map(item => String(item.prg).replace(/\s/g, '')).filter(Boolean));
    const sorted = Array.from(p).sort((a,b) => parseInt(a) - parseInt(b));
    return ['Todos', ...sorted];
  }, [planificacionData, selectedMunicipio, selectedTipo]);

  // Obtener PROY únicos (dependiendo de municipio, tipo y PRG seleccionado)
  const proyUnicos = useMemo(() => {
    const data = planificacionData.filter(item => {
      const matchMunicipio = selectedMunicipio === 'Todos' || item.municipio === selectedMunicipio;
      const matchTipo = selectedTipo === 'Todos' || item.tipo === selectedTipo;
      const matchPrg = selectedPrg === 'Todos' || String(item.prg).replace(/\s/g, '') === selectedPrg;
      return matchMunicipio && matchTipo && matchPrg;
    });
    const p = new Set(data.map(item => String(item.proyecto).replace(/\s/g, '')).filter(Boolean));
    const sorted = Array.from(p).sort((a,b) => parseInt(a) - parseInt(b));
    return ['Todos', ...sorted];
  }, [planificacionData, selectedMunicipio, selectedTipo, selectedPrg]);

  // Filtrado de datos
  const filteredData = useMemo(() => {
    return planificacionData.filter(item => {
      const matchSearch = item.descripcion.toLowerCase().includes(searchTerm.toLowerCase());
      const matchMunicipio = selectedMunicipio === 'Todos' || item.municipio === selectedMunicipio;
      const matchTipo = selectedTipo === 'Todos' || item.tipo === selectedTipo;
      const matchPrg = selectedPrg === 'Todos' || String(item.prg).replace(/\s/g, '') === selectedPrg;
      const matchProy = selectedProy === 'Todos' || String(item.proyecto).replace(/\s/g, '') === selectedProy;
      
      return matchSearch && matchMunicipio && matchTipo && matchPrg && matchProy;
    });
  }, [searchTerm, selectedMunicipio, selectedTipo, selectedPrg, selectedProy]);

  // Calcular total de la búsqueda actual
  const totalMonto = useMemo(() => {
    return filteredData.filter(d => !d.is_header).reduce((sum, item) => {
      const value = Number(item.monto) || 0;
      return sum + value;
    }, 0);
  }, [filteredData]);

  // Paginación
  const totalPages = Math.ceil(filteredData.length / ITEMS_PER_PAGE);
  const paginatedData = useMemo(() => {
    const startIndex = (currentPage - 1) * ITEMS_PER_PAGE;
    return filteredData.slice(startIndex, startIndex + ITEMS_PER_PAGE);
  }, [filteredData, currentPage]);

  // Resetea a la primera página cuando cambian los filtros
  useEffect(() => {
    setCurrentPage(1);
  }, [searchTerm, selectedMunicipio, selectedTipo, selectedPrg, selectedProy]);

  const formatMoney = (amount) => {
    if (!amount || amount === 0) return 'Sin presupuesto asignado';
    return new Intl.NumberFormat('es-BO', { style: 'currency', currency: 'BOB' }).format(amount);
  };

  if (!isMounted) return null;

  return (
    <div className={styles.container}>
      
      {/* Header Filters */}
      <div className={styles.filtersWrapper}>
        
        {/* Orientation Text */}
        <div style={{ marginBottom: '0.5rem', color: '#475569', fontSize: '0.9rem', lineHeight: '1.4' }}>
          <strong>Explorador de Planificación:</strong> Utilice estos filtros para buscar y explorar los proyectos, gastos y obras planificadas en el departamento.
        </div>

        <div style={{ display: 'flex', gap: '1rem', marginBottom: '1rem', flexWrap: 'wrap', alignItems: 'center' }}>
          {/* Search Bar */}
          <div className={styles.searchGroup} style={{ flex: '1', minWidth: '250px', marginBottom: 0 }}>
            <Search className={styles.searchIcon} size={20} />
            <input 
              type="text" 
              placeholder="Buscar proyectos, gastos, obras..." 
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className={styles.searchInput}
            />
          </div>

          {/* Tipo Selector */}
          <div className={styles.tabsWrapper}>
            <button 
              className={`${styles.tabBtn} ${selectedTipo === 'Todos' ? styles.tabActive : ''}`}
              onClick={() => setSelectedTipo('Todos')}
            >
              Todos
            </button>
            <button 
              className={`${styles.tabBtn} ${selectedTipo === 'INVERSION' ? styles.tabActive : ''}`}
              onClick={() => setSelectedTipo('INVERSION')}
            >
              Inversión
            </button>
            <button 
              className={`${styles.tabBtn} ${selectedTipo === 'GASTO CORRIENTE' ? styles.tabActive : ''}`}
              onClick={() => setSelectedTipo('GASTO CORRIENTE')}
            >
              Gasto Corriente
            </button>
          </div>
        </div>

        <div className={styles.selectorsGroup} style={{ display: 'flex', gap: '1rem', width: '100%', flexWrap: 'wrap' }}>
          {/* Municipio Selector */}
          <div className={styles.searchGroup} style={{ flex: '1', minWidth: '250px' }} ref={dropdownRef}>
            <div
              onClick={() => setShowMuniDropdown(!showMuniDropdown)}
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
                {selectedMunicipio === 'Todos' ? 'Todos los Municipios' : getMuniFullName(selectedMunicipio)}
              </span>
              {selectedMunicipio !== 'Todos' ? (
                <X 
                  size={16} 
                  color="#555" 
                  style={{ position: 'absolute', right: '35px', cursor: 'pointer' }} 
                  onClick={(e) => { 
                    e.stopPropagation(); 
                    handleMunicipioChange('Todos');
                    setSelectedPrg('Todos');
                    setSelectedProy('Todos');
                    setMuniSearchText('');
                  }}
                />
              ) : null}
              <ChevronDown size={18} color="#555" style={{ position: 'absolute', right: '12px', transform: showMuniDropdown ? 'rotate(180deg)' : 'rotate(0deg)', transition: 'transform 0.2s' }} />
            </div>

            {showMuniDropdown && (
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
                    value={muniSearchText}
                    onChange={(e) => setMuniSearchText(e.target.value)}
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
                      handleMunicipioChange('Todos');
                      setSelectedPrg('Todos');
                      setSelectedProy('Todos');
                      setShowMuniDropdown(false);
                      setMuniSearchText('');
                    }}
                    style={{
                      padding: '0.6rem 1rem',
                      fontSize: '0.85rem',
                      fontWeight: selectedMunicipio === 'Todos' ? '800' : '500',
                      color: selectedMunicipio === 'Todos' ? '#9c0720' : '#333',
                      background: selectedMunicipio === 'Todos' ? '#fce8e8' : 'transparent',
                      cursor: 'pointer',
                      transition: 'background 0.15s'
                    }}
                    onMouseEnter={(e) => {
                      if (selectedMunicipio !== 'Todos') e.currentTarget.style.background = '#f5f5f5';
                    }}
                    onMouseLeave={(e) => {
                      if (selectedMunicipio !== 'Todos') e.currentTarget.style.background = 'transparent';
                    }}
                  >
                    Todos los Municipios
                  </div>
                  {municipiosUnicos
                    .filter(mun => mun !== 'Todos')
                    .filter(mun => getMuniFullName(mun).toLowerCase().includes(muniSearchText.toLowerCase()))
                    .map((mun) => (
                      <div
                        key={mun}
                        onClick={() => {
                          handleMunicipioChange(mun);
                          setSelectedPrg('Todos');
                          setSelectedProy('Todos');
                          setShowMuniDropdown(false);
                          setMuniSearchText('');
                        }}
                        style={{
                          padding: '0.6rem 1rem',
                          fontSize: '0.85rem',
                          fontWeight: selectedMunicipio === mun ? '800' : '500',
                          color: selectedMunicipio === mun ? '#9c0720' : '#333',
                          background: selectedMunicipio === mun ? '#fce8e8' : 'transparent',
                          cursor: 'pointer',
                          transition: 'background 0.15s'
                        }}
                        onMouseEnter={(e) => {
                          if (selectedMunicipio !== mun) e.currentTarget.style.background = '#f5f5f5';
                        }}
                        onMouseLeave={(e) => {
                          if (selectedMunicipio !== mun) e.currentTarget.style.background = 'transparent';
                        }}
                      >
                        {getMuniFullName(mun)}
                      </div>
                    ))}
                  {municipiosUnicos.filter(mun => mun !== 'Todos' && getMuniFullName(mun).toLowerCase().includes(muniSearchText.toLowerCase())).length === 0 && (
                    <div style={{ padding: '1rem', textAlign: 'center', fontSize: '0.85rem', color: '#888' }}>
                      No se encontraron resultados
                    </div>
                  )}
                </div>
              </motion.div>
            )}
          </div>

          {/* PRG Selector */}
          <div className={styles.selectWrapper}>
              <Tag className={styles.selectIcon} size={16} style={{ position: 'absolute', left: '10px', top: '50%', transform: 'translateY(-50%)', zIndex: 10, color: '#6b7280', pointerEvents: 'none' }} />
              <select 
                value={selectedPrg} 
                onChange={(e) => {
                  setSelectedPrg(e.target.value);
                  setSelectedProy('Todos'); // reset proy on prg change
                }}
                className={styles.selectInput}
                disabled={selectedMunicipio === 'Todos'}
                style={{ opacity: selectedMunicipio === 'Todos' ? 0.5 : 1, cursor: selectedMunicipio === 'Todos' ? 'not-allowed' : 'pointer', width: '100%' }}
              >
                <option value="Todos">Todos los PRG</option>
                {prgUnicos.filter(p => p !== 'Todos').map(p => (
                  <option key={p} value={p}>Programa {p}</option>
                ))}
              </select>
            </div>

          {/* PROY Selector */}
          <div className={styles.selectWrapper}>
              <Tag className={styles.selectIcon} size={16} style={{ position: 'absolute', left: '10px', top: '50%', transform: 'translateY(-50%)', zIndex: 10, color: '#6b7280', pointerEvents: 'none' }} />
              <select 
                value={selectedProy} 
                onChange={(e) => setSelectedProy(e.target.value)}
                className={styles.selectInput}
                disabled={selectedMunicipio === 'Todos'}
                style={{ opacity: selectedMunicipio === 'Todos' ? 0.5 : 1, cursor: selectedMunicipio === 'Todos' ? 'not-allowed' : 'pointer', width: '100%' }}
              >
                <option value="Todos">Todos los PROY</option>
                {proyUnicos.filter(p => p !== 'Todos').map(p => (
                  <option key={p} value={p}>Proyecto {p}</option>
                ))}
              </select>
          </div>
        </div>
      </div>

      {/* Results Header */}
      <div className={styles.resultsHeader} style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexWrap: 'wrap', gap: '1rem' }}>
        <p className={styles.resultsCount}>
          Se encontraron <strong>{filteredData.filter(d => !d.is_header).length}</strong> resultados
        </p>
        <div style={{ fontSize: '1.2rem', fontWeight: '800', color: '#1e293b' }}>
          TOTAL GENERAL: <span style={{ color: '#9c0720' }}>{formatMoney(totalMonto)}</span>
        </div>
      </div>

      {/* Data Table */}
      <div className={styles.tableContainer}>
        {paginatedData.length > 0 ? (
          <div className={styles.tableResponsive}>
            <table className={styles.dataTable}>
              <thead>
                <tr>
                  <th width="3%">N°</th>
                  <th width="4%">PRG</th>
                  <th width="5%">PROY</th>
                  <th width="4%">ACT</th>
                  <th width="15%">Municipio</th>
                  <th width="15%">Tipo de Gasto</th>
                  <th width="40%">Descripción</th>
                  <th width="14%" style={{ textAlign: 'right' }}>Monto (Bs.)</th>
                </tr>
              </thead>
              <tbody>
                {paginatedData.map((item, index) => {
                  if (item.is_header) {
                    return (
                      <tr key={item.id} style={{ background: '#f8f9fa', borderBottom: '2px solid #eaeaea' }}>
                        <td colSpan="8" style={{ padding: '0.6rem 1rem', fontWeight: '800', color: '#9c0720', fontSize: '0.95rem', textAlign: 'left' }}>
                          {item.level === 'program' ? `📋 PROGRAMA ${item.prg}: ` : `📌 PROYECTO ${item.proyecto}: `} 
                          {item.descripcion}
                          <span style={{ float: 'right', color: '#1a1a2e', fontSize: '0.85rem' }}>
                            Subtotal: {new Intl.NumberFormat('es-BO', { style: 'currency', currency: 'BOB', maximumFractionDigits: 0 }).format(item.monto)}
                          </span>
                        </td>
                      </tr>
                    );
                  }
                  return (
                  <tr key={item.id}>
                    <td className={styles.textCenter}>{(currentPage - 1) * ITEMS_PER_PAGE + index + 1}</td>
                    <td className={styles.textCenter}>
                      <span className={styles.badgePrg}>{item.prg}</span>
                    </td>
                    <td className={styles.textCenter}>
                      <span className={styles.badgeProy}>{item.proyecto}</span>
                    </td>
                    <td className={styles.textCenter}>
                      <span className={styles.badgeAct}>{item.actividad}</span>
                    </td>
                    <td>
                      <span className={styles.badgeMunicipio}>{getMuniFullName(item.municipio)}</span>
                    </td>
                    <td>
                      <span className={`${styles.badge} ${item.tipo === 'INVERSION' ? styles.badgeInversion : styles.badgeGasto}`}>
                        {item.tipo}
                      </span>
                    </td>
                    <td className={styles.descCell}>{item.descripcion}</td>
                    <td className={styles.budgetCell}>{formatMoney(item.monto)}</td>
                  </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        ) : (
          <div className={styles.emptyState}>
            <div className={styles.emptyIcon}>🔍</div>
            <h3>No se encontraron proyectos</h3>
            <p>Intenta ajustar tus filtros de búsqueda.</p>
          </div>
        )}
      </div>

      {/* Pagination Controls */}
      {totalPages > 1 && (
        <div className={styles.pagination}>
          <button 
            className={styles.pageBtn} 
            disabled={currentPage === 1}
            onClick={() => setCurrentPage(prev => Math.max(prev - 1, 1))}
          >
            <ChevronLeft size={20} /> Anterior
          </button>
          <span className={styles.pageInfo}>
            Página <strong>{currentPage}</strong> de {totalPages}
          </span>
          <button 
            className={styles.pageBtn} 
            disabled={currentPage === totalPages}
            onClick={() => setCurrentPage(prev => Math.min(prev + 1, totalPages))}
          >
            Siguiente <ChevronRight size={20} />
          </button>
        </div>
      )}

    </div>
  );
}

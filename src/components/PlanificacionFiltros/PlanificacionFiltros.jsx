'use client';

import React, { useState, useMemo, useEffect } from 'react';
import { Search, MapPin, Tag, ChevronLeft, ChevronRight, Calculator } from 'lucide-react';
import planificacionData from '@/data/planificacion.json';
import styles from './PlanificacionFiltros.module.css';
import { getMuniFullName } from '@/utils/formatMuni';

const ITEMS_PER_PAGE = 10;

export default function PlanificacionFiltros({ globalMunicipio, setGlobalMunicipio }) {
  const [searchTerm, setSearchTerm] = useState('');
  const [showMuniDropdown, setShowMuniDropdown] = useState(false);
  const [muniSearchText, setMuniSearchText] = useState('');
  
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

  // Obtener PRG únicos
  const prgUnicos = useMemo(() => {
    const p = new Set(planificacionData.map(item => String(item.prg).replace(/\s/g, '')).filter(Boolean));
    const sorted = Array.from(p).sort((a,b) => parseInt(a) - parseInt(b));
    return ['Todos', ...sorted];
  }, []);

  // Obtener PROY únicos (dependiendo del PRG seleccionado o todos)
  const proyUnicos = useMemo(() => {
    const data = selectedPrg === 'Todos' ? planificacionData : planificacionData.filter(item => String(item.prg).replace(/\s/g, '') === selectedPrg);
    const p = new Set(data.map(item => String(item.proyecto).replace(/\s/g, '')).filter(Boolean));
    const sorted = Array.from(p).sort((a,b) => parseInt(a) - parseInt(b));
    return ['Todos', ...sorted];
  }, [selectedPrg]);

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
        
        <div style={{ display: 'flex', gap: '1rem', marginBottom: '1rem', flexWrap: 'wrap' }}>
          {/* Search Bar */}
          <div className={styles.searchGroup} style={{ flex: '1', minWidth: '300px', marginBottom: 0 }}>
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

        <div className={styles.selectorsGroup}>
          {/* Municipio Selector */}
          <div className={styles.selectWrapper} style={{ position: 'relative' }}>
            <MapPin className={styles.selectIcon} size={18} />
            
            <div 
              className={styles.selectInput} 
              style={{ cursor: 'pointer', display: 'flex', alignItems: 'center', justifyContent: 'space-between', background: '#fff', minHeight: '42px', paddingRight: '10px' }}
              onClick={() => setShowMuniDropdown(!showMuniDropdown)}
            >
              <span style={{ color: selectedMunicipio === 'Todos' ? '#6b7280' : '#1e293b' }}>
                {selectedMunicipio === 'Todos' ? 'Filtro por Municipio' : getMuniFullName(selectedMunicipio)}
              </span>
              <span style={{ fontSize: '0.8rem', color: '#9ca3af' }}>▼</span>
            </div>

            {selectedMunicipio !== 'Todos' && (
              <button 
                className={styles.clearBtn} 
                onClick={(e) => {
                  e.stopPropagation();
                  handleMunicipioChange('Todos');
                  setSelectedPrg('Todos');
                  setSelectedProy('Todos');
                  setMuniSearchText('');
                }}
                title="Limpiar municipio"
                style={{ position: 'absolute', right: '35px', top: '50%', transform: 'translateY(-50%)', background: 'transparent', border: 'none', cursor: 'pointer', color: '#ef4444', fontWeight: 'bold' }}
              >
                ✕
              </button>
            )}

            {showMuniDropdown && (
              <div style={{ position: 'absolute', top: '100%', left: 0, right: 0, background: '#fff', border: '1px solid #e5e7eb', borderRadius: '8px', marginTop: '4px', zIndex: 50, boxShadow: '0 10px 15px -3px rgba(0,0,0,0.1)', maxHeight: '300px', display: 'flex', flexDirection: 'column' }}>
                <div style={{ padding: '8px', borderBottom: '1px solid #e5e7eb' }}>
                  <input 
                    type="text" 
                    placeholder="Escribe para buscar..." 
                    value={muniSearchText}
                    onChange={(e) => setMuniSearchText(e.target.value)}
                    style={{ width: '100%', padding: '8px 12px', border: '1px solid #d1d5db', borderRadius: '6px', fontSize: '0.9rem', outline: 'none' }}
                    onClick={(e) => e.stopPropagation()}
                    autoFocus
                  />
                </div>
                <div style={{ overflowY: 'auto', flex: 1 }}>
                  <div 
                    onClick={() => {
                      handleMunicipioChange('Todos');
                      setSelectedPrg('Todos');
                      setSelectedProy('Todos');
                      setShowMuniDropdown(false);
                      setMuniSearchText('');
                    }}
                    style={{ padding: '10px 15px', cursor: 'pointer', background: selectedMunicipio === 'Todos' ? '#f3f4f6' : 'transparent', fontWeight: selectedMunicipio === 'Todos' ? 'bold' : 'normal', borderBottom: '1px solid #f3f4f6' }}
                  >
                    Todos los Municipios (Toda la Región)
                  </div>
                  {municipiosUnicos
                    .filter(mun => mun !== 'Todos')
                    .filter(mun => getMuniFullName(mun).toLowerCase().includes(muniSearchText.toLowerCase()))
                    .map(mun => (
                      <div 
                        key={mun}
                        onClick={() => {
                          handleMunicipioChange(mun);
                          setShowMuniDropdown(false);
                          setMuniSearchText('');
                        }}
                        style={{ padding: '10px 15px', cursor: 'pointer', background: selectedMunicipio === mun ? '#f3f4f6' : 'transparent', fontWeight: selectedMunicipio === mun ? 'bold' : 'normal', borderBottom: '1px solid #f3f4f6', fontSize: '0.95rem' }}
                      >
                        {getMuniFullName(mun)}
                      </div>
                  ))}
                  {municipiosUnicos.filter(mun => mun !== 'Todos' && getMuniFullName(mun).toLowerCase().includes(muniSearchText.toLowerCase())).length === 0 && (
                    <div style={{ padding: '15px', textAlign: 'center', color: '#6b7280', fontStyle: 'italic' }}>
                      No se encontraron resultados
                    </div>
                  )}
                </div>
              </div>
            )}
          </div>

          {/* PRG Selector */}
          <div className={styles.selectWrapper}>
            <Tag className={styles.selectIcon} size={18} />
            <select 
              value={selectedPrg} 
              onChange={(e) => {
                setSelectedPrg(e.target.value);
                setSelectedProy('Todos'); // reset proy on prg change
              }}
              className={styles.selectInput}
              disabled={selectedMunicipio === 'Todos'}
              style={{ opacity: selectedMunicipio === 'Todos' ? 0.5 : 1, cursor: selectedMunicipio === 'Todos' ? 'not-allowed' : 'pointer' }}
            >
              <option value="Todos">Todos los PRG</option>
              {prgUnicos.filter(p => p !== 'Todos').map(p => (
                <option key={p} value={p}>Programa {p}</option>
              ))}
            </select>
          </div>

          {/* PROY Selector */}
          <div className={styles.selectWrapper}>
            <Tag className={styles.selectIcon} size={18} />
            <select 
              value={selectedProy} 
              onChange={(e) => setSelectedProy(e.target.value)}
              className={styles.selectInput}
              disabled={selectedMunicipio === 'Todos'}
              style={{ opacity: selectedMunicipio === 'Todos' ? 0.5 : 1, cursor: selectedMunicipio === 'Todos' ? 'not-allowed' : 'pointer' }}
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

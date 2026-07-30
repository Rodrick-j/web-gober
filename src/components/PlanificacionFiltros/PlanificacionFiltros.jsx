'use client';

import React, { useState, useMemo, useEffect } from 'react';
import { Search, MapPin, Tag, ChevronLeft, ChevronRight, Calculator } from 'lucide-react';
import planificacionData from '@/data/planificacion.json';
import styles from './PlanificacionFiltros.module.css';

const ITEMS_PER_PAGE = 20;

export default function PlanificacionFiltros() {
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedMunicipio, setSelectedMunicipio] = useState('Todos');
  const [selectedTipo, setSelectedTipo] = useState('Todos');
  const [currentPage, setCurrentPage] = useState(1);
  const [isMounted, setIsMounted] = useState(false);

  useEffect(() => {
    setIsMounted(true);
  }, []);

  // Obtener municipios únicos
  const municipiosUnicos = useMemo(() => {
    const m = new Set(planificacionData.map(item => item.municipio));
    const sorted = Array.from(m).sort();
    return ['Todos', ...sorted];
  }, []);

  // Filtrado de datos
  const filteredData = useMemo(() => {
    return planificacionData.filter(item => {
      const matchSearch = item.descripcion.toLowerCase().includes(searchTerm.toLowerCase());
      const matchMunicipio = selectedMunicipio === 'Todos' || item.municipio === selectedMunicipio;
      const matchTipo = selectedTipo === 'Todos' || item.tipo === selectedTipo;
      
      return matchSearch && matchMunicipio && matchTipo;
    });
  }, [searchTerm, selectedMunicipio, selectedTipo]);

  // Calcular total de la búsqueda actual
  const totalMonto = useMemo(() => {
    return filteredData.reduce((sum, item) => {
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
  }, [searchTerm, selectedMunicipio, selectedTipo]);

  const formatMoney = (amount) => {
    if (!amount || amount === 0) return 'Sin presupuesto asignado';
    return new Intl.NumberFormat('es-BO', { style: 'currency', currency: 'BOB' }).format(amount);
  };

  if (!isMounted) return null;

  return (
    <div className={styles.container}>
      
      {/* Header Filters */}
      <div className={styles.filtersWrapper}>
        
        {/* Search Bar */}
        <div className={styles.searchGroup}>
          <Search className={styles.searchIcon} size={20} />
          <input 
            type="text" 
            placeholder="Buscar proyectos, gastos, obras..." 
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className={styles.searchInput}
          />
        </div>

        <div className={styles.selectorsGroup}>
          {/* Municipio Selector */}
          <div className={styles.selectWrapper}>
            <MapPin className={styles.selectIcon} size={18} />
            <select 
              value={selectedMunicipio} 
              onChange={(e) => setSelectedMunicipio(e.target.value)}
              className={styles.selectInput}
            >
              {municipiosUnicos.map(mun => (
                <option key={mun} value={mun}>{mun}</option>
              ))}
            </select>
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
      </div>

      {/* Results Header */}
      <div className={styles.resultsHeader}>
        <p className={styles.resultsCount}>
          Se encontraron <strong>{filteredData.length}</strong> resultados
        </p>
      </div>

      {/* Data Table */}
      <div className={styles.tableContainer}>
        {paginatedData.length > 0 ? (
          <div className={styles.tableResponsive}>
            <table className={styles.dataTable}>
              <thead>
                <tr>
                  <th width="5%">N°</th>
                  <th width="15%">Municipio</th>
                  <th width="15%">Tipo de Gasto</th>
                  <th width="50%">Descripción</th>
                  <th width="15%" style={{ textAlign: 'right' }}>Monto (Bs.)</th>
                </tr>
              </thead>
              <tbody>
                {paginatedData.map((item, index) => (
                  <tr key={item.id}>
                    <td className={styles.textCenter}>{(currentPage - 1) * ITEMS_PER_PAGE + index + 1}</td>
                    <td>
                      <span className={styles.badgeMunicipio}>{item.municipio}</span>
                    </td>
                    <td>
                      <span className={`${styles.badge} ${item.tipo === 'INVERSION' ? styles.badgeInversion : styles.badgeGasto}`}>
                        {item.tipo}
                      </span>
                    </td>
                    <td className={styles.descCell}>{item.descripcion}</td>
                    <td className={styles.budgetCell}>{formatMoney(item.monto)}</td>
                  </tr>
                ))}
              </tbody>
              <tfoot>
                <tr style={{ background: '#F9FAFB', borderTop: '2px solid #E5E7EB' }}>
                  <td colSpan="4" style={{ textAlign: 'right', fontWeight: '800', fontSize: '1.05rem', color: '#1e293b', padding: '1.2rem 1rem' }}>
                    TOTAL GENERAL:
                  </td>
                  <td className={styles.budgetCell} style={{ fontSize: '1.1rem', color: '#9c0720' }}>
                    {formatMoney(totalMonto)}
                  </td>
                </tr>
              </tfoot>
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

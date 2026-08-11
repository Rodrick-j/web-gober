'use client';
import React, { useState, useMemo, useEffect } from 'react';
import { Search, Building, Calendar, Filter, ChevronLeft, ChevronRight, Layers } from 'lucide-react';
import costosData from '@/data/costos_construccion.json';

export default function CostosConstruccion() {
  const [selectedYear, setSelectedYear] = useState('2026');
  const [selectedSemester, setSelectedSemester] = useState('1');
  const [selectedCategory, setSelectedCategory] = useState('ALL');
  const [searchQuery, setSearchQuery] = useState('');
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 10;
  
  const years = ['2026', '2025', '2024', '2023', '2022', '2021'];
  
  // Categorías inferidas por los primeros 2 dígitos del código
  const categories = {
    '15': 'Áridos y Piedras (Arena, Grava...)',
    '16': 'Aditivos y Pigmentos',
    '31': 'Maderas y Derivados',
    '35': 'Pinturas y Acabados',
    '36': 'Tuberías y Plásticos',
    '37': 'Vidrios y Sanitarios',
    '38': 'Herramientas Menores',
    '41': 'Aceros y Perfiles (Fierro, Alambre)',
    '42': 'Cubiertas y Ferretería (Calaminas)',
    '43': 'Bombas y Válvulas',
    '44': 'Equipos Eléctricos',
    '46': 'Material Eléctrico (Cables, Tomas)'
  };
  
  // All months in a year
  const allMonths = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];
  
  // Determine displayed months based on year and semester
  const displayMonths = useMemo(() => {
    if (selectedSemester === '1') {
      return allMonths.slice(0, 6);
    } else {
      // If it's 2026 and semester 2, there is no data in Excel, but just in case
      return selectedYear === '2026' ? [] : allMonths.slice(6, 12);
    }
  }, [selectedYear, selectedSemester]);

  const filteredData = useMemo(() => {
    return costosData.filter(item => {
      const matchesSearch = item.producto.toLowerCase().includes(searchQuery.toLowerCase());
      const hasDataForYear = item.precios[selectedYear] !== undefined;
      const prefix = item.codigo.toString().substring(0, 2);
      const matchesCategory = selectedCategory === 'ALL' || selectedCategory === prefix;
      
      return matchesSearch && hasDataForYear && matchesCategory;
    });
  }, [searchQuery, selectedYear, selectedCategory]);

  const totalPages = Math.ceil(filteredData.length / itemsPerPage);
  
  const paginatedData = useMemo(() => {
    const startIndex = (currentPage - 1) * itemsPerPage;
    return filteredData.slice(startIndex, startIndex + itemsPerPage);
  }, [filteredData, currentPage]);

  useEffect(() => {
    setCurrentPage(1);
  }, [searchQuery, selectedYear, selectedSemester, selectedCategory]);

  // If user selects 2026, force semester 1 since there's no data for semester 2
  useEffect(() => {
    if (selectedYear === '2026' && selectedSemester === '2') {
      setSelectedSemester('1');
    }
  }, [selectedYear]);

  return (
    <div style={{ background: '#fff', border: '1px solid #eaeaea', borderRadius: '12px', padding: '1.5rem', boxShadow: '0 4px 12px rgba(0,0,0,0.05)', marginTop: '2rem' }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: '1rem', marginBottom: '1.5rem' }}>
        <div style={{ background: '#ffefef', color: '#9c0720', padding: '0.5rem', borderRadius: '10px' }}>
          <Building size={20} />
        </div>
        <div>
          <h3 style={{ fontSize: '1.25rem', fontWeight: 'bold', color: '#1a1a2e', margin: '0 0 0.15rem 0' }}>Índice de Costos de Construcción</h3>
          <p style={{ color: '#666', margin: 0, fontSize: '0.8rem' }}>Precios promedio de materiales en Oruro (Bs).</p>
        </div>
      </div>

      <div style={{ display: 'flex', gap: '1rem', marginBottom: '1.5rem', flexWrap: 'wrap', alignItems: 'center', background: '#f8f9fa', padding: '0.75rem', borderRadius: '8px' }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', fontWeight: 'bold', color: '#1a1a2e', fontSize: '0.85rem' }}>
          <Filter size={16} /> Filtros:
        </div>
        
        <div style={{ flex: '1', minWidth: '180px', position: 'relative' }}>
          <Search size={16} color="#888" style={{ position: 'absolute', left: '10px', top: '50%', transform: 'translateY(-50%)' }} />
          <input 
            type="text" 
            placeholder="Buscar material..." 
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            style={{ width: '100%', padding: '0.5rem 1rem 0.5rem 2.2rem', borderRadius: '6px', border: '1px solid #ddd', fontSize: '0.85rem' }}
          />
        </div>

        <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
          <select 
            value={selectedCategory}
            onChange={(e) => setSelectedCategory(e.target.value)}
            style={{ padding: '0.5rem 0.75rem', borderRadius: '6px', border: '1px solid #ddd', fontSize: '0.85rem', fontWeight: '600', color: '#1a1a2e', background: '#fff', cursor: 'pointer', maxWidth: '200px', textOverflow: 'ellipsis' }}
          >
            <option value="ALL">Todas las Categorías</option>
            {Object.entries(categories).map(([val, label]) => (
              <option key={val} value={val}>{label}</option>
            ))}
          </select>
        </div>

        <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
          <Calendar size={16} color="#666" />
          <select 
            value={selectedYear}
            onChange={(e) => setSelectedYear(e.target.value)}
            style={{ padding: '0.5rem 0.75rem', borderRadius: '6px', border: '1px solid #ddd', fontSize: '0.85rem', fontWeight: '600', color: '#1a1a2e', background: '#fff', cursor: 'pointer' }}
          >
            {years.map(year => (
              <option key={year} value={year}>Año {year}</option>
            ))}
          </select>
        </div>

        <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
          <Layers size={16} color="#666" />
          <select 
            value={selectedSemester}
            onChange={(e) => setSelectedSemester(e.target.value)}
            style={{ padding: '0.5rem 0.75rem', borderRadius: '6px', border: '1px solid #ddd', fontSize: '0.85rem', fontWeight: '600', color: '#1a1a2e', background: '#fff', cursor: 'pointer' }}
          >
            <option value="1">1er Semestre (Ene-Jun)</option>
            {selectedYear !== '2026' && (
              <option value="2">2do Semestre (Jul-Dic)</option>
            )}
          </select>
        </div>
      </div>

      <div style={{ overflowX: 'auto', borderRadius: '8px', border: '1px solid #eaeaea', boxShadow: '0 2px 4px rgba(0,0,0,0.02)' }}>
        <table style={{ width: '100%', borderCollapse: 'collapse', textAlign: 'left', fontSize: '0.75rem' }}>
          <thead>
            <tr style={{ background: '#9c0720', color: '#ffffff' }}>
              <th style={{ padding: '0.5rem', fontWeight: 'bold', width: '120px', border: '1px solid #b81d36', borderLeft: 'none' }}>ID DEL PRODUCTO</th>
              <th style={{ padding: '0.5rem', fontWeight: 'bold', border: '1px solid #b81d36' }}>PRODUCTO</th>
              <th style={{ padding: '0.5rem', fontWeight: 'bold', width: '150px', border: '1px solid #b81d36' }}>UNIDAD</th>
              {displayMonths.map(m => (
                <th key={m} style={{ padding: '0.5rem', fontWeight: 'bold', textAlign: 'right', width: '60px', border: '1px solid #b81d36' }}>{m.toUpperCase()}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {paginatedData.length === 0 ? (
              <tr>
                <td colSpan={3 + displayMonths.length} style={{ padding: '2rem', textAlign: 'center', color: '#888', border: '1px solid #e2e8f0' }}>
                  No se encontraron materiales.
                </td>
              </tr>
            ) : (
              paginatedData.map((item, idx) => (
                <tr key={item.codigo} style={{ background: idx % 2 === 0 ? '#fff' : '#fafafa' }}>
                  <td style={{ padding: '0.4rem 0.5rem', color: '#64748b', border: '1px solid #e2e8f0', borderLeft: 'none' }}>{item.codigo}</td>
                  <td style={{ padding: '0.4rem 0.5rem', color: '#1e293b', fontWeight: '600', border: '1px solid #e2e8f0' }}>{item.producto}</td>
                  <td style={{ padding: '0.4rem 0.5rem', color: '#64748b', border: '1px solid #e2e8f0' }}>{item.unidad}</td>
                  {displayMonths.map(m => {
                    const price = item.precios[selectedYear][m];
                    const displayPrice = price !== null && price !== undefined 
                      ? parseFloat(price).toFixed(2) 
                      : '-';
                    return (
                      <td key={m} style={{ padding: '0.4rem 0.5rem', textAlign: 'right', color: displayPrice === '-' ? '#cbd5e1' : '#334155', fontWeight: '500', border: '1px solid #e2e8f0' }}>
                        {displayPrice}
                      </td>
                    );
                  })}
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>
      
      {totalPages > 1 && (
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginTop: '1rem', fontSize: '0.8rem', color: '#666' }}>
          <div>
            Mostrando {(currentPage - 1) * itemsPerPage + 1} - {Math.min(currentPage * itemsPerPage, filteredData.length)} de {filteredData.length} materiales
          </div>
          <div style={{ display: 'flex', gap: '0.5rem' }}>
            <button 
              onClick={() => setCurrentPage(p => Math.max(1, p - 1))}
              disabled={currentPage === 1}
              style={{ padding: '0.3rem 0.6rem', background: currentPage === 1 ? '#f1f5f9' : '#fff', border: '1px solid #cbd5e1', borderRadius: '4px', cursor: currentPage === 1 ? 'not-allowed' : 'pointer', display: 'flex', alignItems: 'center' }}
            >
              <ChevronLeft size={14} />
            </button>
            <button 
              onClick={() => setCurrentPage(p => Math.min(totalPages, p + 1))}
              disabled={currentPage === totalPages}
              style={{ padding: '0.3rem 0.6rem', background: currentPage === totalPages ? '#f1f5f9' : '#fff', border: '1px solid #cbd5e1', borderRadius: '4px', cursor: currentPage === totalPages ? 'not-allowed' : 'pointer', display: 'flex', alignItems: 'center' }}
            >
              <ChevronRight size={14} />
            </button>
          </div>
        </div>
      )}
    </div>
  );
}

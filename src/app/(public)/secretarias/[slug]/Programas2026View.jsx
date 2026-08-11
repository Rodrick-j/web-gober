import React, { useState, useMemo } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Search, Briefcase, Wallet, Target, ChevronDown } from 'lucide-react';
import programasData from './programasProyectos2026.json';

const formatCurrency = (value) => {
  return new Intl.NumberFormat('es-BO', { style: 'currency', currency: 'BOB', maximumFractionDigits: 0 }).format(value);
};

export default function Programas2026View() {
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedUnidad, setSelectedUnidad] = useState('');
  const [executionFilter, setExecutionFilter] = useState(''); // 'alta', 'media', 'baja'
  const [isDropdownOpen, setIsDropdownOpen] = useState(false);
  const [isExecDropdownOpen, setIsExecDropdownOpen] = useState(false);

  // Obtener unidades únicas
  const unidadesUnicas = useMemo(() => {
    const unidades = new Set(programasData.map(item => item.unidadEjecutora));
    return Array.from(unidades).sort();
  }, []);

  // Filtrar programas
  const programasFiltrados = useMemo(() => {
    return programasData.filter(prog => {
      const matchSearch = prog.programa.toLowerCase().includes(searchTerm.toLowerCase());
      const matchUnidad = selectedUnidad ? prog.unidadEjecutora === selectedUnidad : true;
      let matchExec = true;
      if (executionFilter === 'alta') matchExec = prog.porcentaje >= 50;
      else if (executionFilter === 'media') matchExec = prog.porcentaje >= 20 && prog.porcentaje < 50;
      else if (executionFilter === 'baja') matchExec = prog.porcentaje < 20;
      
      return matchSearch && matchUnidad && matchExec;
    });
  }, [searchTerm, selectedUnidad, executionFilter]);

  return (
    <div style={{ marginTop: '2rem' }}>
      <div style={{ marginBottom: '2rem', display: 'flex', flexDirection: 'column', gap: '1rem' }}>
        <h2 style={{ fontSize: '1.5rem', fontWeight: '800', color: '#1a1a2e', margin: 0, display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
          <Briefcase size={24} color="#9c0720" />
          Programas y Proyectos 2026
        </h2>
        <p style={{ color: '#666', margin: 0 }}>Filtre y visualice los programas y proyectos planificados para el año 2026 con su ejecución presupuestaria.</p>
      </div>

      {/* Filters (Excel style) */}
      <div style={{ display: 'flex', flexWrap: 'wrap', gap: '0.5rem', marginBottom: '1rem', background: '#f8f9fa', padding: '0.8rem', borderRadius: '4px', border: '1px solid #e2e8f0', alignItems: 'center' }}>
        
        <div style={{ flex: '1 1 200px', position: 'relative' }}>
          <Search size={14} color="#888" style={{ position: 'absolute', left: '10px', top: '50%', transform: 'translateY(-50%)' }} />
          <input
            type="text"
            placeholder="Buscar programa..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            style={{ width: '100%', padding: '0.4rem 0.5rem 0.4rem 2rem', borderRadius: '4px', border: '1px solid #cbd5e1', fontSize: '0.75rem', outline: 'none' }}
          />
        </div>

        <div style={{ flex: '1 1 200px' }}>
          <select
            value={selectedUnidad}
            onChange={(e) => setSelectedUnidad(e.target.value)}
            style={{ width: '100%', padding: '0.4rem 0.5rem', borderRadius: '4px', border: '1px solid #cbd5e1', fontSize: '0.75rem', outline: 'none', background: '#fff' }}
          >
            <option value="">Todas las Secretarías</option>
            {unidadesUnicas.map((unidad, idx) => (
              <option key={idx} value={unidad}>{unidad}</option>
            ))}
          </select>
        </div>

        <div style={{ flex: '1 1 150px' }}>
          <select
            value={executionFilter}
            onChange={(e) => setExecutionFilter(e.target.value)}
            style={{ width: '100%', padding: '0.4rem 0.5rem', borderRadius: '4px', border: '1px solid #cbd5e1', fontSize: '0.75rem', outline: 'none', background: '#fff' }}
          >
            <option value="">Cualquier Ejecución</option>
            <option value="alta">Alta (≥50%)</option>
            <option value="media">Media (20-50%)</option>
            <option value="baja">Baja (&lt;20%)</option>
          </select>
        </div>
      </div>

      {/* Excel-like Table */}
      <div style={{ overflowX: 'auto', background: '#fff', border: '1px solid #e2e8f0', borderRadius: '4px' }}>
        <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: '0.75rem', textAlign: 'left' }}>
          <thead>
            <tr style={{ background: '#f1f5f9', borderBottom: '2px solid #cbd5e1' }}>
              <th style={{ padding: '0.6rem 0.8rem', borderRight: '1px solid #e2e8f0', fontWeight: 'bold', color: '#475569', width: '50px' }}>N°</th>
              <th style={{ padding: '0.6rem 0.8rem', borderRight: '1px solid #e2e8f0', fontWeight: 'bold', color: '#475569', width: '25%' }}>Unidad Ejecutora</th>
              <th style={{ padding: '0.6rem 0.8rem', borderRight: '1px solid #e2e8f0', fontWeight: 'bold', color: '#475569' }}>Nombre del Programa</th>
              <th style={{ padding: '0.6rem 0.8rem', borderRight: '1px solid #e2e8f0', fontWeight: 'bold', color: '#475569', textAlign: 'right', width: '120px' }}>Presup. Vigente</th>
              <th style={{ padding: '0.6rem 0.8rem', borderRight: '1px solid #e2e8f0', fontWeight: 'bold', color: '#475569', textAlign: 'right', width: '120px' }}>Ejecución</th>
              <th style={{ padding: '0.6rem 0.8rem', fontWeight: 'bold', color: '#475569', textAlign: 'center', width: '80px' }}>% Avance</th>
            </tr>
          </thead>
          <tbody>
            {programasFiltrados.length > 0 ? (
              programasFiltrados.map((prog, idx) => (
                <tr key={prog.id} style={{ borderBottom: '1px solid #e2e8f0', background: idx % 2 === 0 ? '#fff' : '#fafafa' }}>
                  <td style={{ padding: '0.5rem 0.8rem', borderRight: '1px solid #e2e8f0', color: '#64748b' }}>{idx + 1}</td>
                  <td style={{ padding: '0.5rem 0.8rem', borderRight: '1px solid #e2e8f0', fontWeight: '600', color: '#9c0720' }}>{prog.unidadEjecutora}</td>
                  <td style={{ padding: '0.5rem 0.8rem', borderRight: '1px solid #e2e8f0', color: '#1e293b' }}>{prog.programa}</td>
                  <td style={{ padding: '0.5rem 0.8rem', borderRight: '1px solid #e2e8f0', textAlign: 'right', color: '#334155', fontFamily: 'monospace', fontSize: '0.8rem' }}>{formatCurrency(prog.presupuestoVigente)}</td>
                  <td style={{ padding: '0.5rem 0.8rem', borderRight: '1px solid #e2e8f0', textAlign: 'right', color: '#059669', fontFamily: 'monospace', fontSize: '0.8rem' }}>{formatCurrency(prog.ejecucion)}</td>
                  <td style={{ padding: '0.5rem 0.8rem', textAlign: 'center', fontWeight: 'bold', color: prog.porcentaje >= 50 ? '#059669' : prog.porcentaje >= 20 ? '#d97706' : '#dc2626' }}>
                    {prog.porcentaje.toFixed(2)}%
                  </td>
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan="6" style={{ padding: '2rem', textAlign: 'center', color: '#94a3b8' }}>
                  No se encontraron programas con los filtros seleccionados.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}

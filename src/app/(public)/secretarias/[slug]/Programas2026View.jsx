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

      <div style={{ display: 'flex', flexWrap: 'wrap', gap: '1rem', marginBottom: '2rem', background: '#fff', padding: '1rem', borderRadius: '12px', boxShadow: '0 2px 10px rgba(0,0,0,0.02)', border: '1px solid #f0f0f0' }}>
        
        {/* Buscador */}
        <div style={{ flex: '1 1 220px', position: 'relative' }}>
          <Search size={16} color="#888" style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)' }} />
          <input
            type="text"
            placeholder="Buscar programa o proyecto..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            style={{ width: '100%', padding: '0.6rem 1rem 0.6rem 2.2rem', borderRadius: '8px', border: '1px solid #e2e8f0', fontSize: '0.8rem', outline: 'none' }}
          />
        </div>

        {/* Dropdown Unidad Ejecutora */}
        <div style={{ flex: '1 1 220px', position: 'relative' }}>
          <div
            onClick={() => { setIsDropdownOpen(!isDropdownOpen); setIsExecDropdownOpen(false); }}
            style={{
              padding: '0.6rem 1rem', borderRadius: '8px', border: '1px solid #e2e8f0', background: '#fff',
              display: 'flex', justifyContent: 'space-between', alignItems: 'center', cursor: 'pointer', fontSize: '0.8rem', color: selectedUnidad ? '#1a1a2e' : '#888'
            }}
          >
            <span style={{ overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
              {selectedUnidad || 'Todas las Secretarías'}
            </span>
            <ChevronDown size={16} color="#555" style={{ transform: isDropdownOpen ? 'rotate(180deg)' : 'none', transition: 'transform 0.2s' }} />
          </div>

          <AnimatePresence>
            {isDropdownOpen && (
              <motion.div
                initial={{ opacity: 0, y: -5 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -5 }}
                style={{
                  position: 'absolute', top: '100%', left: 0, right: 0, marginTop: '0.5rem',
                  background: '#fff', borderRadius: '8px', border: '1px solid #e2e8f0',
                  boxShadow: '0 4px 20px rgba(0,0,0,0.1)', zIndex: 10, maxHeight: '250px', overflowY: 'auto'
                }}
              >
                <div
                  onClick={() => { setSelectedUnidad(''); setIsDropdownOpen(false); }}
                  style={{ padding: '0.6rem 1rem', cursor: 'pointer', borderBottom: '1px solid #f0f0f0', fontSize: '0.8rem', fontWeight: !selectedUnidad ? 'bold' : 'normal', color: !selectedUnidad ? '#9c0720' : '#333', background: !selectedUnidad ? '#f8f9fa' : '#fff' }}
                >
                  Todas las Secretarías
                </div>
                {unidadesUnicas.map((unidad, idx) => (
                  <div
                    key={idx}
                    onClick={() => { setSelectedUnidad(unidad); setIsDropdownOpen(false); }}
                    style={{
                      padding: '0.6rem 1rem', cursor: 'pointer', borderBottom: '1px solid #f0f0f0', fontSize: '0.8rem',
                      fontWeight: selectedUnidad === unidad ? 'bold' : 'normal', color: selectedUnidad === unidad ? '#9c0720' : '#333',
                      background: selectedUnidad === unidad ? '#f8f9fa' : '#fff'
                    }}
                  >
                    {unidad}
                  </div>
                ))}
              </motion.div>
            )}
          </AnimatePresence>
        </div>

        {/* Dropdown Estado de Ejecución */}
        <div style={{ flex: '1 1 200px', position: 'relative' }}>
          <div
            onClick={() => { setIsExecDropdownOpen(!isExecDropdownOpen); setIsDropdownOpen(false); }}
            style={{
              padding: '0.6rem 1rem', borderRadius: '8px', border: '1px solid #e2e8f0', background: '#fff',
              display: 'flex', justifyContent: 'space-between', alignItems: 'center', cursor: 'pointer', fontSize: '0.8rem', color: executionFilter ? '#1a1a2e' : '#888'
            }}
          >
            <span>
              {executionFilter === 'alta' ? 'Ejecución Alta (≥50%)' :
               executionFilter === 'media' ? 'Ejecución Media (20-50%)' :
               executionFilter === 'baja' ? 'Ejecución Baja (<20%)' : 'Cualquier Ejecución'}
            </span>
            <ChevronDown size={16} color="#555" style={{ transform: isExecDropdownOpen ? 'rotate(180deg)' : 'none', transition: 'transform 0.2s' }} />
          </div>

          <AnimatePresence>
            {isExecDropdownOpen && (
              <motion.div
                initial={{ opacity: 0, y: -5 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -5 }}
                style={{
                  position: 'absolute', top: '100%', left: 0, right: 0, marginTop: '0.5rem',
                  background: '#fff', borderRadius: '8px', border: '1px solid #e2e8f0',
                  boxShadow: '0 4px 20px rgba(0,0,0,0.1)', zIndex: 10
                }}
              >
                {[
                  { id: '', label: 'Cualquier Ejecución' },
                  { id: 'alta', label: 'Ejecución Alta (≥50%)' },
                  { id: 'media', label: 'Ejecución Media (20-50%)' },
                  { id: 'baja', label: 'Ejecución Baja (<20%)' }
                ].map(opt => (
                  <div
                    key={opt.id}
                    onClick={() => { setExecutionFilter(opt.id); setIsExecDropdownOpen(false); }}
                    style={{ padding: '0.6rem 1rem', cursor: 'pointer', borderBottom: '1px solid #f0f0f0', fontSize: '0.8rem', fontWeight: executionFilter === opt.id ? 'bold' : 'normal', color: executionFilter === opt.id ? '#9c0720' : '#333', background: executionFilter === opt.id ? '#f8f9fa' : '#fff' }}
                  >
                    {opt.label}
                  </div>
                ))}
              </motion.div>
            )}
          </AnimatePresence>
        </div>
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(280px, 1fr))', gap: '1rem' }}>
        <AnimatePresence>
          {programasFiltrados.map((prog) => (
            <motion.div
              key={prog.id}
              layout
              initial={{ opacity: 0, scale: 0.95 }}
              animate={{ opacity: 1, scale: 1 }}
              exit={{ opacity: 0, scale: 0.95 }}
              transition={{ duration: 0.2 }}
              style={{
                background: '#fff', borderRadius: '10px', border: '1px solid #e2e8f0', padding: '1rem',
                boxShadow: '0 4px 15px rgba(0,0,0,0.02)', display: 'flex', flexDirection: 'column', gap: '0.8rem'
              }}
            >
              <div>
                <div style={{ fontSize: '0.65rem', fontWeight: 'bold', color: '#9c0720', textTransform: 'uppercase', marginBottom: '0.3rem', letterSpacing: '0.5px' }}>
                  {prog.unidadEjecutora}
                </div>
                <h3 style={{ fontSize: '0.9rem', fontWeight: 'bold', color: '#1a1a2e', margin: 0, lineHeight: '1.2' }}>
                  {prog.programa}
                </h3>
              </div>

              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '0.8rem', marginTop: 'auto', background: '#f8f9fa', padding: '0.8rem', borderRadius: '6px' }}>
                <div>
                  <div style={{ fontSize: '0.65rem', color: '#64748b', marginBottom: '0.2rem', display: 'flex', alignItems: 'center', gap: '0.3rem' }}>
                    <Wallet size={10} /> Vigente
                  </div>
                  <div style={{ fontSize: '0.85rem', fontWeight: 'bold', color: '#334155' }}>
                    {formatCurrency(prog.presupuestoVigente)}
                  </div>
                </div>
                <div>
                  <div style={{ fontSize: '0.65rem', color: '#64748b', marginBottom: '0.2rem', display: 'flex', alignItems: 'center', gap: '0.3rem' }}>
                    <Target size={10} /> Ejecutado
                  </div>
                  <div style={{ fontSize: '0.85rem', fontWeight: 'bold', color: '#059669' }}>
                    {formatCurrency(prog.ejecucion)}
                  </div>
                </div>
              </div>

              <div>
                <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '0.4rem' }}>
                  <span style={{ fontSize: '0.7rem', fontWeight: '600', color: '#64748b' }}>Avance de Ejecución</span>
                  <span style={{ fontSize: '0.75rem', fontWeight: '800', color: '#9c0720' }}>{prog.porcentaje.toFixed(2)}%</span>
                </div>
                <div style={{ width: '100%', height: '8px', background: '#e2e8f0', borderRadius: '4px', overflow: 'hidden' }}>
                  <motion.div
                    initial={{ width: 0 }}
                    animate={{ width: `${Math.min(100, Math.max(0, prog.porcentaje))}%` }}
                    transition={{ duration: 1, ease: 'easeOut' }}
                    style={{ height: '100%', background: 'linear-gradient(90deg, #9c0720 0%, #d41133 100%)', borderRadius: '4px' }}
                  />
                </div>
              </div>
            </motion.div>
          ))}
        </AnimatePresence>
        
        {programasFiltrados.length === 0 && (
          <div style={{ gridColumn: '1 / -1', textAlign: 'center', padding: '4rem', background: '#fff', borderRadius: '12px', border: '1px dashed #cbd5e1' }}>
            <Briefcase size={40} color="#cbd5e1" style={{ margin: '0 auto 1rem auto' }} />
            <h3 style={{ fontSize: '1.2rem', color: '#475569', margin: 0 }}>No se encontraron programas</h3>
            <p style={{ color: '#94a3b8', margin: '0.5rem 0 0 0' }}>Intente cambiar los filtros de búsqueda.</p>
          </div>
        )}
      </div>
    </div>
  );
}

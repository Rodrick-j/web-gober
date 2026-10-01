'use client';

import { useState, useEffect, useMemo } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Search, MapPin, Briefcase, BarChart3, Users, Building2, Phone, UserCheck, Activity } from 'lucide-react';
import { ResponsivePie } from '@nivo/pie';
import { createClient } from '@/lib/supabase/client';

const CustomDropdown = ({ options, value, onChange, placeholder, colorAcento, withSearch = false }) => {
  const [isOpen, setIsOpen] = useState(false);
  const [search, setSearch] = useState('');

  const filtered = options.filter(opt => opt.toLowerCase().includes(search.toLowerCase()));

  return (
    <div style={{ position: 'relative', width: '100%' }}>
      <div 
        onClick={() => setIsOpen(!isOpen)}
        style={{ width: '100%', padding: '0.75rem 1rem', borderRadius: '8px', border: isOpen ? `2px solid ${colorAcento}` : '2px solid #f1f5f9', fontSize: '0.95rem', background: '#fff', cursor: 'pointer', display: 'flex', justifyContent: 'space-between', alignItems: 'center', transition: 'border-color 0.2s' }}
      >
        <span style={{ color: value === 'TODOS' ? '#666' : '#111', whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis', fontWeight: value === 'TODOS' ? 'normal' : '600' }}>
          {value === 'TODOS' ? placeholder : value}
        </span>
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#666" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" style={{ transform: isOpen ? 'rotate(180deg)' : 'none', transition: 'transform 0.2s' }}><path d="m6 9 6 6 6-6"/></svg>
      </div>
      
      {isOpen && (
        <>
          <div style={{ position: 'fixed', inset: 0, zIndex: 10 }} onClick={() => setIsOpen(false)} />
          <div style={{ position: 'absolute', top: '100%', left: 0, right: 0, marginTop: '4px', background: '#fff', borderRadius: '8px', boxShadow: '0 10px 25px rgba(0,0,0,0.1)', border: '1px solid #eaeaea', zIndex: 20, maxHeight: '300px', display: 'flex', flexDirection: 'column' }}>
            {withSearch && (
              <div style={{ padding: '8px', borderBottom: '1px solid #eaeaea' }}>
                <input 
                  type="text" 
                  autoFocus
                  placeholder="Buscar..."
                  value={search}
                  onChange={e => setSearch(e.target.value)}
                  style={{ width: '100%', padding: '0.5rem', borderRadius: '4px', border: '1px solid #ddd', outline: 'none', fontSize: '0.9rem' }}
                />
              </div>
            )}
            <div style={{ overflowY: 'auto', padding: '4px 0' }}>
              {filtered.length === 0 ? (
                <div style={{ padding: '0.75rem 1rem', color: '#888', fontSize: '0.9rem' }}>No hay resultados</div>
              ) : (
                filtered.map(opt => (
                  <div 
                    key={opt}
                    onClick={() => { onChange(opt); setIsOpen(false); setSearch(''); }}
                    style={{ padding: '0.75rem 1rem', cursor: 'pointer', fontSize: '0.95rem', color: value === opt ? colorAcento : '#333', background: value === opt ? `${colorAcento}10` : 'transparent', fontWeight: value === opt ? 'bold' : 'normal' }}
                    onMouseEnter={e => e.currentTarget.style.background = value === opt ? `${colorAcento}10` : '#f8fafc'}
                    onMouseLeave={e => e.currentTarget.style.background = value === opt ? `${colorAcento}10` : 'transparent'}
                  >
                    {opt === 'TODOS' ? placeholder : opt}
                  </div>
                ))
              )}
            </div>
          </div>
        </>
      )}
    </div>
  );
};

export default function ProductivoSection({ secretariaId, colorAcento = '#9c0720' }) {
  const [activeTab, setActiveTab] = useState('estadisticas'); // 'estadisticas' o 'directorio'
  const [empresas, setEmpresas] = useState([]);
  const [loading, setLoading] = useState(true);
  const [isDrawing, setIsDrawing] = useState(false);
  const [isMobile, setIsMobile] = useState(false);
  
  // Filtros globales
  const [searchQuery, setSearchQuery] = useState('');
  const [filtroRubro, setFiltroRubro] = useState('TODOS');
  const [filtroMunicipio, setFiltroMunicipio] = useState('TODOS');
  
  // Paginación
  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 10;

  useEffect(() => {
    setCurrentPage(1);
  }, [searchQuery, filtroRubro, filtroMunicipio]);

  const supabase = useMemo(() => createClient(), []);

  useEffect(() => {
    const checkMobile = () => setIsMobile(window.innerWidth <= 768);
    checkMobile();
    window.addEventListener('resize', checkMobile);
    return () => window.removeEventListener('resize', checkMobile);
  }, []);

  useEffect(() => {
    async function fetchData() {
      setLoading(true);
      const { data: dataEmpresas } = await supabase.from('v_emprendedores').select('*');
        
      if (dataEmpresas && dataEmpresas.length > 0) {
        setEmpresas(dataEmpresas);
      } else {
        setEmpresas([
          { id_empresa: 1, nombre_empresa: 'Textiles Oruro', rubro: 'TEXTIL', municipio: 'ORURO', nombre_completo: 'Juan Perez', celular: '71234567' },
          { id_empresa: 2, nombre_empresa: 'Comercial Huanuni', rubro: 'COMERCIO', municipio: 'HUANUNI', nombre_completo: 'Maria Lopez', celular: '61234567' },
          { id_empresa: 3, nombre_empresa: 'Artesanías Andinas', rubro: 'ARTESANIAS', municipio: 'PAZÑA', nombre_completo: 'Carlos Mamani', celular: '77654321' }
        ]);
      }
      setLoading(false);
      setTimeout(() => setIsDrawing(true), 500);
    }
    fetchData();
  }, [supabase]);

  const rubrosUnicos = ['TODOS', ...new Set(empresas.map(e => e.rubro).filter(Boolean))];
  const municipiosUnicos = ['TODOS', ...new Set(empresas.map(e => e.municipio).filter(Boolean))];

  const empresasFiltradas = empresas.filter(emp => {
    const matchSearch = emp.nombre_empresa?.toLowerCase().includes(searchQuery.toLowerCase()) || 
                        emp.nombre_completo?.toLowerCase().includes(searchQuery.toLowerCase());
    const matchRubro = filtroRubro === 'TODOS' || emp.rubro === filtroRubro;
    const matchMunicipio = filtroMunicipio === 'TODOS' || emp.municipio === filtroMunicipio;
    return matchSearch && matchRubro && matchMunicipio;
  });

  const totalPages = Math.ceil(empresasFiltradas.length / itemsPerPage);
  const paginatedEmpresas = empresasFiltradas.slice((currentPage - 1) * itemsPerPage, currentPage * itemsPerPage);

  const dataMunicipio = useMemo(() => {
    const counts = {};
    empresasFiltradas.forEach(e => {
      const m = e.municipio || 'Sin Registro';
      counts[m] = (counts[m] || 0) + 1;
    });
    return Object.entries(counts)
      .map(([id, value]) => ({ id, label: id, value }))
      .sort((a,b) => b.value - a.value);
  }, [empresasFiltradas]);

  const dataRubro = useMemo(() => {
    const counts = {};
    empresasFiltradas.forEach(e => {
      const r = e.rubro || 'Sin Registro';
      counts[r] = (counts[r] || 0) + 1;
    });
    return Object.entries(counts)
      .map(([id, value]) => ({ id, label: id, value }))
      .sort((a,b) => b.value - a.value);
  }, [empresasFiltradas]);

  const customColors = [colorAcento, '#eab308', '#3b82f6', '#10b981', '#6366f1', '#f97316', '#8b5cf6', '#14b8a6', '#f43f5e'];

  const filterSectionJSX = (
    <div style={{ background: '#fff', padding: '1.5rem', borderRadius: '16px', boxShadow: '0 4px 20px rgba(0,0,0,0.04)', marginBottom: '2rem', border: '1px solid #eaeaea' }}>
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))', gap: '1rem' }}>
        <div style={{ position: 'relative' }}>
          <Search size={18} color="#888" style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)' }} />
          <input 
            type="text" 
            placeholder="Buscar empresa o titular..." 
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            style={{ width: '100%', padding: '0.75rem 1rem 0.75rem 2.5rem', borderRadius: '8px', border: '2px solid #f1f5f9', fontSize: '0.95rem', outline: 'none', transition: 'border-color 0.2s' }}
            onFocus={(e) => e.target.style.borderColor = colorAcento}
            onBlur={(e) => e.target.style.borderColor = '#f1f5f9'}
          />
        </div>
        
        <CustomDropdown 
          options={rubrosUnicos} 
          value={filtroRubro} 
          onChange={setFiltroRubro} 
          placeholder="Todos los Rubros" 
          colorAcento={colorAcento} 
          withSearch={rubrosUnicos.length > 5} 
        />

        <CustomDropdown 
          options={municipiosUnicos} 
          value={filtroMunicipio} 
          onChange={setFiltroMunicipio} 
          placeholder="Todos los Municipios" 
          colorAcento={colorAcento} 
          withSearch={true} 
        />
      </div>
    </div>
  );

  return (
    <div style={{ marginTop: '1rem' }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '1.5rem', flexWrap: 'wrap', gap: '1rem' }}>
        <div>
          <h2 style={{ fontSize: 'clamp(1.5rem, 4vw, 2.2rem)', color: '#1a1a2e', fontWeight: '900', margin: 0, display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
            <Briefcase color={colorAcento} size={32} />
            UP Reactiva TIC
          </h2>
          <p style={{ color: '#666', marginTop: '0.5rem', fontSize: '1.1rem' }}>
            Directorio Oficial de Emprendedores y Empresas del Departamento de Oruro
          </p>
        </div>
      </div>

      <div style={{ display: 'flex', gap: '0.5rem', marginBottom: '2rem', background: '#fff', padding: '0.5rem', borderRadius: '12px', boxShadow: '0 2px 10px rgba(0,0,0,0.05)', width: 'fit-content', border: `1px solid ${colorAcento}30` }}>
        <button
          onClick={() => setActiveTab('estadisticas')}
          style={{
            background: activeTab === 'estadisticas' ? colorAcento : `${colorAcento}10`,
            color: activeTab === 'estadisticas' ? '#fff' : colorAcento,
            border: 'none', padding: '0.75rem 1.5rem', borderRadius: '8px', fontWeight: 'bold', fontSize: '0.95rem',
            cursor: 'pointer', transition: 'all 0.3s ease', display: 'flex', alignItems: 'center', gap: '0.5rem',
            boxShadow: activeTab === 'estadisticas' ? `0 4px 12px ${colorAcento}40` : 'none'
          }}
        >
          <BarChart3 size={18} /> Resumen y Estadísticas
        </button>
        <button
          onClick={() => setActiveTab('directorio')}
          style={{
            background: activeTab === 'directorio' ? colorAcento : `${colorAcento}10`,
            color: activeTab === 'directorio' ? '#fff' : colorAcento,
            border: 'none', padding: '0.75rem 1.5rem', borderRadius: '8px', fontWeight: 'bold', fontSize: '0.95rem',
            cursor: 'pointer', transition: 'all 0.3s ease', display: 'flex', alignItems: 'center', gap: '0.5rem',
            boxShadow: activeTab === 'directorio' ? `0 4px 12px ${colorAcento}40` : 'none'
          }}
        >
          <Users size={18} /> Directorio de Empresas
        </button>
      </div>

      {/* Los filtros globales se aplican a ambas pestañas */}
      {filterSectionJSX}

      <AnimatePresence mode="wait">
        {activeTab === 'estadisticas' && (
          <motion.div key="stats" initial={{ opacity: 0, y: 10 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: -10 }}>
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(250px, 1fr))', gap: '1.5rem', marginBottom: '2rem' }}>
              <div style={{ background: 'linear-gradient(135deg, #1e293b 0%, #0f172a 100%)', padding: '1.5rem', borderRadius: '16px', color: '#fff', boxShadow: '0 10px 25px rgba(0,0,0,0.1)' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '1rem', opacity: 0.8, marginBottom: '0.5rem' }}>
                  <Building2 size={24} /> <span>Empresas (Filtradas)</span>
                </div>
                <div style={{ fontSize: '3rem', fontWeight: '900' }}>{empresasFiltradas.length}</div>
              </div>
              <div style={{ background: `linear-gradient(135deg, ${colorAcento} 0%, #7a0518 100%)`, padding: '1.5rem', borderRadius: '16px', color: '#fff', boxShadow: `0 10px 25px ${colorAcento}30` }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '1rem', opacity: 0.8, marginBottom: '0.5rem' }}>
                  <MapPin size={24} /> <span>Municipios Alcanzados</span>
                </div>
                <div style={{ fontSize: '3rem', fontWeight: '900' }}>{dataMunicipio.length}</div>
              </div>
            </div>
            
            <div style={{ display: 'grid', gridTemplateColumns: isMobile ? '1fr' : '1fr 1fr', gap: '1.5rem' }}>
              
              {/* Torta de Municipios */}
              <div style={{ background: '#fff', padding: '1.5rem', borderRadius: '16px', border: '1px solid #eaeaea', boxShadow: '0 4px 15px rgba(0,0,0,0.02)', height: '400px', display: 'flex', flexDirection: 'column' }}>
                <h3 style={{ margin: '0 0 1rem 0', display: 'flex', alignItems: 'center', gap: '0.5rem', color: '#1a1a2e', fontSize: '1.1rem' }}>
                  <MapPin color={colorAcento} size={18} /> Distribución por Municipio
                </h3>
                <div style={{ flex: 1, position: 'relative' }}>
                  {dataMunicipio.length > 0 ? (
                    <ResponsivePie
                      data={dataMunicipio.map(d => ({ ...d, value: isDrawing ? d.value : 0.001 }))}
                      margin={{ top: 20, right: 20, bottom: 20, left: 20 }}
                      innerRadius={isDrawing ? 0.6 : 0.1}
                      padAngle={2}
                      cornerRadius={5}
                      activeOuterRadiusOffset={8}
                      colors={customColors}
                      borderWidth={1}
                      borderColor={{ from: 'color', modifiers: [ [ 'darker', 0.2 ] ] }}
                      enableArcLinkLabels={!isMobile}
                      arcLinkLabelsSkipAngle={10}
                      arcLinkLabelsTextColor="#333333"
                      arcLinkLabelsThickness={2}
                      arcLinkLabelsColor={{ from: 'color' }}
                      enableArcLabels={true}
                      arcLabelsSkipAngle={10}
                      arcLabelsTextColor="#ffffff"
                      theme={{
                        text: { fontWeight: 600 },
                        tooltip: { container: { background: '#ffffff', color: '#1a1a2e', borderRadius: '8px', boxShadow: '0 4px 12px rgba(0,0,0,0.1)' } },
                      }}
                      tooltip={({ datum: { id, value, color } }) => (
                        <div style={{ padding: '8px 12px', background: '#fff', border: '1px solid #eee', borderRadius: '8px', display: 'flex', alignItems: 'center', gap: '8px', boxShadow: '0 4px 12px rgba(0,0,0,0.1)' }}>
                          <span style={{ width: 12, height: 12, background: color, borderRadius: '50%' }}></span>
                          <strong style={{ color: '#1a1a2e' }}>{id}:</strong> <span>{value} empresas</span>
                        </div>
                      )}
                    />
                  ) : (
                    <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100%', color: '#888' }}>Sin datos</div>
                  )}
                  {/* Centro de la dona */}
                  <div style={{ position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)', textAlign: 'center', pointerEvents: 'none' }}>
                    <p style={{ margin: 0, color: '#666', fontSize: '0.8rem', fontWeight: '600' }}>Total</p>
                    <p style={{ margin: 0, color: '#1a1a2e', fontSize: '1.5rem', fontWeight: '900' }}>{empresasFiltradas.length}</p>
                  </div>
                </div>
              </div>

              {/* Torta de Rubros */}
              <div style={{ background: '#fff', padding: '1.5rem', borderRadius: '16px', border: '1px solid #eaeaea', boxShadow: '0 4px 15px rgba(0,0,0,0.02)', height: '400px', display: 'flex', flexDirection: 'column' }}>
                <h3 style={{ margin: '0 0 1rem 0', display: 'flex', alignItems: 'center', gap: '0.5rem', color: '#1a1a2e', fontSize: '1.1rem' }}>
                  <Activity color={colorAcento} size={18} /> Distribución por Rubro
                </h3>
                <div style={{ flex: 1, position: 'relative' }}>
                  {dataRubro.length > 0 ? (
                    <ResponsivePie
                      data={dataRubro.map(d => ({ ...d, value: isDrawing ? d.value : 0.001 }))}
                      margin={{ top: 20, right: 20, bottom: 20, left: 20 }}
                      innerRadius={isDrawing ? 0.6 : 0.1}
                      padAngle={2}
                      cornerRadius={5}
                      activeOuterRadiusOffset={8}
                      colors={customColors}
                      borderWidth={1}
                      borderColor={{ from: 'color', modifiers: [ [ 'darker', 0.2 ] ] }}
                      enableArcLinkLabels={!isMobile}
                      arcLinkLabelsSkipAngle={10}
                      arcLinkLabelsTextColor="#333333"
                      arcLinkLabelsThickness={2}
                      arcLinkLabelsColor={{ from: 'color' }}
                      enableArcLabels={true}
                      arcLabelsSkipAngle={10}
                      arcLabelsTextColor="#ffffff"
                      theme={{
                        text: { fontWeight: 600 },
                        tooltip: { container: { background: '#ffffff', color: '#1a1a2e', borderRadius: '8px', boxShadow: '0 4px 12px rgba(0,0,0,0.1)' } },
                      }}
                      tooltip={({ datum: { id, value, color } }) => (
                        <div style={{ padding: '8px 12px', background: '#fff', border: '1px solid #eee', borderRadius: '8px', display: 'flex', alignItems: 'center', gap: '8px', boxShadow: '0 4px 12px rgba(0,0,0,0.1)' }}>
                          <span style={{ width: 12, height: 12, background: color, borderRadius: '50%' }}></span>
                          <strong style={{ color: '#1a1a2e' }}>{id}:</strong> <span>{value} empresas</span>
                        </div>
                      )}
                    />
                  ) : (
                    <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100%', color: '#888' }}>Sin datos</div>
                  )}
                  {/* Centro de la dona */}
                  <div style={{ position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)', textAlign: 'center', pointerEvents: 'none' }}>
                    <p style={{ margin: 0, color: '#666', fontSize: '0.8rem', fontWeight: '600' }}>Total</p>
                    <p style={{ margin: 0, color: '#1a1a2e', fontSize: '1.5rem', fontWeight: '900' }}>{empresasFiltradas.length}</p>
                  </div>
                </div>
              </div>

            </div>
          </motion.div>
        )}

        {activeTab === 'directorio' && (
          <motion.div key="dir" initial={{ opacity: 0, y: 10 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: -10 }}>
            {/* Lista de Empresas */}
            {/* Lista de Empresas - Formato Tabla */}
            <div style={{ width: '100%', overflowX: 'auto', background: '#fff', borderRadius: '16px', border: `1px solid ${colorAcento}30`, boxShadow: `0 4px 15px ${colorAcento}15` }}>
              {loading ? (
                <p style={{ textAlign: 'center', padding: '3rem', color: '#888' }}>Cargando directorio de empresas...</p>
              ) : empresasFiltradas.length === 0 ? (
                <p style={{ textAlign: 'center', padding: '3rem', color: '#888' }}>No se encontraron empresas con estos filtros.</p>
              ) : (
                <>
                  <table style={{ width: '100%', borderCollapse: 'collapse', minWidth: '800px' }}>
                    <thead>
                      <tr style={{ background: colorAcento, color: '#ffffff', textAlign: 'left' }}>
                        <th style={{ padding: '1rem 1.5rem', fontWeight: '700', fontSize: '0.9rem', width: '25%', borderTopLeftRadius: '16px' }}>Empresa</th>
                        <th style={{ padding: '1rem 1.5rem', fontWeight: '700', fontSize: '0.9rem', width: '20%' }}>Titular</th>
                        <th style={{ padding: '1rem 1.5rem', fontWeight: '700', fontSize: '0.9rem', width: '15%' }}>Rubro</th>
                        <th style={{ padding: '1rem 1.5rem', fontWeight: '700', fontSize: '0.9rem', width: '25%' }}>Ubicación (Municipio)</th>
                        <th style={{ padding: '1rem 1.5rem', fontWeight: '700', fontSize: '0.9rem', width: '15%', borderTopRightRadius: '16px' }}>Contacto</th>
                      </tr>
                    </thead>
                    <tbody>
                      {paginatedEmpresas.map((emp, index) => (
                        <tr 
                          key={emp.id_empresa} 
                          style={{ 
                            borderBottom: '1px solid #f1f5f9',
                            transition: 'background-color 0.2s ease',
                            background: index % 2 === 0 ? '#ffffff' : `${colorAcento}08`
                          }}
                          onMouseEnter={(e) => e.currentTarget.style.backgroundColor = `${colorAcento}15`}
                          onMouseLeave={(e) => e.currentTarget.style.backgroundColor = index % 2 === 0 ? '#ffffff' : `${colorAcento}08`}
                        >
                          <td style={{ padding: '1rem 1.5rem' }}>
                            <span style={{ fontWeight: '800', color: colorAcento, display: 'block', fontSize: '1rem' }}>{emp.nombre_empresa}</span>
                          </td>
                          <td style={{ padding: '1rem 1.5rem', color: '#475569', fontSize: '0.95rem' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                              <UserCheck size={16} color="#64748b" />
                              {emp.nombre_completo}
                            </div>
                          </td>
                          <td style={{ padding: '1rem 1.5rem' }}>
                            <span style={{ background: `${colorAcento}15`, color: colorAcento, padding: '0.25rem 0.75rem', borderRadius: '20px', fontSize: '0.75rem', fontWeight: 'bold', whiteSpace: 'nowrap' }}>
                              {emp.rubro || 'General'}
                            </span>
                          </td>
                          <td style={{ padding: '1rem 1.5rem', color: '#475569', fontSize: '0.95rem' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                              <MapPin size={16} color="#64748b" style={{ flexShrink: 0 }} />
                              <span>{emp.municipio} {emp.zona ? `- ${emp.zona}` : ''}</span>
                            </div>
                          </td>
                          <td style={{ padding: '1rem 1.5rem', color: '#475569', fontSize: '0.95rem' }}>
                            {emp.celular ? (
                              <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                                <Phone size={16} color="#64748b" />
                                {emp.celular}
                              </div>
                            ) : (
                              <span style={{ color: '#94a3b8', fontStyle: 'italic' }}>No registrado</span>
                            )}
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                  
                  {/* Paginación */}
                  {totalPages > 1 && (
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', padding: '1rem 1.5rem', borderTop: '1px solid #eaeaea', background: '#fff', borderBottomLeftRadius: '16px', borderBottomRightRadius: '16px' }}>
                      <span style={{ color: '#64748b', fontSize: '0.9rem' }}>
                        Mostrando {(currentPage - 1) * itemsPerPage + 1} a {Math.min(currentPage * itemsPerPage, empresasFiltradas.length)} de {empresasFiltradas.length} empresas
                      </span>
                      <div style={{ display: 'flex', gap: '0.5rem' }}>
                        <button 
                          onClick={() => setCurrentPage(prev => Math.max(prev - 1, 1))}
                          disabled={currentPage === 1}
                          style={{
                            padding: '0.5rem 1rem', borderRadius: '8px', border: '1px solid #e2e8f0', background: currentPage === 1 ? '#f8fafc' : '#fff', color: currentPage === 1 ? '#94a3b8' : colorAcento, fontWeight: 'bold', cursor: currentPage === 1 ? 'not-allowed' : 'pointer'
                          }}
                        >
                          Anterior
                        </button>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '0.25rem' }}>
                          {[...Array(totalPages)].map((_, i) => {
                            const page = i + 1;
                            if (page === 1 || page === totalPages || (page >= currentPage - 1 && page <= currentPage + 1)) {
                              return (
                                <button
                                  key={page}
                                  onClick={() => setCurrentPage(page)}
                                  style={{
                                    width: '32px', height: '32px', display: 'flex', alignItems: 'center', justifyContent: 'center', borderRadius: '8px', border: 'none',
                                    background: currentPage === page ? colorAcento : 'transparent',
                                    color: currentPage === page ? '#fff' : '#64748b',
                                    fontWeight: currentPage === page ? 'bold' : 'normal',
                                    cursor: 'pointer'
                                  }}
                                >
                                  {page}
                                </button>
                              );
                            }
                            if (page === currentPage - 2 || page === currentPage + 2) return <span key={page} style={{ color: '#94a3b8' }}>...</span>;
                            return null;
                          })}
                        </div>
                        <button 
                          onClick={() => setCurrentPage(prev => Math.min(prev + 1, totalPages))}
                          disabled={currentPage === totalPages}
                          style={{
                            padding: '0.5rem 1rem', borderRadius: '8px', border: '1px solid #e2e8f0', background: currentPage === totalPages ? '#f8fafc' : '#fff', color: currentPage === totalPages ? '#94a3b8' : colorAcento, fontWeight: 'bold', cursor: currentPage === totalPages ? 'not-allowed' : 'pointer'
                          }}
                        >
                          Siguiente
                        </button>
                      </div>
                    </div>
                  )}
                </>
              )}
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}

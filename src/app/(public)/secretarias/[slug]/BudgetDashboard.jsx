'use client';

import { useState, useEffect, useMemo, useRef } from 'react';
import { motion } from 'framer-motion';
import { ResponsivePie } from '@nivo/pie';
import { ResponsiveBar } from '@nivo/bar';
import { Wallet, PieChart, BarChart2, TrendingUp, Building2, Shield, Activity, Map, Users, MapPin, ChevronDown, Search } from 'lucide-react';
import GeoportalPoa from './GeoportalPoa';
import { municipalitiesData, municipalitiesList } from './municipalitiesData';
import budgetsData from './municipalitiesBudgets.json';

const formatCurrency = (value) => {
  return new Intl.NumberFormat('es-BO', { style: 'currency', currency: 'BOB', maximumFractionDigits: 0 }).format(value);
};

export default function BudgetDashboard({ globalMunicipio, setGlobalMunicipio }) {
  const [activeView, setActiveView] = useState('programas');
  const [localMuni, setLocalMuni] = useState('corque');
  const selectedMuni = globalMunicipio || localMuni;
  const setSelectedMuni = setGlobalMunicipio || setLocalMuni;
  const [isMobile, setIsMobile] = useState(false);
  const [isDrawing, setIsDrawing] = useState(true);

  const [isDropdownOpen, setIsDropdownOpen] = useState(false);
  const [searchTerm, setSearchTerm] = useState('');
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

  useEffect(() => {
    const checkMobile = () => setIsMobile(window.innerWidth <= 768);
    checkMobile();
    window.addEventListener('resize', checkMobile);
    return () => window.removeEventListener('resize', checkMobile);
  }, []);

  useEffect(() => {
    const interval = setInterval(() => {
      setIsDrawing(false);
      setTimeout(() => {
        setIsDrawing(true);
      }, 1000);
    }, 120000);
    return () => clearInterval(interval);
  }, []);

  const currentMuni = (selectedMuni && selectedMuni.toLowerCase() !== 'todos') ? selectedMuni.toLowerCase() : 'corque';
  
  const currentData = useMemo(() => {
    const rawRows = budgetsData[currentMuni] || [];
    if (!rawRows || rawRows.length === 0) {
      return municipalitiesData[currentMuni] || municipalitiesData['corque'];
    }

    let totalBudget = 0;
    const groupsSum = {
      'Grupo 1': { total: 0, desc: 'Servicios Personales', color: 'hsl(348, 70%, 55%)' },
      'Grupo 2': { total: 0, desc: 'Servicios No Personales', color: 'hsl(348, 70%, 45%)' },
      'Grupo 3': { total: 0, desc: 'Materiales y Suministros', color: 'hsl(348, 70%, 35%)' },
      'Grupo 4': { total: 0, desc: 'Activos Reales', color: 'hsl(348, 70%, 15%)' },
      'Grupo 5': { total: 0, desc: 'Activos Financieros', color: 'hsl(145, 63%, 42%)' },
      'Grupo 6': { total: 0, desc: 'Deudas', color: 'hsl(0, 0%, 50%)' },
      'Grupo 7': { total: 0, desc: 'Transferencias', color: 'hsl(348, 70%, 25%)' },
      'Grupo 8': { total: 0, desc: 'Impuestos y Otros', color: 'hsl(283, 39%, 53%)' },
      'Grupo 9': { total: 0, desc: 'Otros Gastos', color: 'hsl(204, 70%, 50%)' }
    };

    const programColors = [
      "hsl(204, 70%, 50%)", "hsl(43, 74%, 49%)", "hsl(348, 70%, 50%)", "hsl(180, 25%, 25%)",
      "hsl(145, 63%, 42%)", "hsl(14, 89%, 55%)", "hsl(283, 39%, 53%)", "hsl(348, 70%, 40%)",
      "hsl(220, 50%, 50%)", "hsl(30, 80%, 50%)"
    ];

    const programasList = [];

    rawRows.forEach(row => {
      if (row.proyecto === '0 000') {
        const val = parseFloat((row.total || '0').toString().replace(/,/g, '')) || 0;
        totalBudget += val;
        
        groupsSum['Grupo 1'].total += parseFloat((row.grupo1 || '0').toString().replace(/,/g, '')) || 0;
        groupsSum['Grupo 2'].total += parseFloat((row.grupo2 || '0').toString().replace(/,/g, '')) || 0;
        groupsSum['Grupo 3'].total += parseFloat((row.grupo3 || '0').toString().replace(/,/g, '')) || 0;
        groupsSum['Grupo 4'].total += parseFloat((row.grupo4 || '0').toString().replace(/,/g, '')) || 0;
        groupsSum['Grupo 5'].total += parseFloat((row.grupo5 || '0').toString().replace(/,/g, '')) || 0;
        groupsSum['Grupo 6'].total += parseFloat((row.grupo6 || '0').toString().replace(/,/g, '')) || 0;
        groupsSum['Grupo 7'].total += parseFloat((row.grupo7 || '0').toString().replace(/,/g, '')) || 0;
        groupsSum['Grupo 8'].total += parseFloat((row.grupo8 || '0').toString().replace(/,/g, '')) || 0;
        groupsSum['Grupo 9'].total += parseFloat((row.grupo9 || '0').toString().replace(/,/g, '')) || 0;

        if (val > 0) {
          programasList.push({
            id: `PRG ${row.prg}`,
            label: row.description,
            value: val
          });
        }
      }
    });

    const gruposGasto = Object.keys(groupsSum)
      .filter(k => groupsSum[k].total > 0)
      .map(k => ({
        grupo: k,
        descripcion: groupsSum[k].desc,
        value: groupsSum[k].total,
        color: groupsSum[k].color
      }))
      .sort((a, b) => b.value - a.value);

    const programas = programasList
      .sort((a, b) => b.value - a.value)
      .slice(0, 10) // Show top 10 for pie chart legibility
      .map((p, idx) => ({
        ...p,
        label: p.label,
        color: programColors[idx % programColors.length],
        icon: null
      }));

    return {
      ...(municipalitiesData[currentMuni] || municipalitiesData['corque']),
      totalPresupuesto: totalBudget,
      programas,
      gruposGasto
    };
  }, [currentMuni]);

  return (
    <div className="budget-card-container">
      <style jsx>{`
        .budget-card-container {
          background: #ffffff;
          border: 1px solid #eaeaea;
          border-radius: 20px;
          padding: 2.5rem;
          color: #1a1a2e;
          box-shadow: 0 10px 35px rgba(0,0,0,0.05);
          margin-top: 1.5rem;
          position: relative;
          overflow: hidden;
        }
        .budget-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin-bottom: 2.5rem;
          flex-wrap: wrap;
          gap: 1.5rem;
          border-bottom: 1px solid #f0f0f0;
          padding-bottom: 1.75rem;
        }
        .budget-total-card {
          background: #fdf8f8;
          border: 1px solid #fce8e8;
          padding: 1.25rem 2rem;
          border-radius: 16px;
          display: flex;
          align-items: center;
          gap: 1.25rem;
          box-shadow: 0 4px 15px rgba(156,7,32,0.06);
        }
        .budget-tabs-bar {
          display: flex;
          gap: 0.5rem;
          margin-bottom: 2rem;
          background: #f5f5f5;
          padding: 0.4rem;
          border-radius: 12px;
          width: fit-content;
          border: 1px solid #eaeaea;
          flex-wrap: wrap;
        }
        .budget-tab-btn {
          border: none;
          padding: 0.7rem 1.5rem;
          border-radius: 8px;
          font-weight: 700;
          cursor: pointer;
          transition: all 0.3s;
          display: flex;
          align-items: center;
          gap: 0.5rem;
          font-size: 0.9rem;
        }

        @media (max-width: 768px) {
          .budget-card-container {
            padding: 1rem !important;
            margin-top: 0.75rem !important;
            border-radius: 14px !important;
          }
          .budget-header {
            margin-bottom: 1.25rem !important;
            padding-bottom: 1rem !important;
            gap: 1rem !important;
            flex-direction: column;
            align-items: stretch;
          }
          .budget-total-card {
            padding: 1rem !important;
            gap: 0.85rem !important;
          }
          .budget-tabs-bar {
            width: 100% !important;
            display: grid !important;
            grid-template-columns: repeat(3, 1fr) !important;
            gap: 0.25rem !important;
            margin-bottom: 1.25rem !important;
          }
          .budget-tab-btn {
            padding: 0.5rem 0.3rem !important;
            font-size: 0.74rem !important;
            justify-content: center;
            gap: 0.3rem !important;
          }
        }
      `}</style>

      {/* Fondo decorativo institucional muy sutil */}
      <div style={{ position: 'absolute', top: '-15%', right: '-5%', width: '300px', height: '300px', background: 'radial-gradient(circle, rgba(156,7,32,0.04) 0%, rgba(0,0,0,0) 70%)', borderRadius: '50%', pointerEvents: 'none', zIndex: 0 }} />

      <div style={{ position: 'relative', zIndex: 1 }}>
        {/* Guardar el dropdown en una variable para reusarlo */}
        {(() => {
          const municipioSelectorJSX = (
            <div style={{ position: 'relative', flex: '1 1 200px', minWidth: '220px', maxWidth: '300px' }} ref={dropdownRef}>
              <div
                onClick={() => setIsDropdownOpen(!isDropdownOpen)}
                style={{
                  width: '100%',
                  background: '#f8f9fa',
                  color: '#1a1a2e',
                  border: '1px solid #dcdcdc',
                  borderRadius: '8px',
                  padding: '0.5rem 2rem 0.5rem 1.8rem',
                  fontSize: '0.85rem',
                  fontWeight: '700',
                  cursor: 'pointer',
                  boxShadow: '0 1px 3px rgba(0,0,0,0.03)',
                  transition: 'all 0.2s',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'space-between',
                  position: 'relative',
                  height: '100%'
                }}
              >
                <MapPin size={15} color="#9c0720" style={{ position: 'absolute', left: '10px' }} />
                <span style={{ overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
                  {municipalitiesList.find(m => m.id === selectedMuni)?.entidad || 'Seleccionar Municipio'}
                </span>
                <ChevronDown size={16} color="#555" style={{ position: 'absolute', right: '10px', transform: isDropdownOpen ? 'rotate(180deg)' : 'rotate(0deg)', transition: 'transform 0.2s' }} />
              </div>

              {isDropdownOpen && (
                <motion.div
                  initial={{ opacity: 0, y: -5 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -5 }}
                  transition={{ duration: 0.15 }}
                  style={{
                    position: 'absolute',
                    top: '100%',
                    left: 0,
                    right: 0,
                    marginTop: '0.3rem',
                    background: '#ffffff',
                    border: '1px solid #eaeaea',
                    borderRadius: '8px',
                    boxShadow: '0 10px 30px rgba(0,0,0,0.1)',
                    zIndex: 9999,
                    overflow: 'hidden'
                  }}
                >
                  <div style={{ padding: '0.5rem', borderBottom: '1px solid #f0f0f0', display: 'flex', alignItems: 'center', gap: '0.5rem', background: '#fcfcfc' }}>
                    <Search size={14} color="#888" />
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
                        fontSize: '0.8rem',
                        color: '#333'
                      }}
                      autoFocus
                    />
                  </div>
                  <div style={{ maxHeight: '200px', overflowY: 'auto' }}>
                    {municipalitiesList
                      .filter(m => m.entidad.toLowerCase().includes(searchTerm.toLowerCase()))
                      .map((muni) => (
                        <div
                          key={muni.id}
                          onClick={() => {
                            setSelectedMuni(muni.id);
                            setIsDropdownOpen(false);
                            setSearchTerm('');
                          }}
                          style={{
                            padding: '0.5rem 1rem',
                            fontSize: '0.8rem',
                            fontWeight: selectedMuni === muni.id ? '800' : '500',
                            color: selectedMuni === muni.id ? '#9c0720' : '#333',
                            background: selectedMuni === muni.id ? '#fce8e8' : 'transparent',
                            cursor: 'pointer',
                            transition: 'background 0.15s'
                          }}
                          onMouseEnter={(e) => {
                            if (selectedMuni !== muni.id) e.currentTarget.style.background = '#f5f5f5';
                          }}
                          onMouseLeave={(e) => {
                            if (selectedMuni !== muni.id) e.currentTarget.style.background = 'transparent';
                          }}
                        >
                          {muni.entidad}
                        </div>
                      ))}
                  </div>
                </motion.div>
              )}
            </div>
          );

          return (
            <>
              <header className="budget-header">
          <div>
            <h3 style={{ fontSize: '1.7rem', fontWeight: '900', margin: 0, color: '#9c0720', letterSpacing: '-0.5px' }}>
              Gestión Presupuestaria e Inversión Municipal
            </h3>
          </div>
          <div className="budget-total-card">
            <div style={{ background: 'rgba(156,7,32,0.12)', padding: '0.8rem', borderRadius: '12px', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
              <Wallet color="#9c0720" size={26} />
            </div>
            <div>
              <p style={{ color: '#666', fontSize: '0.78rem', margin: 0, fontWeight: '700', letterSpacing: '0.5px' }}>PRESUPUESTO TOTAL (BOB)</p>
              <h4 style={{ fontSize: '1.6rem', fontWeight: '900', margin: '0.2rem 0 0 0', color: '#9c0720' }}>{formatCurrency(currentData.totalPresupuesto)}</h4>
            </div>
          </div>
        </header>

        {/* View Toggle */}
        <div className="budget-tabs-bar" style={{ display: 'flex', justifyContent: 'space-between', width: '100%', flexWrap: 'wrap', alignItems: 'center' }}>
          <div style={{ display: 'flex', gap: '0.5rem', flexWrap: 'wrap' }}>
            <button 
              onClick={() => setActiveView('programas')}
              className="budget-tab-btn"
              style={{ 
                background: activeView === 'programas' ? 'linear-gradient(135deg, #9c0720 0%, #7a0518 100%)' : 'transparent', 
                color: activeView === 'programas' ? '#fff' : '#555',
                boxShadow: activeView === 'programas' ? '0 4px 12px rgba(156,7,32,0.25)' : 'none'
              }}
            >
              <PieChart size={16} /> Categoría Programática
            </button>
            <button 
              onClick={() => setActiveView('gastos')}
              className="budget-tab-btn"
              style={{ 
                background: activeView === 'gastos' ? 'linear-gradient(135deg, #9c0720 0%, #7a0518 100%)' : 'transparent', 
                color: activeView === 'gastos' ? '#fff' : '#555',
                boxShadow: activeView === 'gastos' ? '0 4px 12px rgba(156,7,32,0.25)' : 'none'
              }}
            >
              <BarChart2 size={16} /> Grupo de Gasto
            </button>
            <button 
              onClick={() => setActiveView('mapa')}
              className="budget-tab-btn"
              style={{ 
                background: activeView === 'mapa' ? 'linear-gradient(135deg, #9c0720 0%, #7a0518 100%)' : 'transparent', 
                color: activeView === 'mapa' ? '#fff' : '#555',
                boxShadow: activeView === 'mapa' ? '0 4px 12px rgba(156,7,32,0.25)' : 'none'
              }}
            >
              <MapPin size={16} /> Mapas POA 2025
            </button>
          </div>
          {municipioSelectorJSX}
        </div>

        {/* Charts or Geoportal Container */}
        {activeView === 'mapa' ? (
          <GeoportalPoa currentData={currentData} />
        ) : (
          <div style={{ display: 'grid', gridTemplateColumns: isMobile ? '1fr' : '1.7fr 1fr', gap: '1.5rem', minHeight: isMobile ? '340px' : '450px' }}>
            {/* Main Chart */}
            {/* Main Chart Card */}
            {/* Main Chart Card */}
            <div style={{ background: '#fafbfc', border: '1px solid #eaeaea', borderRadius: '16px', padding: isMobile ? '1rem 0.5rem' : '1.5rem', height: isMobile ? 'auto' : '450px', position: 'relative', boxShadow: 'inset 0 2px 4px rgba(0,0,0,0.01)' }}>
              <div style={{ height: isMobile ? '270px' : '450px', position: 'relative' }}>
                {activeView === 'programas' ? (
                  <ResponsivePie
                    data={currentData.programas.map(item => ({
                      ...item,
                      value: isDrawing ? item.value : 0.001
                    }))}
                    startAngle={isDrawing ? -90 : 90}
                    endAngle={isDrawing ? 270 : 90.1}
                    animate={true}
                    motionConfig={{ mass: 3, tension: 22, friction: 24 }}
                    margin={isMobile ? { top: 15, right: 65, bottom: 15, left: 65 } : { top: 25, right: 80, bottom: 25, left: 80 }}
                    innerRadius={isDrawing ? (isMobile ? 0.54 : 0.64) : 0.1}
                    padAngle={isDrawing ? 2 : 0}
                    cornerRadius={isDrawing ? 7 : 0}
                    activeOuterRadiusOffset={10}
                    colors={{ datum: 'data.color' }}
                    borderWidth={1}
                    borderColor={{ from: 'color', modifiers: [ [ 'darker', 0.2 ] ] }}
                    enableArcLinkLabels={true}
                    arcLinkLabelsSkipAngle={isMobile ? 12 : 10}
                    arcLinkLabelsDiagonalLength={isMobile ? 8 : 16}
                    arcLinkLabelsStraightLength={isMobile ? 8 : 18}
                    arcLinkLabelsTextOffset={isMobile ? 3 : 6}
                    arcLinkLabelsTextColor="#1a1a2e"
                    arcLinkLabelsThickness={isMobile ? 1.5 : 2}
                    arcLinkLabelsColor={{ from: 'color' }}
                    enableArcLabels={true}
                    arcLabelsSkipAngle={10}
                    arcLabelsTextColor="#ffffff"
                    theme={{
                      text: { fontSize: isMobile ? 10 : 12, fontWeight: 700, fontFamily: "'Inter', sans-serif" },
                      tooltip: { container: { background: '#ffffff', color: '#1a1a2e', fontSize: '14px', borderRadius: '8px', boxShadow: '0 10px 25px rgba(0,0,0,0.12)', border: '1px solid #eaeaea' } },
                    }}
                    valueFormat={(value) => `${((value / currentData.totalPresupuesto) * 100).toFixed(1)}%`}
                    tooltip={({ datum: { id, value, color } }) => (
                      <div style={{
                        background: 'rgba(255, 255, 255, 0.98)',
                        border: '1.5px solid #eaeaea',
                        borderRadius: '10px',
                        boxShadow: '0 12px 30px rgba(0,0,0,0.25)',
                        padding: '12px 16px',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '12px',
                        zIndex: 99999,
                        position: 'relative',
                        backdropFilter: 'blur(10px)',
                        minWidth: '200px'
                      }}>
                        <div style={{ width: '14px', height: '14px', background: color, borderRadius: '50%', boxShadow: `0 0 6px ${color}` }} />
                        <div style={{ textAlign: 'left', lineHeight: '1.3', width: '100%' }}>
                          <strong style={{ fontSize: '1.05rem', color: '#1a1a2e', display: 'block', marginBottom: '4px' }}>{id}</strong>
                          <div style={{ display: 'flex', justifyContent: 'space-between', gap: '15px', borderTop: '1px solid #eee', paddingTop: '4px' }}>
                            <span style={{ color: '#1a1a2e', fontWeight: '800' }}>{formatCurrency(value)}</span>
                            <strong style={{ color: '#9c0720', fontWeight: '900' }}>{((value / currentData.totalPresupuesto) * 100).toFixed(1)}%</strong>
                          </div>
                        </div>
                      </div>
                    )}
                  />
                ) : (
                  <ResponsiveBar
                    data={currentData.gruposGasto.map(item => ({
                      ...item,
                      value: isDrawing ? item.value : 0
                    }))}
                    animate={true}
                    motionConfig={{ mass: 3, tension: 22, friction: 24 }}
                    keys={['value']}
                    indexBy="grupo"
                    margin={isMobile ? { top: 20, right: 15, bottom: 45, left: 65 } : { top: 30, right: 20, bottom: 50, left: 90 }}
                    padding={0.4}
                    layout="horizontal"
                    valueScale={{ type: 'linear' }}
                    indexScale={{ type: 'band', round: true }}
                    colors={{ datum: 'data.color' }}
                    borderRadius={6}
                    borderColor={{ from: 'color', modifiers: [ [ 'darker', 1.6 ] ] }}
                    axisTop={null}
                    axisRight={null}
                    axisBottom={{
                      tickSize: 5, tickPadding: 5, tickRotation: 0,
                      legend: 'Monto (BOB)', legendPosition: 'middle', legendOffset: 40,
                      format: (value) => `${(value / 1000000).toFixed(1)}M`,
                      tickValues: 4
                    }}
                    axisLeft={{
                      tickSize: 5, tickPadding: 5, tickRotation: 0,
                    }}
                    theme={{
                      labels: { text: { fontSize: 11, fontWeight: 700, fill: '#ffffff', textShadow: '1px 1px 3px rgba(0,0,0,0.8)' } },
                      axis: { ticks: { text: { fill: '#555', fontSize: isMobile ? 11 : 13, fontWeight: '600' } }, legend: { text: { fill: '#333', fontSize: 14, fontWeight: '700' } } },
                      grid: { line: { stroke: '#eaeaea', strokeWidth: 1, strokeDasharray: '4 4' } },
                      tooltip: { container: { background: '#ffffff', color: '#1a1a2e', fontSize: '14px', borderRadius: '8px', boxShadow: '0 10px 25px rgba(0,0,0,0.12)', border: '1px solid #eaeaea' } },
                    }}
                    enableGridX={true}
                    enableGridY={false}
                    labelSkipWidth={0}
                    labelSkipHeight={0}
                    labelTextColor="#ffffff"
                    label={d => {
                      const pct = (d.value / currentData.totalPresupuesto) * 100;
                      // Push tiny labels to the right using non-breaking spaces so they don't overlap the Y-axis text
                      if (pct < 3) return `\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0\u00A0${pct.toFixed(1)}%`;
                      return `${pct.toFixed(1)}%`;
                    }}
                    tooltip={({ id, value, color, indexValue, data }) => (
                      <div style={{
                        background: 'rgba(255, 255, 255, 0.98)',
                        border: '1.5px solid #eaeaea',
                        borderRadius: '10px',
                        boxShadow: '0 12px 30px rgba(0,0,0,0.25)',
                        padding: '12px 16px',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '12px',
                        zIndex: 99999,
                        position: 'relative',
                        backdropFilter: 'blur(10px)',
                        minWidth: '220px'
                      }}>
                        <div style={{ width: '14px', height: '14px', background: color, borderRadius: '50%', boxShadow: `0 0 6px ${color}` }} />
                        <div style={{ textAlign: 'left', lineHeight: '1.3', width: '100%' }}>
                          <strong style={{ fontSize: '1.05rem', color: '#1a1a2e', display: 'block' }}>{indexValue}</strong>
                          <span style={{ fontSize: '0.85rem', color: '#555', display: 'block', marginBottom: '4px' }}>{data.descripcion}</span>
                          <div style={{ display: 'flex', justifyContent: 'space-between', gap: '15px', borderTop: '1px solid #eee', paddingTop: '4px' }}>
                            <span style={{ color: '#1a1a2e', fontWeight: '800' }}>{formatCurrency(value)}</span>
                            <strong style={{ color: '#9c0720', fontWeight: '900' }}>{((value / currentData.totalPresupuesto) * 100).toFixed(1)}%</strong>
                          </div>
                        </div>
                      </div>
                    )}
                  />
                )}
                
                {/* Center label for Donut */}
                {activeView === 'programas' && (
                  <div style={{ position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)', textAlign: 'center', pointerEvents: 'none' }}>
                    <p style={{ margin: 0, color: '#666', fontSize: isMobile ? '0.78rem' : '0.9rem', fontWeight: '600' }}>Total</p>
                    <p style={{ margin: 0, color: '#1a1a2e', fontSize: isMobile ? '1.05rem' : '1.25rem', fontWeight: '900' }}>{formatCurrency(currentData.totalPresupuesto).split(',')[0]}</p>
                  </div>
                )}
              </div>

              {/* Leyenda Rápida y Compacta para Celular */}
              {isMobile && activeView === 'programas' && (
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '0.4rem', marginTop: '0.75rem', padding: '0.65rem 0.75rem', background: '#f1f5f9', borderRadius: '12px', border: '1px solid #e2e8f0' }}>
                  {currentData.programas.map((prog) => (
                    <div key={prog.id} style={{ display: 'flex', alignItems: 'center', gap: '0.4rem', fontSize: '0.74rem', fontWeight: '800', color: '#1a1a2e' }}>
                      <span style={{ width: '10px', height: '10px', borderRadius: '50%', background: prog.color, flexShrink: 0 }} />
                      <span style={{ overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>{prog.id}: <span style={{ color: prog.color }}>{((prog.value / currentData.totalPresupuesto) * 100).toFixed(1)}%</span></span>
                    </div>
                  ))}
                </div>
              )}
            </div>

            {/* Highlights Sidebar */}
            <div style={{ display: 'flex', flexDirection: 'column', gap: '0.8rem', minWidth: '0' }}>
              <h4 style={{ fontSize: '1rem', fontWeight: '800', color: '#1a1a2e', marginBottom: '0.1rem', display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                <TrendingUp size={18} color="#9c0720" /> Top 5 Mayor Asignación ({activeView === 'gastos' ? 'Grupos' : 'Programas'})
              </h4>
              {(activeView === 'gastos' ? currentData.gruposGasto : currentData.programas)
                .sort((a, b) => b.value - a.value)
                .slice(0, isMobile ? 12 : 5)
                .map((item, idx) => (
                  <motion.div 
                    key={item.id || item.grupo}
                    initial={{ opacity: 0, x: 20 }}
                    animate={{ opacity: 1, x: 0 }}
                    transition={{ delay: idx * 0.08, type: 'spring', stiffness: 100 }}
                    style={{ 
                      background: '#ffffff',
                      border: '1px solid #eaeaea', 
                      borderLeft: `4px solid ${item.color}`,
                      borderRadius: '8px', 
                      padding: '0.4rem 0.6rem',
                      display: 'flex',
                      alignItems: 'center',
                      gap: '0.5rem',
                      boxShadow: '0 2px 6px rgba(0,0,0,0.02)',
                      transition: 'transform 0.2s, box-shadow 0.2s'
                    }}
                    onMouseEnter={(e) => { e.currentTarget.style.transform = 'translateY(-2px)'; e.currentTarget.style.boxShadow = '0 6px 12px rgba(0,0,0,0.05)' }}
                    onMouseLeave={(e) => { e.currentTarget.style.transform = 'translateY(0)'; e.currentTarget.style.boxShadow = '0 2px 6px rgba(0,0,0,0.02)' }}
                  >
                    <div style={{ background: '#f8f9fa', padding: '0.4rem', borderRadius: '6px', border: '1px solid #f0f0f0', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                      {item.icon ? <item.icon size={16} color={item.color} /> : <TrendingUp size={16} color={item.color} />}
                    </div>
                    <div style={{ flex: 1 }}>
                      <p style={{ margin: 0, fontSize: '0.75rem', color: '#1a1a2e', fontWeight: '700', lineHeight: 1.15 }}>
                        {item.label || item.descripcion}
                      </p>
                      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginTop: '0.3rem' }}>
                        <p style={{ margin: 0, fontSize: '0.95rem', color: item.color, fontWeight: '900' }}>
                          {((item.value / currentData.totalPresupuesto) * 100).toFixed(1)}%
                        </p>
                        <p style={{ margin: 0, fontSize: '0.75rem', color: '#0f172a', fontWeight: '800', background: '#f1f5f9', padding: '0.15rem 0.45rem', borderRadius: '4px', letterSpacing: '-0.2px' }}>
                          {formatCurrency(item.value)}
                        </p>
                      </div>
                    </div>
                  </motion.div>
                ))
              }
            </div>
          </div>
        )}

        {/* Visual Grid for Programs */}
        {activeView === 'programas' && (
          <div style={{ marginTop: '3rem', borderTop: '1px solid #f0f0f0', paddingTop: '2.5rem' }}>
            <h4 style={{ fontSize: '1.35rem', fontWeight: '800', color: '#1a1a2e', marginBottom: '1.5rem', display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
              <Building2 color="#9c0720" /> Desglose Visual por Áreas
            </h4>
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(220px, 1fr))', gap: '1.2rem' }}>
              {currentData.programas.sort((a,b) => b.value - a.value).map((prog, idx) => (
                <motion.div
                  key={prog.id}
                  initial={{ opacity: 0, y: 20 }}
                  animate={{ opacity: 1, y: 0 }}
                  transition={{ delay: idx * 0.05 }}
                  style={{
                    borderRadius: '16px',
                    overflow: 'hidden',
                    position: 'relative',
                    height: '140px',
                    border: '1px solid #eaeaea',
                    boxShadow: '0 4px 12px rgba(0,0,0,0.06)',
                    cursor: 'pointer'
                  }}
                >
                  <div style={{ 
                    position: 'absolute', top: 0, left: 0, width: '100%', height: '100%', 
                    backgroundImage: prog.image ? `url(${prog.image})` : `linear-gradient(135deg, ${prog.color || '#333'} 0%, #111 100%)`, 
                    backgroundSize: 'cover', backgroundPosition: 'center',
                    transition: 'transform 0.5s ease'
                  }}
                  onMouseEnter={(e) => e.currentTarget.style.transform = 'scale(1.08)'}
                  onMouseLeave={(e) => e.currentTarget.style.transform = 'scale(1)'}
                  />
                  <div style={{ 
                    position: 'absolute', top: 0, left: 0, width: '100%', height: '100%', 
                    background: 'linear-gradient(to top, rgba(0,0,0,0.92) 0%, rgba(0,0,0,0.35) 55%, rgba(0,0,0,0.05) 100%)',
                    display: 'flex', flexDirection: 'column', justifyContent: 'flex-end', padding: '0.9rem', pointerEvents: 'none'
                  }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.4rem', marginBottom: '0.3rem' }}>
                      {prog.icon ? <prog.icon size={15} color={prog.color} /> : <Activity size={15} color={prog.color} />}
                      <span style={{ color: prog.color, fontWeight: '900', fontSize: '0.75rem', textTransform: 'uppercase', letterSpacing: '0.5px' }}>
                        {((prog.value / currentData.totalPresupuesto) * 100).toFixed(1)}%
                      </span>
                    </div>
                    <h5 style={{ margin: 0, color: '#ffffff', fontSize: '0.9rem', fontWeight: '800', lineHeight: 1.2, marginBottom: '0.2rem' }}>{prog.label}</h5>
                    <p style={{ margin: 0, color: '#dddddd', fontSize: '0.8rem', fontWeight: '600' }}>{formatCurrency(prog.value)}</p>
                  </div>
                </motion.div>
              ))}
            </div>
          </div>
        )}
            </>
          );
        })()}
      </div>
    </div>
  );
}

'use client';

import { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import { ResponsivePie } from '@nivo/pie';
import { ResponsiveBar } from '@nivo/bar';
import { Wallet, PieChart, BarChart2, TrendingUp, Building2, Shield, Activity, Map, Users, MapPin } from 'lucide-react';
import GeoportalPoa from './GeoportalPoa';
import { municipalitiesData, municipalitiesList } from './municipalitiesData';

const formatCurrency = (value) => {
  return new Intl.NumberFormat('es-BO', { style: 'currency', currency: 'BOB', maximumFractionDigits: 0 }).format(value);
};

export default function BudgetDashboard() {
  const [activeView, setActiveView] = useState('programas');
  const [selectedMuni, setSelectedMuni] = useState('corque');
  const [isMobile, setIsMobile] = useState(false);
  const [isDrawing, setIsDrawing] = useState(true);

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
    }, 6500);
    return () => clearInterval(interval);
  }, []);

  const currentData = municipalitiesData[selectedMuni];

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
        <header className="budget-header">
          <div>
            <h3 style={{ fontSize: '1.7rem', fontWeight: '900', margin: 0, color: '#9c0720', letterSpacing: '-0.5px' }}>
              Gestión Presupuestaria e Inversión Municipal
            </h3>
            <div style={{ marginTop: '0.85rem', display: 'flex', flexDirection: 'column', gap: '0.65rem' }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem', flexWrap: 'wrap' }}>
                <div style={{ position: 'relative', flex: '1 1 280px', minWidth: '260px' }}>
                  <MapPin size={16} color="#9c0720" style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)', pointerEvents: 'none' }} />
                  <select
                    value={selectedMuni}
                    onChange={(e) => setSelectedMuni(e.target.value)}
                    style={{
                      width: '100%',
                      background: '#f8f9fa',
                      color: '#1a1a2e',
                      border: '1.5px solid #dcdcdc',
                      borderRadius: '10px',
                      padding: '0.6rem 1rem 0.6rem 2.3rem',
                      fontSize: isMobile ? '0.85rem' : '0.94rem',
                      fontWeight: '800',
                      outline: 'none',
                      cursor: 'pointer',
                      boxShadow: '0 2px 6px rgba(0,0,0,0.03)',
                      transition: 'all 0.2s'
                    }}
                  >
                    <optgroup label="⭐ Municipios con POA Detallado 100%">
                      <option value="corque">Gob. Autónomo Municipal de Corque (⭐ 100%)</option>
                      <option value="choquecota">Gob. Autónomo Municipal de Choquecota (⭐ 100%)</option>
                    </optgroup>
                    <optgroup label="📍 Los 35 Municipios de Oruro (Por Orden Alfabético con GPS Exacto)">
                      {municipalitiesList.map((muni) => (
                        <option key={muni.id} value={muni.id}>
                          {muni.entidad} {muni.isLoaded100 ? '(⭐ 100% Cargado)' : ''}
                        </option>
                      ))}
                    </optgroup>
                  </select>
                </div>

                <button
                  onClick={() => setSelectedMuni('corque')}
                  style={{
                    background: selectedMuni === 'corque' ? '#9c0720' : '#f8f9fa',
                    color: selectedMuni === 'corque' ? '#ffffff' : '#1a1a2e',
                    border: selectedMuni === 'corque' ? '1px solid #9c0720' : '1px solid #ddd',
                    borderRadius: '10px',
                    padding: '0.55rem 1.1rem',
                    fontSize: isMobile ? '0.83rem' : '0.9rem',
                    fontWeight: '800',
                    cursor: 'pointer',
                    display: 'flex',
                    alignItems: 'center',
                    gap: '0.45rem',
                    boxShadow: selectedMuni === 'corque' ? '0 4px 12px rgba(156,7,32,0.25)' : 'none',
                    transition: 'all 0.25s ease'
                  }}
                >
                  <Building2 size={15} /> ⭐ Corque
                </button>
                <button
                  onClick={() => setSelectedMuni('choquecota')}
                  style={{
                    background: selectedMuni === 'choquecota' ? '#9c0720' : '#f8f9fa',
                    color: selectedMuni === 'choquecota' ? '#ffffff' : '#1a1a2e',
                    border: selectedMuni === 'choquecota' ? '1px solid #9c0720' : '1px solid #ddd',
                    borderRadius: '10px',
                    padding: '0.55rem 1.1rem',
                    fontSize: isMobile ? '0.83rem' : '0.9rem',
                    fontWeight: '800',
                    cursor: 'pointer',
                    display: 'flex',
                    alignItems: 'center',
                    gap: '0.45rem',
                    boxShadow: selectedMuni === 'choquecota' ? '0 4px 12px rgba(156,7,32,0.25)' : 'none',
                    transition: 'all 0.25s ease'
                  }}
                >
                  <Building2 size={15} /> ⭐ Choquecota
                </button>
              </div>
            </div>
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
        <div className="budget-tabs-bar">
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

        {/* Charts or Geoportal Container */}
        {activeView === 'mapa' ? (
          <GeoportalPoa currentData={currentData} />
        ) : (
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(280px, 1fr))', gap: '1.5rem', minHeight: isMobile ? '340px' : '450px' }}>
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
                      format: (value) => `${(value / 1000000).toFixed(1)}M`
                    }}
                    axisLeft={{
                      tickSize: 5, tickPadding: 5, tickRotation: 0,
                    }}
                    theme={{
                      axis: { ticks: { text: { fill: '#555', fontSize: isMobile ? 11 : 13, fontWeight: '600' } }, legend: { text: { fill: '#333', fontSize: 14, fontWeight: '700' } } },
                      grid: { line: { stroke: '#eaeaea', strokeWidth: 1, strokeDasharray: '4 4' } },
                      tooltip: { container: { background: '#ffffff', color: '#1a1a2e', fontSize: '14px', borderRadius: '8px', boxShadow: '0 10px 25px rgba(0,0,0,0.12)', border: '1px solid #eaeaea' } },
                    }}
                    enableGridX={true}
                    enableGridY={false}
                    labelSkipWidth={42}
                    labelSkipHeight={16}
                    labelTextColor="#ffffff"
                    label={d => `${((d.value / currentData.totalPresupuesto) * 100).toFixed(1)}%`}
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
            <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem', minWidth: isMobile ? '100%' : '340px' }}>
              <h4 style={{ fontSize: '1.15rem', fontWeight: '800', color: '#1a1a2e', marginBottom: '0.25rem', display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                <TrendingUp size={20} color="#9c0720" /> Mayor Asignación ({activeView === 'gastos' ? 'Grupos' : 'Programas'})
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
                      borderLeft: `5px solid ${item.color}`,
                      borderRadius: '12px', 
                      padding: '1rem 1.25rem',
                      display: 'flex',
                      alignItems: 'center',
                      gap: '1rem',
                      boxShadow: '0 2px 8px rgba(0,0,0,0.02)',
                      transition: 'transform 0.2s, box-shadow 0.2s'
                    }}
                    onMouseEnter={(e) => { e.currentTarget.style.transform = 'translateY(-2px)'; e.currentTarget.style.boxShadow = '0 6px 16px rgba(0,0,0,0.06)' }}
                    onMouseLeave={(e) => { e.currentTarget.style.transform = 'translateY(0)'; e.currentTarget.style.boxShadow = '0 2px 8px rgba(0,0,0,0.02)' }}
                  >
                    <div style={{ background: '#f8f9fa', padding: '0.65rem', borderRadius: '10px', border: '1px solid #f0f0f0', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                      {item.icon ? <item.icon size={22} color={item.color} /> : <TrendingUp size={22} color={item.color} />}
                    </div>
                    <div style={{ flex: 1 }}>
                      <p style={{ margin: 0, fontSize: '0.95rem', color: '#1a1a2e', fontWeight: '700', lineHeight: 1.2 }}>
                        {item.label || item.descripcion}
                      </p>
                      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginTop: '0.3rem' }}>
                        <p style={{ margin: 0, fontSize: '1.2rem', color: item.color, fontWeight: '900' }}>
                          {((item.value / currentData.totalPresupuesto) * 100).toFixed(1)}%
                        </p>
                        <p style={{ margin: 0, fontSize: '0.88rem', color: '#666', fontWeight: '600' }}>
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
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(280px, 1fr))', gap: '1.5rem' }}>
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
                    height: '200px',
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
                    display: 'flex', flexDirection: 'column', justifyContent: 'flex-end', padding: '1.25rem', pointerEvents: 'none'
                  }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', marginBottom: '0.4rem' }}>
                      <prog.icon size={18} color={prog.color} />
                      <span style={{ color: prog.color, fontWeight: '900', fontSize: '0.85rem', textTransform: 'uppercase', letterSpacing: '0.5px' }}>
                        {((prog.value / currentData.totalPresupuesto) * 100).toFixed(1)}%
                      </span>
                    </div>
                    <h5 style={{ margin: 0, color: '#ffffff', fontSize: '1.15rem', fontWeight: '800', lineHeight: 1.2, marginBottom: '0.2rem' }}>{prog.label}</h5>
                    <p style={{ margin: 0, color: '#dddddd', fontSize: '0.95rem', fontWeight: '600' }}>{formatCurrency(prog.value)}</p>
                  </div>
                </motion.div>
              ))}
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

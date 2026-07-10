'use client';

import { useState } from 'react';
import { motion } from 'framer-motion';
import { ResponsivePie } from '@nivo/pie';
import { ResponsiveBar } from '@nivo/bar';
import { Wallet, PieChart, BarChart2, TrendingUp, Building2, Shield, Activity, Map, Users, MapPin } from 'lucide-react';

const municipalitiesData = {
  choquecota: {
    id: 'choquecota',
    entidad: "Gob. Autónomo Municipal de Choquecota",
    lat: -18.09005645169872,
    lng: -67.88933393107519,
    totalPresupuesto: 3413990,
    programas: [
      { id: "Salud", label: "Gestión de Salud", value: 662014, color: "hsl(204, 70%, 50%)", icon: Activity, image: "https://images.unsplash.com/photo-1505751172876-fa1923c5c528?auto=format&fit=crop&q=80&w=600" },
      { id: "Educación", label: "Gestión de Educación", value: 446489, color: "hsl(43, 74%, 49%)", icon: Users, image: "https://images.unsplash.com/photo-1503676260728-1c00da094a0b?auto=format&fit=crop&q=80&w=600" },
      { id: "Fortalecimiento", label: "Fortalecimiento Inst.", value: 403001, color: "hsl(283, 39%, 53%)", icon: TrendingUp, image: "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?auto=format&fit=crop&q=80&w=600" },
      { id: "Ejecutivo", label: "Órgano Ejecutivo", value: 398627, color: "hsl(348, 70%, 50%)", icon: Building2, image: "https://images.unsplash.com/photo-1541872703-74c5e44368f9?auto=format&fit=crop&q=80&w=600" },
      { id: "Vulnerables", label: "Grupos Vulnerables", value: 298253, color: "hsl(14, 89%, 55%)", icon: Shield, image: "https://images.unsplash.com/photo-1469571486292-0ba58a3f068b?auto=format&fit=crop&q=80&w=600" },
      { id: "Deliberativo", label: "Órgano Deliberativo", value: 265751, color: "hsl(348, 70%, 40%)", icon: Building2, image: "https://images.unsplash.com/photo-1577962917302-cd874c4e31d2?auto=format&fit=crop&q=80&w=600" },
      { id: "Agropecuario", label: "Desarrollo Agropec.", value: 247872, color: "hsl(145, 63%, 42%)", icon: Map, image: "https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&q=80&w=600" },
      { id: "Infraestructura", label: "Infraestructura", value: 215360, color: "hsl(180, 25%, 25%)", icon: Building2, image: "https://images.unsplash.com/photo-1541888087-b552d5854897?auto=format&fit=crop&q=80&w=600" },
      { id: "Caminos", label: "Gestión de Caminos", value: 149440, color: "hsl(30, 80%, 50%)", icon: Map, image: "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?auto=format&fit=crop&q=80&w=600" },
      { id: "Otros", label: "Otros Programas", value: 327183, color: "hsl(0, 0%, 50%)", icon: PieChart, image: "https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&q=80&w=600" }
    ],
    gruposGasto: [
      { grupo: "Grupo 2", descripcion: "Servicios No Personales", value: 1293885, color: "hsl(348, 70%, 45%)" },
      { grupo: "Grupo 3", descripcion: "Materiales y Suministros", value: 1180526, color: "hsl(348, 70%, 35%)" },
      { grupo: "Grupo 1", descripcion: "Servicios Personales", value: 615836, color: "hsl(348, 70%, 55%)" },
      { grupo: "Grupo 7", descripcion: "Transferencias", value: 246743, color: "hsl(348, 70%, 25%)" },
      { grupo: "Grupo 4", descripcion: "Activos Reales", value: 77000, color: "hsl(348, 70%, 15%)" },
    ]
  },
  corque: {
    id: 'corque',
    entidad: "Gob. Autónomo Municipal de Corque",
    lat: -18.350040587002457,
    lng: -67.6818495498408,
    totalPresupuesto: 17924466,
    programas: [
      { id: "Salud", label: "Gestión de Salud", value: 3210999, color: "hsl(204, 70%, 50%)", icon: Activity, image: "https://images.unsplash.com/photo-1505751172876-fa1923c5c528?auto=format&fit=crop&q=80&w=600" },
      { id: "Educación", label: "Gestión de Educación", value: 2757004, color: "hsl(43, 74%, 49%)", icon: Users, image: "https://images.unsplash.com/photo-1503676260728-1c00da094a0b?auto=format&fit=crop&q=80&w=600" },
      { id: "Ejecutivo", label: "Órgano Ejecutivo", value: 1906618, color: "hsl(348, 70%, 50%)", icon: Building2, image: "https://images.unsplash.com/photo-1541872703-74c5e44368f9?auto=format&fit=crop&q=80&w=600" },
      { id: "Infraestructura", label: "Infraestructura Urbana", value: 1792974, color: "hsl(180, 25%, 25%)", icon: Building2, image: "https://images.unsplash.com/photo-1541888087-b552d5854897?auto=format&fit=crop&q=80&w=600" },
      { id: "Agropecuario", label: "Producción Agropecuaria", value: 1699155, color: "hsl(145, 63%, 42%)", icon: Map, image: "https://images.unsplash.com/photo-1500937386664-56d1dfef3854?auto=format&fit=crop&q=80&w=600" },
      { id: "Vulnerables", label: "Grupos Vulnerables", value: 1396160, color: "hsl(14, 89%, 55%)", icon: Shield, image: "https://images.unsplash.com/photo-1469571486292-0ba58a3f068b?auto=format&fit=crop&q=80&w=600" },
      { id: "Activos", label: "Activos Financieros", value: 1394336, color: "hsl(283, 39%, 53%)", icon: Wallet, image: "https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?auto=format&fit=crop&q=80&w=600" },
      { id: "Deliberativo", label: "Órgano Deliberativo", value: 817122, color: "hsl(348, 70%, 40%)", icon: Building2, image: "https://images.unsplash.com/photo-1577962917302-cd874c4e31d2?auto=format&fit=crop&q=80&w=600" },
      { id: "Fortalecimiento", label: "Fortalecimiento Inst.", value: 733275, color: "hsl(220, 50%, 50%)", icon: TrendingUp, image: "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?auto=format&fit=crop&q=80&w=600" },
      { id: "Otros", label: "Otros Programas", value: 2216823, color: "hsl(0, 0%, 50%)", icon: PieChart, image: "https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&q=80&w=600" }
    ],
    gruposGasto: [
      { grupo: "Grupo 3", descripcion: "Materiales y Suministros", value: 6951743, color: "hsl(348, 70%, 35%)" },
      { grupo: "Grupo 4", descripcion: "Activos Reales", value: 3394974, color: "hsl(348, 70%, 15%)" },
      { grupo: "Grupo 2", descripcion: "Servicios No Personales", value: 2413602, color: "hsl(348, 70%, 45%)" },
      { grupo: "Grupo 1", descripcion: "Servicios Personales", value: 1831626, color: "hsl(348, 70%, 55%)" },
      { grupo: "Grupo 5", descripcion: "Activos Financieros", value: 1394336, color: "hsl(145, 63%, 42%)" },
      { grupo: "Grupo 7", descripcion: "Transferencias", value: 1327439, color: "hsl(348, 70%, 25%)" },
      { grupo: "Grupo 6", descripcion: "Deudas", value: 610746, color: "hsl(0, 0%, 50%)" },
    ]
  }
};

const formatCurrency = (value) => {
  return new Intl.NumberFormat('es-BO', { style: 'currency', currency: 'BOB', maximumFractionDigits: 0 }).format(value);
};

export default function BudgetDashboard() {
  const [activeView, setActiveView] = useState('programas');
  const [selectedMuni, setSelectedMuni] = useState('corque');
  const currentData = municipalitiesData[selectedMuni];

  return (
    <div style={{
      background: 'linear-gradient(145deg, #1a1a2e 0%, #0f172a 100%)',
      borderRadius: '24px',
      padding: '2rem',
      color: '#fff',
      boxShadow: '0 25px 50px -12px rgba(0,0,0,0.5)',
      marginTop: '2rem',
      position: 'relative',
      overflow: 'hidden'
    }}>
      {/* Background glowing orbs for futuristic look */}
      <div style={{ position: 'absolute', top: '-20%', left: '-10%', width: '50%', height: '50%', background: 'radial-gradient(circle, rgba(156,7,32,0.3) 0%, rgba(0,0,0,0) 70%)', filter: 'blur(50px)', zIndex: 0 }} />
      <div style={{ position: 'absolute', bottom: '-20%', right: '-10%', width: '50%', height: '50%', background: 'radial-gradient(circle, rgba(15,52,96,0.4) 0%, rgba(0,0,0,0) 70%)', filter: 'blur(50px)', zIndex: 0 }} />

      <div style={{ position: 'relative', zIndex: 1 }}>
        <header style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '2.5rem', flexWrap: 'wrap', gap: '1.5rem' }}>
          <div>
            <h3 style={{ fontSize: '1.8rem', fontWeight: '800', margin: 0, background: 'linear-gradient(90deg, #ffffff, #a5a5b0)', WebkitBackgroundClip: 'text', WebkitTextFillColor: 'transparent' }}>
              Dashboard Presupuestario
            </h3>
            <div style={{ marginTop: '0.75rem', display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
              <Building2 size={18} color="#a5a5b0" />
              <select 
                value={selectedMuni} 
                onChange={(e) => setSelectedMuni(e.target.value)}
                style={{
                  background: 'rgba(255,255,255,0.05)',
                  color: '#fff',
                  border: '1px solid rgba(255,255,255,0.2)',
                  borderRadius: '8px',
                  padding: '0.5rem 1rem',
                  fontSize: '1rem',
                  fontWeight: '600',
                  outline: 'none',
                  cursor: 'pointer'
                }}
              >
                <option value="choquecota" style={{ color: '#000' }}>{municipalitiesData.choquecota.entidad}</option>
                <option value="corque" style={{ color: '#000' }}>{municipalitiesData.corque.entidad}</option>
              </select>
            </div>
          </div>
          <div style={{ background: 'rgba(255,255,255,0.05)', backdropFilter: 'blur(10px)', border: '1px solid rgba(255,255,255,0.1)', padding: '1.25rem 2rem', borderRadius: '16px', display: 'flex', alignItems: 'center', gap: '1.25rem', boxShadow: '0 10px 30px rgba(0,0,0,0.2)' }}>
            <div style={{ background: 'rgba(156,7,32,0.2)', padding: '0.8rem', borderRadius: '12px' }}>
              <Wallet color="#ff4d6d" size={28} />
            </div>
            <div>
              <p style={{ color: '#a5a5b0', fontSize: '0.85rem', margin: 0, fontWeight: '600', letterSpacing: '1px' }}>PRESUPUESTO TOTAL (BOB)</p>
              <h4 style={{ fontSize: '1.75rem', fontWeight: '800', margin: '0.2rem 0 0 0', color: '#fff' }}>{formatCurrency(currentData.totalPresupuesto)}</h4>
            </div>
          </div>
        </header>

        {/* View Toggle */}
        <div style={{ display: 'flex', gap: '0.5rem', marginBottom: '2rem', background: 'rgba(255,255,255,0.03)', padding: '0.4rem', borderRadius: '12px', width: 'fit-content', border: '1px solid rgba(255,255,255,0.05)' }}>
          <button 
            onClick={() => setActiveView('programas')}
            style={{ 
              background: activeView === 'programas' ? 'linear-gradient(135deg, #9c0720 0%, #7a0518 100%)' : 'transparent', 
              color: activeView === 'programas' ? '#fff' : '#a5a5b0',
              border: 'none', padding: '0.75rem 1.5rem', borderRadius: '8px', fontWeight: '600', cursor: 'pointer', transition: 'all 0.3s', display: 'flex', alignItems: 'center', gap: '0.5rem',
              boxShadow: activeView === 'programas' ? '0 4px 12px rgba(156,7,32,0.3)' : 'none'
            }}
          >
            <PieChart size={18} /> Categoría Programática
          </button>
          <button 
            onClick={() => setActiveView('gastos')}
            style={{ 
              background: activeView === 'gastos' ? 'linear-gradient(135deg, #9c0720 0%, #7a0518 100%)' : 'transparent', 
              color: activeView === 'gastos' ? '#fff' : '#a5a5b0',
              border: 'none', padding: '0.75rem 1.5rem', borderRadius: '8px', fontWeight: '600', cursor: 'pointer', transition: 'all 0.3s', display: 'flex', alignItems: 'center', gap: '0.5rem',
              boxShadow: activeView === 'gastos' ? '0 4px 12px rgba(156,7,32,0.3)' : 'none'
            }}
          >
            <BarChart2 size={18} /> Grupo de Gasto
          </button>
          <button 
            onClick={() => setActiveView('mapa')}
            style={{ 
              background: activeView === 'mapa' ? 'linear-gradient(135deg, #9c0720 0%, #7a0518 100%)' : 'transparent', 
              color: activeView === 'mapa' ? '#fff' : '#a5a5b0',
              border: 'none', padding: '0.75rem 1.5rem', borderRadius: '8px', fontWeight: '600', cursor: 'pointer', transition: 'all 0.3s', display: 'flex', alignItems: 'center', gap: '0.5rem',
              boxShadow: activeView === 'mapa' ? '0 4px 12px rgba(156,7,32,0.3)' : 'none'
            }}
          >
            <MapPin size={18} /> Ubicación
          </button>
        </div>

        {/* Charts Container */}
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(300px, 1fr))', gap: '2rem', minHeight: '450px' }}>
          {/* Main Chart */}
          <div style={{ background: 'rgba(255,255,255,0.02)', border: '1px solid rgba(255,255,255,0.05)', borderRadius: '20px', padding: '1.5rem', height: '450px', position: 'relative' }}>
            {activeView === 'programas' ? (
              <ResponsivePie
                data={currentData.programas}
                margin={{ top: 20, right: 20, bottom: 20, left: 20 }}
                innerRadius={0.65}
                padAngle={2}
                cornerRadius={6}
                activeOuterRadiusOffset={8}
                colors={{ datum: 'data.color' }}
                borderWidth={1}
                borderColor={{ from: 'color', modifiers: [ [ 'darker', 0.2 ] ] }}
                enableArcLinkLabels={true}
                arcLinkLabelsSkipAngle={10}
                arcLinkLabelsTextColor="#e0e0e0"
                arcLinkLabelsThickness={2}
                arcLinkLabelsColor={{ from: 'color' }}
                arcLabelsSkipAngle={10}
                arcLabelsTextColor="#fff"
                theme={{
                  tooltip: { container: { background: '#1a1a2e', color: '#fff', fontSize: '14px', borderRadius: '8px', boxShadow: '0 10px 25px rgba(0,0,0,0.5)', border: '1px solid rgba(255,255,255,0.1)' } },
                }}
                valueFormat={(value) => `${((value / currentData.totalPresupuesto) * 100).toFixed(1)}%`}
                tooltip={({ datum: { id, value, color } }) => (
                  <div style={{ padding: '10px 15px', display: 'flex', alignItems: 'center', gap: '10px' }}>
                    <div style={{ width: '12px', height: '12px', background: color, borderRadius: '50%' }} />
                    <div>
                      <strong style={{ fontSize: '1.1rem' }}>{id}</strong><br />
                      <span style={{ color: '#a5a5b0' }}>{formatCurrency(value)}</span> <strong style={{ color: '#ff4d6d' }}>({((value / currentData.totalPresupuesto) * 100).toFixed(1)}%)</strong>
                    </div>
                  </div>
                )}
              />
            ) : activeView === 'gastos' ? (
              <ResponsiveBar
                data={currentData.gruposGasto}
                keys={['value']}
                indexBy="grupo"
                margin={{ top: 30, right: 20, bottom: 50, left: 90 }}
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
                  axis: { ticks: { text: { fill: '#a5a5b0', fontSize: 13, fontWeight: '600' } }, legend: { text: { fill: '#a5a5b0', fontSize: 14, fontWeight: '600' } } },
                  grid: { line: { stroke: 'rgba(255,255,255,0.05)', strokeWidth: 1, strokeDasharray: '4 4' } },
                  tooltip: { container: { background: '#1a1a2e', color: '#fff', fontSize: '14px', borderRadius: '8px', border: '1px solid rgba(255,255,255,0.1)' } },
                }}
                enableGridX={true}
                enableGridY={false}
                labelSkipWidth={12}
                labelSkipHeight={12}
                labelTextColor="#fff"
                label={d => `${((d.value / currentData.totalPresupuesto) * 100).toFixed(1)}%`}
                tooltip={({ id, value, color, indexValue, data }) => (
                  <div style={{ padding: '10px 15px', display: 'flex', alignItems: 'center', gap: '10px' }}>
                    <div style={{ width: '12px', height: '12px', background: color, borderRadius: '50%' }} />
                    <div>
                      <strong style={{ fontSize: '1.1rem' }}>{indexValue}</strong> <span style={{ color: '#a5a5b0' }}>- {data.descripcion}</span><br />
                      <span style={{ color: '#fff' }}>{formatCurrency(value)}</span> <strong style={{ color: '#ff4d6d' }}>({((value / currentData.totalPresupuesto) * 100).toFixed(1)}%)</strong>
                    </div>
                  </div>
                )}
              />
            ) : (
              <iframe 
                width="100%" 
                height="100%" 
                frameBorder="0"
                scrolling="no"
                marginHeight="0"
                marginWidth="0"
                style={{ border: 0, borderRadius: '16px', backgroundColor: '#fff' }} 
                src={`https://maps.google.com/maps?q=${currentData.lat},${currentData.lng}&t=m&z=14&output=embed&iwloc=near`} 
                title={`Mapa de ${currentData.entidad}`}
              />
            )}
            
            {/* Center label for Donut */}
            {activeView === 'programas' && (
              <div style={{ position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)', textAlign: 'center', pointerEvents: 'none' }}>
                <p style={{ margin: 0, color: '#a5a5b0', fontSize: '0.9rem' }}>Total</p>
                <p style={{ margin: 0, color: '#fff', fontSize: '1.2rem', fontWeight: '800' }}>{formatCurrency(currentData.totalPresupuesto).split(',')[0]}</p>
              </div>
            )}
          </div>

          {/* Highlights Sidebar */}
          <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem', minWidth: '350px' }}>
            <h4 style={{ fontSize: '1.1rem', fontWeight: '700', color: '#fff', marginBottom: '0.5rem', display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
              <TrendingUp size={18} color="#ff4d6d" /> Mayor Asignación ({activeView === 'gastos' ? 'Grupos' : 'Programas'})
            </h4>
            {(activeView === 'gastos' ? currentData.gruposGasto : currentData.programas)
              .sort((a, b) => b.value - a.value)
              .slice(0, 5)
              .map((item, idx) => (
                <motion.div 
                  key={item.id || item.grupo}
                  initial={{ opacity: 0, x: 20 }}
                  animate={{ opacity: 1, x: 0 }}
                  transition={{ delay: idx * 0.1, type: 'spring', stiffness: 100 }}
                  style={{ 
                    background: item.image ? `linear-gradient(to right, rgba(26,26,46,0.95), rgba(26,26,46,0.8)), url(${item.image})` : 'rgba(255,255,255,0.03)', 
                    backgroundSize: 'cover',
                    backgroundPosition: 'center',
                    border: '1px solid rgba(255,255,255,0.05)', 
                    borderRadius: '16px', 
                    padding: '1.25rem',
                    display: 'flex',
                    alignItems: 'center',
                    gap: '1.25rem',
                    position: 'relative',
                    overflow: 'hidden',
                    backdropFilter: 'blur(5px)'
                  }}
                >
                  <div style={{ position: 'absolute', left: 0, top: 0, bottom: 0, width: '4px', background: item.color }} />
                  <div style={{ background: 'rgba(255,255,255,0.1)', backdropFilter: 'blur(10px)', padding: '0.75rem', borderRadius: '12px', border: '1px solid rgba(255,255,255,0.2)' }}>
                    {item.icon ? <item.icon size={22} color={item.color} /> : <TrendingUp size={22} color={item.color} />}
                  </div>
                  <div style={{ flex: 1 }}>
                    <p style={{ margin: 0, fontSize: '0.95rem', color: '#fff', fontWeight: '700', lineHeight: 1.2, textShadow: '0 2px 4px rgba(0,0,0,0.8)' }}>
                      {item.label || item.descripcion}
                    </p>
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'baseline', marginTop: '0.35rem' }}>
                      <p style={{ margin: 0, fontSize: '1.3rem', color: item.color, fontWeight: '900', textShadow: '0 2px 4px rgba(0,0,0,0.8)' }}>
                        {((item.value / currentData.totalPresupuesto) * 100).toFixed(1)}%
                      </p>
                      <p style={{ margin: 0, fontSize: '0.9rem', color: '#e0e0e0', fontWeight: '600', textShadow: '0 2px 4px rgba(0,0,0,0.8)' }}>
                        {formatCurrency(item.value)}
                      </p>
                    </div>
                  </div>
                </motion.div>
              ))
            }
          </div>
        </div>

        {/* Visual Grid for Programs */}
        {activeView === 'programas' && (
          <div style={{ marginTop: '3rem' }}>
            <h4 style={{ fontSize: '1.3rem', fontWeight: '800', color: '#fff', marginBottom: '1.5rem', display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
              <Building2 color="#a5a5b0" /> Desglose Visual por Áreas
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
                    boxShadow: '0 10px 20px rgba(0,0,0,0.3)',
                    cursor: 'crosshair'
                  }}
                >
                  <div style={{ 
                    position: 'absolute', top: 0, left: 0, width: '100%', height: '100%', 
                    backgroundImage: `url(${prog.image})`, backgroundSize: 'cover', backgroundPosition: 'center',
                    transition: 'transform 0.5s ease'
                  }}
                  onMouseEnter={(e) => e.currentTarget.style.transform = 'scale(1.1)'}
                  onMouseLeave={(e) => e.currentTarget.style.transform = 'scale(1)'}
                  />
                  <div style={{ 
                    position: 'absolute', top: 0, left: 0, width: '100%', height: '100%', 
                    background: 'linear-gradient(to top, rgba(0,0,0,0.95) 0%, rgba(0,0,0,0.4) 50%, rgba(0,0,0,0.1) 100%)',
                    display: 'flex', flexDirection: 'column', justifyContent: 'flex-end', padding: '1.25rem', pointerEvents: 'none'
                  }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', marginBottom: '0.5rem' }}>
                      <prog.icon size={18} color={prog.color} />
                      <span style={{ color: prog.color, fontWeight: '800', fontSize: '0.85rem', textTransform: 'uppercase', letterSpacing: '1px' }}>
                        {((prog.value / currentData.totalPresupuesto) * 100).toFixed(1)}%
                      </span>
                    </div>
                    <h5 style={{ margin: 0, color: '#fff', fontSize: '1.2rem', fontWeight: '700', lineHeight: 1.2, marginBottom: '0.25rem' }}>{prog.label}</h5>
                    <p style={{ margin: 0, color: '#a5a5b0', fontSize: '1rem', fontWeight: '600' }}>{formatCurrency(prog.value)}</p>
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

'use client';
import { useState, useEffect, useCallback } from 'react';
import { createClient } from '@/lib/supabase/client';
import { motion } from 'framer-motion';
import { BarChart3 } from 'lucide-react';

function fmtBOB(n) {
  return new Intl.NumberFormat('es-BO', { style: 'currency', currency: 'BOB', maximumFractionDigits: 0 }).format(n || 0);
}

function ProgressBar({ pct, color }) {
  const p = Math.min(100, Math.max(0, pct || 0));
  return (
    <div style={{ background: '#eaeaea', borderRadius: '6px', height: '8px', overflow: 'hidden', flex: 1 }}>
      <div style={{ width: `${p}%`, height: '100%', background: color || '#9c0720', borderRadius: '6px', transition: 'width 0.5s ease' }} />
    </div>
  );
}

export default function PoaDbView({ gestion: defaultGestion = 2025 }) {
  const supabase = createClient();
  const [gestion, setGestion] = useState(defaultGestion);
  const [resumenMunicipios, setResumenMunicipios] = useState([]);
  const [resumenGlobal, setResumenGlobal] = useState(null);
  const [loading, setLoading] = useState(true);
  const [activeTab, setActiveTab] = useState('global');
  const [search, setSearch] = useState('');
  const [items, setItems] = useState([]);
  const [page, setPage] = useState(0);
  const PAGE_SIZE = 50;

  const fetchData = useCallback(async () => {
    setLoading(true);
    try {
      const [{ data: global }, { data: municipios }] = await Promise.all([
        supabase.from('poa_resumen_global').select('*').eq('gestion', gestion).maybeSingle(),
        supabase.from('poa_resumen_municipio').select('*').eq('gestion', gestion).order('total_programado', { ascending: false }),
      ]);
      setResumenGlobal(global || null);
      setResumenMunicipios(municipios || []);
    } catch (_) { /* table not created yet */ }
    setLoading(false);
  }, [gestion]);

  const fetchItems = useCallback(async () => {
    setLoading(true);
    try {
      let q = supabase.from('poa_items').select('*').eq('gestion', gestion).eq('es_publico', true).order('municipio').order('prg');
      if (search) q = q.ilike('descripcion', `%${search}%`);
      q = q.range(page * PAGE_SIZE, (page + 1) * PAGE_SIZE - 1);
      const { data } = await q;
      setItems(data || []);
    } catch (_) { /* table not created yet */ }
    setLoading(false);
  }, [gestion, search, page]);

  useEffect(() => {
    if (activeTab === 'items') fetchItems();
    else fetchData();
  }, [activeTab, fetchData, fetchItems]);

  const pctGlobal = resumenGlobal?.total_programado > 0
    ? ((resumenGlobal.total_ejecutado / resumenGlobal.total_programado) * 100).toFixed(1)
    : '0.0';

  const tabBtn = (t, label) => (
    <button
      onClick={() => { setActiveTab(t); setPage(0); }}
      style={{
        padding: '0.6rem 1.2rem', background: activeTab === t ? '#9c0720' : '#f8f9fa',
        color: activeTab === t ? '#fff' : '#475569', border: '1px solid',
        borderColor: activeTab === t ? '#9c0720' : '#e2e8f0',
        borderRadius: '10px', fontWeight: 700, fontSize: '0.85rem', cursor: 'pointer', transition: 'all 0.2s',
        boxShadow: activeTab === t ? '0 4px 10px rgba(156,7,32,0.2)' : 'none',
      }}
    >{label}</button>
  );

  const S_th = { padding: '0.6rem 0.75rem', textAlign: 'left', fontWeight: 700, color: '#555', borderBottom: '1px solid #eaeaea', background: '#f8f9fa', fontSize: '0.7rem', textTransform: 'uppercase' };
  const S_td = { padding: '0.6rem 0.75rem', borderBottom: '1px solid #eaeaea', fontSize: '0.78rem', color: '#333' };

  if (loading) {
    return <div style={{ textAlign: 'center', padding: '3rem', color: '#888' }}>Cargando datos del POA desde la base de datos...</div>;
  }

  if (!resumenGlobal && activeTab !== 'items') {
    return (
      <div style={{ textAlign: 'center', padding: '3rem', border: '2px dashed #eaeaea', borderRadius: '12px' }}>
        <div style={{ fontSize: '2.5rem', marginBottom: '0.5rem' }}>📄</div>
        <div style={{ fontWeight: 700, color: '#333' }}>No hay datos del POA en la base de datos para la gestión {gestion}</div>
        <div style={{ fontSize: '0.8rem', color: '#888', marginTop: '0.25rem' }}>Los datos serán cargados por el equipo de Planificación.</div>
      </div>
    );
  }

  return (
    <motion.div initial={{ opacity: 0, y: 10 }} animate={{ opacity: 1, y: 0 }} style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>

      {/* Header */}
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexWrap: 'wrap', gap: '1rem' }}>
        <div>
          <h3 style={{ fontSize: '1.2rem', fontWeight: 900, color: '#1a1a2e', margin: 0 }}>📊 POA — Datos en Tiempo Real</h3>
          <p style={{ fontSize: '0.78rem', color: '#666', margin: '0.2rem 0 0' }}>Datos cargados directamente desde la base de datos.</p>
        </div>
        <select value={gestion} onChange={e => { setGestion(Number(e.target.value)); setPage(0); }}
          style={{ padding: '0.55rem 1rem', borderRadius: '8px', border: '1px solid #ddd', background: '#f9f9f9', fontWeight: 600, color: '#1a1a2e' }}>
          {[2023, 2024, 2025, 2026].map(y => <option key={y}>{y}</option>)}
        </select>
      </div>

      {/* Global Stats Cards */}
      {resumenGlobal && (
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(180px, 1fr))', gap: '1rem' }}>
          {[
            { label: 'Total ítems', value: Number(resumenGlobal.total_items || 0).toLocaleString('es-BO'), color: '#6366f1', icon: '📋' },
            { label: 'Total programado', value: fmtBOB(resumenGlobal.total_programado), color: '#0ea5e9', icon: '💰' },
            { label: 'Inversión programada', value: fmtBOB(resumenGlobal.total_inversion_programado), color: '#f59e0b', icon: '🏗️' },
            { label: 'Ejecución global', value: `${pctGlobal}%`, color: Number(pctGlobal) >= 80 ? '#10b981' : Number(pctGlobal) >= 50 ? '#f59e0b' : '#9c0720', icon: '⚡' },
          ].map((s, i) => (
            <motion.div key={i} initial={{ opacity: 0, y: 10 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: i * 0.07 }}
              style={{ background: '#fff', border: '1px solid #eaeaea', borderTop: `3px solid ${s.color}`, borderRadius: '12px', padding: '1.1rem 1.25rem', boxShadow: '0 2px 8px rgba(0,0,0,0.04)' }}>
              <div style={{ fontSize: '1.4rem', marginBottom: '0.35rem' }}>{s.icon}</div>
              <div style={{ fontSize: '1.25rem', fontWeight: 800, color: s.color, lineHeight: 1 }}>{s.value}</div>
              <div style={{ fontSize: '0.72rem', color: '#666', marginTop: '0.25rem' }}>{s.label}</div>
            </motion.div>
          ))}
        </div>
      )}

      {/* Tab Nav */}
      <div style={{ display: 'flex', gap: '0.5rem', flexWrap: 'wrap' }}>
        {tabBtn('global', '📈 Resumen')}
        {tabBtn('municipios', '🗺️ Por Municipio')}
        {tabBtn('items', '📋 Detalle')}
      </div>

      {/* Tab: Global */}
      {activeTab === 'global' && resumenGlobal && (
        <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
          {[
            { label: '🏗️ Inversión', prog: resumenGlobal.total_inversion_programado, ejec: resumenGlobal.total_inversion_ejecutado, color: '#0ea5e9' },
            { label: '📋 Gasto Corriente', prog: resumenGlobal.total_corriente_programado, ejec: resumenGlobal.total_corriente_ejecutado, color: '#6366f1' },
          ].map((row, i) => {
            const pct = row.prog > 0 ? ((row.ejec / row.prog) * 100) : 0;
            return (
              <div key={i} style={{ background: '#fff', border: '1px solid #eaeaea', borderRadius: '12px', padding: '1.25rem', boxShadow: '0 2px 6px rgba(0,0,0,0.03)' }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '0.75rem' }}>
                  <span style={{ fontWeight: 700, color: '#1a1a2e' }}>{row.label}</span>
                  <span style={{ fontSize: '0.78rem', color: '#666' }}>{fmtBOB(row.ejec)} / {fmtBOB(row.prog)}</span>
                </div>
                <div style={{ display: 'flex', gap: '0.75rem', alignItems: 'center' }}>
                  <ProgressBar pct={pct} color={row.color} />
                  <span style={{ fontSize: '0.78rem', fontWeight: 800, color: row.color, minWidth: '40px' }}>{pct.toFixed(1)}%</span>
                </div>
              </div>
            );
          })}
        </div>
      )}

      {/* Tab: Por Municipio */}
      {activeTab === 'municipios' && (
        <div style={{ overflowX: 'auto', border: '1px solid #eaeaea', borderRadius: '12px' }}>
          <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: '0.78rem' }}>
            <thead>
              <tr>
                <th style={S_th}>Municipio</th>
                <th style={S_th}>Tipo</th>
                <th style={{ ...S_th, textAlign: 'right' }}>Ítems</th>
                <th style={{ ...S_th, textAlign: 'right' }}>Programado</th>
                <th style={{ ...S_th, textAlign: 'right' }}>Ejecutado</th>
                <th style={{ ...S_th, minWidth: '140px' }}>Ejecución</th>
              </tr>
            </thead>
            <tbody>
              {resumenMunicipios.length === 0 ? (
                <tr><td colSpan={6} style={{ ...S_td, textAlign: 'center', padding: '2rem', color: '#888' }}>Sin datos</td></tr>
              ) : resumenMunicipios.map((row, i) => {
                const pct = Number(row.porcentaje_ejecucion) || 0;
                const barColor = pct >= 80 ? '#10b981' : pct >= 50 ? '#f59e0b' : '#ef4444';
                return (
                  <tr key={i} onMouseEnter={e => e.currentTarget.style.background = '#f9f9f9'} onMouseLeave={e => e.currentTarget.style.background = 'transparent'}>
                    <td style={{ ...S_td, fontWeight: 600 }}>{row.municipio}</td>
                    <td style={S_td}>
                      <span style={{ padding: '2px 8px', borderRadius: '12px', fontSize: '0.7rem', fontWeight: 700, color: '#fff', background: row.tipo === 'INVERSION' ? '#0ea5e9' : '#6366f1' }}>
                        {row.tipo === 'INVERSION' ? 'Inversión' : 'Corriente'}
                      </span>
                    </td>
                    <td style={{ ...S_td, textAlign: 'right' }}>{row.cantidad_items}</td>
                    <td style={{ ...S_td, textAlign: 'right', fontWeight: 600 }}>{fmtBOB(row.total_programado)}</td>
                    <td style={{ ...S_td, textAlign: 'right', color: '#10b981', fontWeight: 600 }}>{fmtBOB(row.total_ejecutado)}</td>
                    <td style={S_td}>
                      <div style={{ display: 'flex', gap: '0.5rem', alignItems: 'center' }}>
                        <ProgressBar pct={pct} color={barColor} />
                        <span style={{ fontSize: '0.7rem', fontWeight: 700, color: barColor, minWidth: '38px' }}>{pct.toFixed(1)}%</span>
                      </div>
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
      )}

      {/* Tab: Detalle ítems */}
      {activeTab === 'items' && (
        <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
          <input
            style={{ padding: '0.6rem 1rem', borderRadius: '8px', border: '1px solid #ddd', background: '#f9f9f9', fontSize: '0.85rem', width: '100%', boxSizing: 'border-box' }}
            placeholder="🔍 Buscar por descripción..."
            value={search}
            onChange={e => { setSearch(e.target.value); setPage(0); }}
          />
          <div style={{ overflowX: 'auto', border: '1px solid #eaeaea', borderRadius: '12px' }}>
            <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: '0.78rem' }}>
              <thead>
                <tr>
                  <th style={S_th}>Municipio</th>
                  <th style={S_th}>PRG</th>
                  <th style={S_th}>Tipo</th>
                  <th style={S_th}>Descripción</th>
                  <th style={{ ...S_th, textAlign: 'right' }}>Programado</th>
                </tr>
              </thead>
              <tbody>
                {items.length === 0 ? (
                  <tr><td colSpan={5} style={{ ...S_td, textAlign: 'center', padding: '2rem', color: '#888' }}>Sin resultados</td></tr>
                ) : items.map(item => (
                  <tr key={item.id} onMouseEnter={e => e.currentTarget.style.background = '#f9f9f9'} onMouseLeave={e => e.currentTarget.style.background = 'transparent'}>
                    <td style={S_td}>{item.municipio}</td>
                    <td style={S_td}>{item.prg}</td>
                    <td style={S_td}>
                      <span style={{ padding: '2px 8px', borderRadius: '12px', fontSize: '0.68rem', fontWeight: 700, color: '#fff', background: item.tipo === 'INVERSION' ? '#0ea5e9' : '#6366f1' }}>
                        {item.tipo === 'INVERSION' ? 'Inv.' : 'Corriente'}
                      </span>
                    </td>
                    <td style={{ ...S_td, maxWidth: '320px', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }} title={item.descripcion}>{item.descripcion}</td>
                    <td style={{ ...S_td, textAlign: 'right', fontWeight: 600 }}>{fmtBOB(item.monto_programado)}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          <div style={{ display: 'flex', gap: '0.5rem', justifyContent: 'center', alignItems: 'center' }}>
            <button onClick={() => setPage(p => Math.max(0, p - 1))} disabled={page === 0} style={{ padding: '0.4rem 0.8rem', borderRadius: '6px', border: '1px solid #ddd', background: '#f9f9f9', cursor: 'pointer' }}>← Anterior</button>
            <span style={{ fontSize: '0.78rem', color: '#888' }}>Página {page + 1}</span>
            <button onClick={() => setPage(p => p + 1)} disabled={items.length < PAGE_SIZE} style={{ padding: '0.4rem 0.8rem', borderRadius: '6px', border: '1px solid #ddd', background: '#f9f9f9', cursor: 'pointer' }}>Siguiente →</button>
          </div>
        </div>
      )}
    </motion.div>
  );
}

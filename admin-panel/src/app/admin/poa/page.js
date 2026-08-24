'use client';
import { useState, useEffect, useCallback } from 'react';
import { createClient } from '@/lib/supabase/client';

function fmtBOB(n) {
  return new Intl.NumberFormat('es-BO', { style: 'currency', currency: 'BOB', maximumFractionDigits: 0 }).format(n || 0);
}

function StatCard({ label, value, sub, color, icon }) {
  return (
    <div style={{
      background: 'var(--admin-surface)', border: '1px solid var(--admin-border)',
      borderRadius: '12px', padding: '1.25rem 1.5rem',
      borderTop: `3px solid ${color || '#8B0000'}`,
    }}>
      <div style={{ fontSize: '1.6rem', marginBottom: '0.5rem' }}>{icon}</div>
      <div style={{ fontSize: '1.5rem', fontWeight: 800, color: 'var(--admin-text)', lineHeight: 1 }}>{value}</div>
      <div style={{ fontSize: '0.78rem', color: 'var(--admin-text-muted)', marginTop: '0.3rem' }}>{label}</div>
      {sub && <div style={{ fontSize: '0.7rem', color: color, fontWeight: 600, marginTop: '0.2rem' }}>{sub}</div>}
    </div>
  );
}

function ProgressBar({ pct, color }) {
  const p = Math.min(100, Math.max(0, pct || 0));
  return (
    <div style={{ background: 'var(--admin-border)', borderRadius: '6px', height: '8px', overflow: 'hidden', flex: 1 }}>
      <div style={{ width: `${p}%`, height: '100%', background: color || '#10b981', borderRadius: '6px', transition: 'width 0.4s ease' }} />
    </div>
  );
}

export default function PoaGlobalPage() {
  const supabase = createClient();
  const [gestion, setGestion] = useState(2025);
  const [resumenMunicipio, setResumenMunicipio] = useState([]);
  const [resumenGlobal, setResumenGlobal] = useState(null);
  const [loading, setLoading] = useState(true);
  const [importing, setImporting] = useState(false);
  const [importMsg, setImportMsg] = useState('');
  const [activeView, setActiveView] = useState('resumen'); // 'resumen' | 'municipios' | 'items'
  const [items, setItems] = useState([]);
  const [search, setSearch] = useState('');
  const [filterTipo, setFilterTipo] = useState('');
  const [page, setPage] = useState(0);
  const PAGE_SIZE = 60;

  const fetchResumen = useCallback(async () => {
    setLoading(true);
    try {
      const [{ data: global }, { data: municipios }] = await Promise.all([
        supabase.from('poa_resumen_global').select('*').eq('gestion', gestion).maybeSingle(),
        supabase.from('poa_resumen_municipio').select('*').eq('gestion', gestion).order('total_programado', { ascending: false }),
      ]);
      setResumenGlobal(global || null);
      setResumenMunicipio(municipios || []);
    } catch (_) { /* table not created yet */ }
    setLoading(false);
  }, [gestion]);

  const fetchItems = useCallback(async () => {
    setLoading(true);
    try {
      let q = supabase.from('poa_items').select('*').eq('gestion', gestion).order('municipio').order('prg');
      if (filterTipo) q = q.eq('tipo', filterTipo);
      if (search) q = q.ilike('descripcion', `%${search}%`);
      q = q.range(page * PAGE_SIZE, (page + 1) * PAGE_SIZE - 1);
      const { data } = await q;
      setItems(data || []);
    } catch (_) { /* table not created yet */ }
    setLoading(false);
  }, [gestion, filterTipo, search, page]);

  useEffect(() => {
    if (activeView === 'items') fetchItems();
    else fetchResumen();
  }, [activeView, fetchResumen, fetchItems]);

  const handleImport = async (e) => {
    const file = e.target.files?.[0];
    if (!file) return;
    e.target.value = '';
    setImporting(true);
    setImportMsg('Procesando archivo Excel...');
    const formData = new FormData();
    formData.append('file', file);
    formData.append('gestion', gestion);
    try {
      const res = await fetch('/api/poa/import', { method: 'POST', body: formData });
      const json = await res.json();
      if (res.ok) {
        setImportMsg(`✅ ${json.imported} registros importados de la hoja "${json.sheet}" para la gestión ${json.gestion}.`);
        fetchResumen();
      } else {
        setImportMsg(`❌ Error: ${json.error}`);
      }
    } catch (err) {
      setImportMsg(`❌ Error de red: ${err.message}`);
    } finally {
      setImporting(false);
    }
  };

  const pctGlobal = resumenGlobal?.total_programado > 0
    ? ((resumenGlobal.total_ejecutado / resumenGlobal.total_programado) * 100).toFixed(1)
    : '0.0';

  const navStyle = (v) => ({
    padding: '0.6rem 1.1rem', background: 'none', border: 'none',
    borderBottom: activeView === v ? '2px solid var(--admin-primary)' : '2px solid transparent',
    color: activeView === v ? '#FCA5A5' : 'var(--admin-text-muted)',
    fontWeight: activeView === v ? 700 : 500, cursor: 'pointer',
    fontFamily: 'Outfit, sans-serif', fontSize: '0.85rem', whiteSpace: 'nowrap',
  });

  const S_th = { padding: '0.6rem 0.75rem', textAlign: 'left', fontWeight: 700, color: 'var(--admin-text-muted)', borderBottom: '1px solid var(--admin-border)', background: 'var(--admin-surface-2)', fontSize: '0.7rem', textTransform: 'uppercase' };
  const S_td = { padding: '0.55rem 0.75rem', borderBottom: '1px solid var(--admin-border)', color: 'var(--admin-text)', fontSize: '0.78rem' };

  return (
    <div style={{ maxWidth: '1100px', display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>

      {/* Page header */}
      <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', flexWrap: 'wrap', gap: '1rem' }}>
        <div>
          <h1 style={{ fontFamily: 'Outfit, sans-serif', fontSize: '1.4rem', fontWeight: 800, color: 'var(--admin-text)', margin: 0 }}>
            📄 Plan Operativo Anual — POA
          </h1>
          <p style={{ fontSize: '0.8rem', color: 'var(--admin-text-muted)', margin: '0.25rem 0 0' }}>
            Visualiza y gestiona los datos del POA del Gobierno Departamental de Oruro.
          </p>
        </div>

        <div style={{ display: 'flex', gap: '0.75rem', alignItems: 'center', flexWrap: 'wrap' }}>
          <select value={gestion} onChange={e => { setGestion(Number(e.target.value)); setPage(0); }}
            style={{ padding: '0.5rem 0.75rem', borderRadius: '8px', border: '1px solid var(--admin-border)', background: 'var(--admin-surface-2)', color: 'var(--admin-text)', fontFamily: 'Inter, sans-serif', fontSize: '0.82rem' }}>
            {[2023, 2024, 2025, 2026].map(y => <option key={y}>{y}</option>)}
          </select>

          <label style={{ padding: '0.55rem 1.1rem', borderRadius: '8px', background: 'var(--admin-primary)', color: '#fff', fontFamily: 'Outfit, sans-serif', fontWeight: 600, cursor: 'pointer', fontSize: '0.82rem', display: 'inline-flex', alignItems: 'center', gap: '0.4rem' }}>
            {importing ? '⏳ Importando...' : '📥 Importar Excel (.xlsx)'}
            <input type="file" accept=".xlsx,.xls" style={{ display: 'none' }} onChange={handleImport} disabled={importing} />
          </label>
        </div>
      </div>

      {/* Import message */}
      {importMsg && (
        <div style={{ padding: '0.75rem 1rem', borderRadius: '8px', fontSize: '0.82rem', background: importMsg.startsWith('✅') ? 'rgba(34,197,94,0.1)' : 'rgba(239,68,68,0.1)', color: importMsg.startsWith('✅') ? '#16a34a' : '#dc2626', border: `1px solid ${importMsg.startsWith('✅') ? '#bbf7d0' : '#fecaca'}` }}>
          {importMsg}
          <button onClick={() => setImportMsg('')} style={{ marginLeft: '1rem', background: 'none', border: 'none', cursor: 'pointer', color: 'inherit' }}>✕</button>
        </div>
      )}

      {/* Global Stats */}
      {resumenGlobal && (
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(180px, 1fr))', gap: '1rem' }}>
          <StatCard icon="📋" label="Total ítems POA" value={resumenGlobal.total_items?.toLocaleString('es-BO')} color="#6366f1" />
          <StatCard icon="💰" label="Inversión programada" value={fmtBOB(resumenGlobal.total_inversion_programado)} color="#0ea5e9" />
          <StatCard icon="💵" label="Inversión ejecutada" value={fmtBOB(resumenGlobal.total_inversion_ejecutado)} color="#10b981" />
          <StatCard icon="📊" label="Total programado" value={fmtBOB(resumenGlobal.total_programado)} color="#f59e0b" />
          <StatCard icon="⚡" label="Ejecución global" value={`${pctGlobal}%`} color={Number(pctGlobal) >= 80 ? '#10b981' : Number(pctGlobal) >= 50 ? '#f59e0b' : '#ef4444'} />
        </div>
      )}

      {/* Tabs */}
      <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '14px', overflow: 'hidden' }}>
        <div style={{ display: 'flex', borderBottom: '1px solid var(--admin-border)', padding: '0 1.5rem', background: 'var(--admin-surface-2)', overflowX: 'auto' }}>
          <button style={navStyle('resumen')} onClick={() => setActiveView('resumen')}>📈 Resumen General</button>
          <button style={navStyle('municipios')} onClick={() => setActiveView('municipios')}>🗺️ Por Municipio</button>
          <button style={navStyle('items')} onClick={() => setActiveView('items')}>📋 Todos los ítems</button>
        </div>

        <div style={{ padding: '1.5rem' }}>
          {loading ? (
            <div style={{ textAlign: 'center', padding: '3rem', color: 'var(--admin-text-muted)' }}>Cargando datos del POA...</div>
          ) : (

            /* ── RESUMEN ── */
            activeView === 'resumen' && (
              <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
                <h3 style={{ fontFamily: 'Outfit, sans-serif', fontWeight: 700, color: 'var(--admin-text)', margin: 0 }}>
                  Ejecución por tipo — Gestión {gestion}
                </h3>

                {resumenGlobal ? (
                  <div style={{ display: 'flex', flexDirection: 'column', gap: '1.25rem' }}>
                    {/* Inversión */}
                    <div style={{ background: 'var(--admin-surface-2)', borderRadius: '10px', padding: '1.25rem' }}>
                      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '0.6rem' }}>
                        <span style={{ fontWeight: 700, color: 'var(--admin-text)' }}>🏗️ Inversión</span>
                        <span style={{ fontSize: '0.78rem', color: 'var(--admin-text-muted)' }}>
                          {fmtBOB(resumenGlobal.total_inversion_ejecutado)} / {fmtBOB(resumenGlobal.total_inversion_programado)}
                        </span>
                      </div>
                      <div style={{ display: 'flex', gap: '0.75rem', alignItems: 'center' }}>
                        <ProgressBar
                          pct={resumenGlobal.total_inversion_programado > 0 ? (resumenGlobal.total_inversion_ejecutado / resumenGlobal.total_inversion_programado) * 100 : 0}
                          color="#0ea5e9" />
                        <span style={{ fontSize: '0.78rem', fontWeight: 700, color: '#0ea5e9', minWidth: '40px' }}>
                          {resumenGlobal.total_inversion_programado > 0 ? ((resumenGlobal.total_inversion_ejecutado / resumenGlobal.total_inversion_programado) * 100).toFixed(1) : 0}%
                        </span>
                      </div>
                    </div>

                    {/* Gasto corriente */}
                    <div style={{ background: 'var(--admin-surface-2)', borderRadius: '10px', padding: '1.25rem' }}>
                      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '0.6rem' }}>
                        <span style={{ fontWeight: 700, color: 'var(--admin-text)' }}>📋 Gasto Corriente</span>
                        <span style={{ fontSize: '0.78rem', color: 'var(--admin-text-muted)' }}>
                          {fmtBOB(resumenGlobal.total_corriente_ejecutado)} / {fmtBOB(resumenGlobal.total_corriente_programado)}
                        </span>
                      </div>
                      <div style={{ display: 'flex', gap: '0.75rem', alignItems: 'center' }}>
                        <ProgressBar
                          pct={resumenGlobal.total_corriente_programado > 0 ? (resumenGlobal.total_corriente_ejecutado / resumenGlobal.total_corriente_programado) * 100 : 0}
                          color="#6366f1" />
                        <span style={{ fontSize: '0.78rem', fontWeight: 700, color: '#6366f1', minWidth: '40px' }}>
                          {resumenGlobal.total_corriente_programado > 0 ? ((resumenGlobal.total_corriente_ejecutado / resumenGlobal.total_corriente_programado) * 100).toFixed(1) : 0}%
                        </span>
                      </div>
                    </div>
                  </div>
                ) : (
                  <div style={{ padding: '3rem', textAlign: 'center', color: 'var(--admin-text-muted)', border: '2px dashed var(--admin-border)', borderRadius: '12px' }}>
                    <div style={{ fontSize: '2.5rem', marginBottom: '0.5rem' }}>📄</div>
                    <div style={{ fontWeight: 600 }}>No hay datos del POA para la gestión {gestion}</div>
                    <div style={{ fontSize: '0.78rem', marginTop: '0.25rem' }}>Importa un archivo Excel para comenzar.</div>
                  </div>
                )}
              </div>
            )
          )}

          {/* ── MUNICIPIOS ── */}
          {!loading && activeView === 'municipios' && (
            <div style={{ overflowX: 'auto' }}>
              {resumenMunicipio.length === 0 ? (
                <div style={{ textAlign: 'center', padding: '3rem', color: 'var(--admin-text-muted)' }}>Sin datos para la gestión {gestion}.</div>
              ) : (
                <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: '0.78rem', fontFamily: 'Inter, sans-serif' }}>
                  <thead>
                    <tr>
                      <th style={S_th}>Municipio</th>
                      <th style={S_th}>Tipo</th>
                      <th style={{ ...S_th, textAlign: 'right' }}>Ítems</th>
                      <th style={{ ...S_th, textAlign: 'right' }}>Programado</th>
                      <th style={{ ...S_th, textAlign: 'right' }}>Ejecutado</th>
                      <th style={{ ...S_th, textAlign: 'center', minWidth: '160px' }}>Ejecución</th>
                    </tr>
                  </thead>
                  <tbody>
                    {resumenMunicipio.map((row, i) => {
                      const pct = Number(row.porcentaje_ejecucion) || 0;
                      const barColor = pct >= 80 ? '#10b981' : pct >= 50 ? '#f59e0b' : '#ef4444';
                      return (
                        <tr key={i} onMouseEnter={e => e.currentTarget.style.background = 'var(--admin-surface-2)'} onMouseLeave={e => e.currentTarget.style.background = 'transparent'}>
                          <td style={{ ...S_td, fontWeight: 600 }}>{row.municipio}</td>
                          <td style={S_td}>
                            <span style={{ padding: '2px 8px', borderRadius: '12px', fontSize: '0.7rem', fontWeight: 700, color: '#fff', background: row.tipo === 'INVERSION' ? '#0ea5e9' : '#6366f1' }}>
                              {row.tipo === 'INVERSION' ? 'Inversión' : 'Corriente'}
                            </span>
                          </td>
                          <td style={{ ...S_td, textAlign: 'right' }}>{row.cantidad_items}</td>
                          <td style={{ ...S_td, textAlign: 'right', fontWeight: 600 }}>{fmtBOB(row.total_programado)}</td>
                          <td style={{ ...S_td, textAlign: 'right', color: '#10b981', fontWeight: 600 }}>{fmtBOB(row.total_ejecutado)}</td>
                          <td style={{ ...S_td }}>
                            <div style={{ display: 'flex', gap: '0.5rem', alignItems: 'center' }}>
                              <ProgressBar pct={pct} color={barColor} />
                              <span style={{ fontSize: '0.7rem', fontWeight: 700, color: barColor, minWidth: '40px' }}>{pct.toFixed(1)}%</span>
                            </div>
                          </td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              )}
            </div>
          )}

          {/* ── TODOS LOS ÍTEMS ── */}
          {!loading && activeView === 'items' && (
            <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
              <div style={{ display: 'flex', gap: '0.75rem', flexWrap: 'wrap' }}>
                <input style={{ flex: '1 1 200px', padding: '0.5rem 0.75rem', borderRadius: '8px', border: '1px solid var(--admin-border)', background: 'var(--admin-surface-2)', color: 'var(--admin-text)', fontFamily: 'Inter, sans-serif', fontSize: '0.82rem' }} placeholder="🔍 Buscar descripción..." value={search} onChange={e => { setSearch(e.target.value); setPage(0); }} />
                <select style={{ padding: '0.5rem 0.75rem', borderRadius: '8px', border: '1px solid var(--admin-border)', background: 'var(--admin-surface-2)', color: 'var(--admin-text)' }} value={filterTipo} onChange={e => { setFilterTipo(e.target.value); setPage(0); }}>
                  <option value="">Todos los tipos</option>
                  <option value="INVERSION">Inversión</option>
                  <option value="GASTO CORRIENTE">Gasto Corriente</option>
                </select>
              </div>
              <div style={{ overflowX: 'auto', border: '1px solid var(--admin-border)', borderRadius: '10px' }}>
                <table style={{ width: '100%', borderCollapse: 'collapse', fontSize: '0.78rem', fontFamily: 'Inter, sans-serif' }}>
                  <thead>
                    <tr>
                      <th style={S_th}>Municipio</th>
                      <th style={S_th}>PRG</th>
                      <th style={S_th}>Tipo</th>
                      <th style={S_th}>Descripción</th>
                      <th style={{ ...S_th, textAlign: 'right' }}>Programado</th>
                      <th style={{ ...S_th, textAlign: 'right' }}>Ejecutado</th>
                      <th style={{ ...S_th, textAlign: 'center' }}>Avance</th>
                    </tr>
                  </thead>
                  <tbody>
                    {items.length === 0 ? (
                      <tr><td colSpan={7} style={{ ...S_td, textAlign: 'center', padding: '2rem', color: 'var(--admin-text-muted)' }}>Sin resultados</td></tr>
                    ) : items.map(item => (
                      <tr key={item.id} onMouseEnter={e => e.currentTarget.style.background = 'var(--admin-surface-2)'} onMouseLeave={e => e.currentTarget.style.background = 'transparent'}>
                        <td style={S_td}>{item.municipio}</td>
                        <td style={S_td}>{item.prg}</td>
                        <td style={S_td}><span style={{ padding: '2px 8px', borderRadius: '12px', fontSize: '0.7rem', fontWeight: 700, color: '#fff', background: item.tipo === 'INVERSION' ? '#0ea5e9' : '#6366f1' }}>{item.tipo === 'INVERSION' ? 'Inversión' : 'Corriente'}</span></td>
                        <td style={{ ...S_td, maxWidth: '300px', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }} title={item.descripcion}>{item.descripcion}</td>
                        <td style={{ ...S_td, textAlign: 'right', fontWeight: 600 }}>{fmtBOB(item.monto_programado)}</td>
                        <td style={{ ...S_td, textAlign: 'right', color: '#10b981', fontWeight: 600 }}>{fmtBOB(item.monto_ejecutado)}</td>
                        <td style={{ ...S_td, textAlign: 'center' }}>
                          <div style={{ display: 'flex', gap: '0.3rem', alignItems: 'center', justifyContent: 'center' }}>
                            <div style={{ width: '45px', height: '5px', background: 'var(--admin-border)', borderRadius: '3px', overflow: 'hidden' }}>
                              <div style={{ width: `${item.avance_fisico || 0}%`, height: '100%', background: '#10b981' }} />
                            </div>
                            <span style={{ fontSize: '0.68rem', color: 'var(--admin-text-muted)' }}>{item.avance_fisico || 0}%</span>
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              <div style={{ display: 'flex', gap: '0.5rem', justifyContent: 'center', alignItems: 'center' }}>
                <button onClick={() => setPage(p => Math.max(0, p - 1))} disabled={page === 0} style={{ padding: '0.4rem 0.8rem', borderRadius: '6px', border: '1px solid var(--admin-border)', background: 'var(--admin-surface-2)', color: 'var(--admin-text)', cursor: 'pointer' }}>← Anterior</button>
                <span style={{ fontSize: '0.78rem', color: 'var(--admin-text-muted)' }}>Página {page + 1}</span>
                <button onClick={() => setPage(p => p + 1)} disabled={items.length < PAGE_SIZE} style={{ padding: '0.4rem 0.8rem', borderRadius: '6px', border: '1px solid var(--admin-border)', background: 'var(--admin-surface-2)', color: 'var(--admin-text)', cursor: 'pointer' }}>Siguiente →</button>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

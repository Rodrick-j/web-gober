'use client';
import { useState, useEffect, useCallback } from 'react';
import { createClient } from '@/lib/supabase/client';

// ─── helpers ────────────────────────────────────────────────────────────────
function parseMonto(val) {
  if (val === undefined || val === null || val === '') return 0;
  if (typeof val === 'number') return val;
  if (typeof val === 'string') return Number(val.replace(/,/g, '')) || 0;
  return 0;
}

function fmtBOB(n) {
  return new Intl.NumberFormat('es-BO', { style: 'currency', currency: 'BOB', maximumFractionDigits: 0 }).format(n || 0);
}

// ─── Inline styles ──────────────────────────────────────────────────────────
const S = {
  badge: (color) => ({
    display: 'inline-block', padding: '2px 8px', borderRadius: '12px',
    fontSize: '0.7rem', fontWeight: 700, color: '#fff',
    background: color || '#555',
  }),
  btn: (variant = 'primary') => ({
    padding: '0.55rem 1.1rem', borderRadius: '8px', border: 'none',
    fontFamily: 'Outfit, sans-serif', fontWeight: 600, cursor: 'pointer', fontSize: '0.82rem',
    background: variant === 'primary' ? 'var(--admin-primary)' :
                variant === 'danger'  ? '#dc2626' :
                variant === 'ghost'   ? 'transparent' : 'var(--admin-surface-2)',
    color: variant === 'ghost' ? 'var(--admin-text-muted)' : '#fff',
    border: variant === 'ghost' ? '1px solid var(--admin-border)' : 'none',
  }),
  input: {
    padding: '0.5rem 0.75rem', borderRadius: '8px', border: '1px solid var(--admin-border)',
    background: 'var(--admin-surface-2)', color: 'var(--admin-text)',
    fontFamily: 'Inter, sans-serif', fontSize: '0.82rem', width: '100%',
  },
  table: {
    width: '100%', borderCollapse: 'collapse', fontSize: '0.78rem',
    fontFamily: 'Inter, sans-serif',
  },
  th: {
    padding: '0.6rem 0.75rem', textAlign: 'left', fontWeight: 700,
    color: 'var(--admin-text-muted)', borderBottom: '1px solid var(--admin-border)',
    background: 'var(--admin-surface-2)', fontSize: '0.7rem', textTransform: 'uppercase',
  },
  td: {
    padding: '0.55rem 0.75rem', borderBottom: '1px solid var(--admin-border)',
    color: 'var(--admin-text)',
  },
};

// ─── StatCard ────────────────────────────────────────────────────────────────
function StatCard({ label, value, color }) {
  return (
    <div style={{
      background: 'var(--admin-surface-2)', borderRadius: '10px',
      padding: '1rem 1.25rem', borderLeft: `4px solid ${color || '#8B0000'}`,
    }}>
      <div style={{ fontSize: '0.72rem', color: 'var(--admin-text-muted)', textTransform: 'uppercase', fontWeight: 600 }}>{label}</div>
      <div style={{ fontSize: '1.15rem', fontWeight: 800, color: 'var(--admin-text)', marginTop: '0.3rem' }}>{value}</div>
    </div>
  );
}

// ─── Main Component ──────────────────────────────────────────────────────────
export default function PoaManager({ secretariaId }) {
  const supabase = createClient();

  const [items, setItems] = useState([]);
  const [loading, setLoading] = useState(true);
  const [importing, setImporting] = useState(false);
  const [importMsg, setImportMsg] = useState('');
  const [search, setSearch] = useState('');
  const [filterTipo, setFilterTipo] = useState('');
  const [filterMunicipio, setFilterMunicipio] = useState('');
  const [gestion, setGestion] = useState(2025);
  const [page, setPage] = useState(0);
  const PAGE_SIZE = 50;

  // ── Edit modal ──────────────────────────────────────────────────────────────
  const [editing, setEditing] = useState(null); // item being edited
  const [editData, setEditData] = useState({});
  const [saving, setSaving] = useState(false);

  const fetchItems = useCallback(async () => {
    setLoading(true);
    try {
      let q = supabase
        .from('poa_items')
        .select('*', { count: 'exact' })
        .eq('gestion', gestion)
        .order('municipio').order('prg').order('proyecto').order('actividad');

      if (secretariaId) q = q.eq('secretaria_id', secretariaId);
      if (filterTipo) q = q.eq('tipo', filterTipo);
      if (filterMunicipio) q = q.ilike('municipio', `%${filterMunicipio}%`);
      if (search) q = q.ilike('descripcion', `%${search}%`);

      q = q.range(page * PAGE_SIZE, (page + 1) * PAGE_SIZE - 1);

      const { data, error } = await q;
      if (!error) setItems(data || []);
    } catch (_) { /* table not created yet */ }
    setLoading(false);
  }, [gestion, filterTipo, filterMunicipio, search, page, secretariaId]);

  useEffect(() => { fetchItems(); }, [fetchItems]);

  // ── Stats ──────────────────────────────────────────────────────────────────
  const totalProgramado = items.reduce((a, x) => a + (x.monto_programado || 0), 0);
  const totalEjecutado  = items.reduce((a, x) => a + (x.monto_ejecutado  || 0), 0);
  const pctEjecucion    = totalProgramado > 0 ? ((totalEjecutado / totalProgramado) * 100).toFixed(1) : '0.0';
  const municipios      = [...new Set(items.map(x => x.municipio).filter(Boolean))];

  // ── Import Excel ──────────────────────────────────────────────────────────
  const handleImport = async (e) => {
    const file = e.target.files?.[0];
    if (!file) return;
    e.target.value = '';

    setImporting(true);
    setImportMsg('Leyendo archivo Excel...');

    const formData = new FormData();
    formData.append('file', file);
    formData.append('gestion', gestion);
    if (secretariaId) formData.append('secretaria_id', secretariaId);

    try {
      const res = await fetch('/api/poa/import', { method: 'POST', body: formData });
      const json = await res.json();
      if (res.ok) {
        setImportMsg(`✅ ${json.imported} registros importados correctamente.`);
        fetchItems();
      } else {
        setImportMsg(`❌ Error: ${json.error}`);
      }
    } catch (err) {
      setImportMsg(`❌ Error de red: ${err.message}`);
    } finally {
      setImporting(false);
    }
  };

  // ── Edit handlers ─────────────────────────────────────────────────────────
  const openEdit = (item) => {
    setEditing(item);
    setEditData({
      descripcion:      item.descripcion,
      monto_programado: item.monto_programado,
      monto_ejecutado:  item.monto_ejecutado,
      avance_fisico:    item.avance_fisico,
      es_publico:       item.es_publico,
    });
  };

  const handleSave = async () => {
    setSaving(true);
    const { error } = await supabase
      .from('poa_items')
      .update({ ...editData, updated_at: new Date() })
      .eq('id', editing.id);
    setSaving(false);
    if (!error) { setEditing(null); fetchItems(); }
    else alert('Error: ' + error.message);
  };

  const handleDelete = async (id) => {
    if (!confirm('¿Eliminar este ítem del POA?')) return;
    await supabase.from('poa_items').delete().eq('id', id);
    fetchItems();
  };

  // ── Render ────────────────────────────────────────────────────────────────
  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>

      {/* Header */}
      <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', flexWrap: 'wrap', gap: '1rem' }}>
        <div>
          <h2 style={{ fontFamily: 'Outfit, sans-serif', fontSize: '1.1rem', fontWeight: 800, color: 'var(--admin-text)', margin: 0 }}>
            📄 Plan Operativo Anual (POA)
          </h2>
          <p style={{ fontSize: '0.78rem', color: 'var(--admin-text-muted)', margin: '0.25rem 0 0' }}>
            Gestiona y actualiza los datos del POA. Puedes importar directamente desde un archivo Excel.
          </p>
        </div>

        <div style={{ display: 'flex', gap: '0.75rem', alignItems: 'center', flexWrap: 'wrap' }}>
          {/* Gestión selector */}
          <select value={gestion} onChange={e => { setGestion(Number(e.target.value)); setPage(0); }}
            style={{ ...S.input, width: 'auto', padding: '0.5rem 0.75rem' }}>
            {[2023, 2024, 2025, 2026].map(y => <option key={y}>{y}</option>)}
          </select>

          {/* Import button */}
          <label style={{ ...S.btn('primary'), display: 'inline-flex', alignItems: 'center', gap: '0.4rem', cursor: 'pointer' }}>
            {importing ? '⏳ Importando...' : '📥 Importar Excel'}
            <input type="file" accept=".xlsx,.xls" style={{ display: 'none' }} onChange={handleImport} disabled={importing} />
          </label>
        </div>
      </div>

      {/* Import status message */}
      {importMsg && (
        <div style={{
          padding: '0.75rem 1rem', borderRadius: '8px', fontSize: '0.82rem',
          background: importMsg.startsWith('✅') ? 'rgba(34,197,94,0.1)' : 'rgba(239,68,68,0.1)',
          color: importMsg.startsWith('✅') ? '#16a34a' : '#dc2626',
          border: `1px solid ${importMsg.startsWith('✅') ? '#bbf7d0' : '#fecaca'}`,
        }}>
          {importMsg}
          <button onClick={() => setImportMsg('')} style={{ marginLeft: '1rem', background: 'none', border: 'none', cursor: 'pointer', color: 'inherit' }}>✕</button>
        </div>
      )}

      {/* Stats */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(160px, 1fr))', gap: '1rem' }}>
        <StatCard label="Ítems cargados" value={items.length} color="#6366f1" />
        <StatCard label="Total programado" value={fmtBOB(totalProgramado)} color="#0ea5e9" />
        <StatCard label="Total ejecutado" value={fmtBOB(totalEjecutado)} color="#10b981" />
        <StatCard label="% Ejecución" value={`${pctEjecucion}%`} color={Number(pctEjecucion) >= 80 ? '#10b981' : Number(pctEjecucion) >= 50 ? '#f59e0b' : '#ef4444'} />
      </div>

      {/* Filters */}
      <div style={{ display: 'flex', gap: '0.75rem', flexWrap: 'wrap' }}>
        <input style={{ ...S.input, flex: '1 1 200px' }} placeholder="🔍 Buscar descripción..." value={search}
          onChange={e => { setSearch(e.target.value); setPage(0); }} />
        <select style={{ ...S.input, flex: '0 0 180px' }} value={filterTipo}
          onChange={e => { setFilterTipo(e.target.value); setPage(0); }}>
          <option value="">Todos los tipos</option>
          <option value="INVERSION">Inversión</option>
          <option value="GASTO CORRIENTE">Gasto Corriente</option>
        </select>
        <input style={{ ...S.input, flex: '0 0 180px' }} placeholder="Municipio..." value={filterMunicipio}
          onChange={e => { setFilterMunicipio(e.target.value); setPage(0); }} />
      </div>

      {/* Table */}
      <div style={{ overflowX: 'auto', border: '1px solid var(--admin-border)', borderRadius: '10px' }}>
        {loading ? (
          <div style={{ padding: '3rem', textAlign: 'center', color: 'var(--admin-text-muted)' }}>Cargando POA...</div>
        ) : items.length === 0 ? (
          <div style={{ padding: '3rem', textAlign: 'center', color: 'var(--admin-text-muted)' }}>
            <div style={{ fontSize: '2.5rem', marginBottom: '0.5rem' }}>📄</div>
            <div style={{ fontWeight: 600 }}>No hay datos del POA para la gestión {gestion}</div>
            <div style={{ fontSize: '0.78rem', marginTop: '0.25rem' }}>Importa un archivo Excel para comenzar.</div>
          </div>
        ) : (
          <table style={S.table}>
            <thead>
              <tr>
                <th style={S.th}>Municipio</th>
                <th style={S.th}>PRG</th>
                <th style={S.th}>Proy/Act</th>
                <th style={S.th}>Tipo</th>
                <th style={S.th}>Descripción</th>
                <th style={{ ...S.th, textAlign: 'right' }}>Programado</th>
                <th style={{ ...S.th, textAlign: 'right' }}>Ejecutado</th>
                <th style={{ ...S.th, textAlign: 'center' }}>Avance</th>
                <th style={{ ...S.th, textAlign: 'center' }}>Acciones</th>
              </tr>
            </thead>
            <tbody>
              {items.map(item => (
                <tr key={item.id} style={{ transition: 'background 0.15s' }}
                  onMouseEnter={e => e.currentTarget.style.background = 'var(--admin-surface-2)'}
                  onMouseLeave={e => e.currentTarget.style.background = 'transparent'}>
                  <td style={S.td}>{item.municipio}</td>
                  <td style={S.td}>{item.prg}</td>
                  <td style={{ ...S.td, fontFamily: 'monospace', fontSize: '0.72rem' }}>{item.proyecto}-{item.actividad}</td>
                  <td style={S.td}>
                    <span style={S.badge(item.tipo === 'INVERSION' ? '#0ea5e9' : '#6366f1')}>
                      {item.tipo === 'INVERSION' ? 'Inversión' : 'Corriente'}
                    </span>
                  </td>
                  <td style={{ ...S.td, maxWidth: '280px', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}
                    title={item.descripcion}>{item.descripcion}</td>
                  <td style={{ ...S.td, textAlign: 'right', fontWeight: 600 }}>{fmtBOB(item.monto_programado)}</td>
                  <td style={{ ...S.td, textAlign: 'right', color: '#10b981', fontWeight: 600 }}>{fmtBOB(item.monto_ejecutado)}</td>
                  <td style={{ ...S.td, textAlign: 'center' }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '0.4rem', justifyContent: 'center' }}>
                      <div style={{ width: '50px', height: '5px', background: 'var(--admin-border)', borderRadius: '3px', overflow: 'hidden' }}>
                        <div style={{ width: `${item.avance_fisico || 0}%`, height: '100%', background: '#10b981', borderRadius: '3px' }} />
                      </div>
                      <span style={{ fontSize: '0.7rem', color: 'var(--admin-text-muted)' }}>{item.avance_fisico || 0}%</span>
                    </div>
                  </td>
                  <td style={{ ...S.td, textAlign: 'center' }}>
                    <div style={{ display: 'flex', gap: '0.4rem', justifyContent: 'center' }}>
                      <button onClick={() => openEdit(item)} style={{ ...S.btn('ghost'), padding: '0.3rem 0.6rem', fontSize: '0.72rem' }}>✏️</button>
                      <button onClick={() => handleDelete(item.id)} style={{ ...S.btn('danger'), padding: '0.3rem 0.6rem', fontSize: '0.72rem' }}>🗑️</button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>

      {/* Pagination */}
      {items.length > 0 && (
        <div style={{ display: 'flex', gap: '0.5rem', justifyContent: 'center', alignItems: 'center' }}>
          <button style={S.btn('ghost')} onClick={() => setPage(p => Math.max(0, p - 1))} disabled={page === 0}>← Anterior</button>
          <span style={{ fontSize: '0.8rem', color: 'var(--admin-text-muted)' }}>Página {page + 1}</span>
          <button style={S.btn('ghost')} onClick={() => setPage(p => p + 1)} disabled={items.length < PAGE_SIZE}>Siguiente →</button>
        </div>
      )}

      {/* Edit Modal */}
      {editing && (
        <div style={{
          position: 'fixed', inset: 0, background: 'rgba(0,0,0,0.6)', zIndex: 1000,
          display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '1rem',
        }} onClick={e => { if (e.target === e.currentTarget) setEditing(null); }}>
          <div style={{
            background: 'var(--admin-surface)', border: '1px solid var(--admin-border)',
            borderRadius: '14px', padding: '2rem', width: '100%', maxWidth: '520px',
            boxShadow: '0 20px 60px rgba(0,0,0,0.4)',
          }}>
            <h3 style={{ fontFamily: 'Outfit, sans-serif', fontWeight: 800, color: 'var(--admin-text)', margin: '0 0 1.25rem' }}>
              ✏️ Editar ítem POA
            </h3>

            <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
              <div>
                <label style={{ fontSize: '0.75rem', color: 'var(--admin-text-muted)', fontWeight: 600, display: 'block', marginBottom: '0.35rem' }}>DESCRIPCIÓN</label>
                <textarea value={editData.descripcion} onChange={e => setEditData(p => ({ ...p, descripcion: e.target.value }))}
                  style={{ ...S.input, resize: 'vertical', minHeight: '70px' }} />
              </div>
              <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1rem' }}>
                <div>
                  <label style={{ fontSize: '0.75rem', color: 'var(--admin-text-muted)', fontWeight: 600, display: 'block', marginBottom: '0.35rem' }}>MONTO PROGRAMADO (BOB)</label>
                  <input type="number" step="0.01" value={editData.monto_programado}
                    onChange={e => setEditData(p => ({ ...p, monto_programado: parseFloat(e.target.value) || 0 }))} style={S.input} />
                </div>
                <div>
                  <label style={{ fontSize: '0.75rem', color: 'var(--admin-text-muted)', fontWeight: 600, display: 'block', marginBottom: '0.35rem' }}>MONTO EJECUTADO (BOB)</label>
                  <input type="number" step="0.01" value={editData.monto_ejecutado}
                    onChange={e => setEditData(p => ({ ...p, monto_ejecutado: parseFloat(e.target.value) || 0 }))} style={S.input} />
                </div>
              </div>
              <div>
                <label style={{ fontSize: '0.75rem', color: 'var(--admin-text-muted)', fontWeight: 600, display: 'block', marginBottom: '0.35rem' }}>AVANCE FÍSICO (%)</label>
                <input type="number" min="0" max="100" value={editData.avance_fisico}
                  onChange={e => setEditData(p => ({ ...p, avance_fisico: parseFloat(e.target.value) || 0 }))} style={S.input} />
              </div>
              <label style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', cursor: 'pointer', fontSize: '0.82rem', color: 'var(--admin-text)' }}>
                <input type="checkbox" checked={editData.es_publico}
                  onChange={e => setEditData(p => ({ ...p, es_publico: e.target.checked }))} />
                Visible al público
              </label>
            </div>

            <div style={{ display: 'flex', gap: '0.75rem', justifyContent: 'flex-end', marginTop: '1.5rem' }}>
              <button style={S.btn('ghost')} onClick={() => setEditing(null)}>Cancelar</button>
              <button style={S.btn('primary')} onClick={handleSave} disabled={saving}>
                {saving ? 'Guardando...' : '✓ Guardar cambios'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

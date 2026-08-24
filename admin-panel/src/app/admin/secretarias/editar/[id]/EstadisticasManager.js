'use client';
import { useState, useEffect, useCallback } from 'react';
import { createClient } from '@/lib/supabase/client';

const EMOJIS = ['📊', '🏗️', '👥', '💰', '🚀', '✅', '📈', '🌿', '⚡', '🏥', '🏫', '🛣️', '💧', '🔬', '📋'];

const S = {
  btn: (v = 'primary') => ({
    padding: '0.55rem 1.1rem', borderRadius: '8px', border: 'none',
    fontFamily: 'Outfit, sans-serif', fontWeight: 600, cursor: 'pointer', fontSize: '0.82rem',
    background: v === 'primary' ? 'var(--admin-primary)' : v === 'danger' ? '#dc2626' : 'var(--admin-surface-2)',
    color: v === 'ghost' ? 'var(--admin-text)' : '#fff',
    border: v === 'ghost' ? '1px solid var(--admin-border)' : 'none',
  }),
  input: {
    padding: '0.5rem 0.75rem', borderRadius: '8px', border: '1px solid var(--admin-border)',
    background: 'var(--admin-surface-2)', color: 'var(--admin-text)',
    fontFamily: 'Inter, sans-serif', fontSize: '0.82rem', width: '100%', boxSizing: 'border-box',
  },
  label: { fontSize: '0.72rem', color: 'var(--admin-text-muted)', fontWeight: 700, display: 'block', marginBottom: '0.35rem', textTransform: 'uppercase' },
};

const defaultForm = { titulo: '', valor: '', unidad: '', icono: '📊', descripcion: '', color: '#8B0000', periodo: '2025', orden: 0, es_publico: true };

// ── Preview card ──────────────────────────────────────────────────────────────
function PreviewCard({ stat }) {
  return (
    <div style={{
      background: 'var(--admin-surface-2)', borderRadius: '12px', padding: '1.25rem',
      borderLeft: `4px solid ${stat.color || '#8B0000'}`, display: 'flex', alignItems: 'flex-start', gap: '1rem',
    }}>
      <div style={{ fontSize: '2rem', lineHeight: 1 }}>{stat.icono}</div>
      <div style={{ flex: 1, minWidth: 0 }}>
        <div style={{ fontSize: '1.4rem', fontWeight: 800, color: 'var(--admin-text)', lineHeight: 1 }}>
          {stat.valor || '–'}{stat.unidad ? <span style={{ fontSize: '0.9rem', fontWeight: 500, opacity: 0.7 }}> {stat.unidad}</span> : null}
        </div>
        <div style={{ fontSize: '0.78rem', fontWeight: 600, color: 'var(--admin-text)', marginTop: '0.2rem' }}>{stat.titulo || 'Título del indicador'}</div>
        {stat.descripcion && <div style={{ fontSize: '0.7rem', color: 'var(--admin-text-muted)', marginTop: '0.15rem' }}>{stat.descripcion}</div>}
        <div style={{ fontSize: '0.65rem', color: 'var(--admin-text-muted)', marginTop: '0.25rem', opacity: 0.6 }}>{stat.periodo}</div>
      </div>
    </div>
  );
}

export default function EstadisticasManager({ secretariaId }) {
  const supabase = createClient();
  const [stats, setStats] = useState([]);
  const [loading, setLoading] = useState(true);
  const [showForm, setShowForm] = useState(false);
  const [form, setForm] = useState(defaultForm);
  const [editId, setEditId] = useState(null);
  const [saving, setSaving] = useState(false);

  const fetch = useCallback(async () => {
    setLoading(true);
    try {
      const { data, error } = await supabase
        .from('estadisticas_secretarias')
        .select('*')
        .eq('secretaria_id', secretariaId)
        .order('orden');
      if (!error && data) setStats(data);
    } catch (_) { /* table not created yet */ }
    setLoading(false);
  }, [secretariaId]);

  useEffect(() => { fetch(); }, [fetch]);

  const openNew = () => {
    setEditId(null);
    setForm({ ...defaultForm, orden: stats.length });
    setShowForm(true);
  };

  const openEdit = (s) => {
    setEditId(s.id);
    setForm({ titulo: s.titulo, valor: s.valor, unidad: s.unidad || '', icono: s.icono, descripcion: s.descripcion || '', color: s.color, periodo: s.periodo, orden: s.orden, es_publico: s.es_publico });
    setShowForm(true);
  };

  const handleSave = async () => {
    if (!form.titulo || !form.valor) { alert('Título y Valor son obligatorios.'); return; }
    setSaving(true);
    const payload = { ...form, secretaria_id: secretariaId, updated_at: new Date() };
    const { error } = editId
      ? await supabase.from('estadisticas_secretarias').update(payload).eq('id', editId)
      : await supabase.from('estadisticas_secretarias').insert(payload);
    setSaving(false);
    if (error) { alert('Error: ' + error.message); return; }
    setShowForm(false);
    fetch();
  };

  const handleDelete = async (id) => {
    if (!confirm('¿Eliminar este indicador?')) return;
    await supabase.from('estadisticas_secretarias').delete().eq('id', id);
    fetch();
  };

  const moveOrder = async (id, direction) => {
    const idx = stats.findIndex(s => s.id === id);
    if ((direction === -1 && idx === 0) || (direction === 1 && idx === stats.length - 1)) return;
    const other = stats[idx + direction];
    await supabase.from('estadisticas_secretarias').update({ orden: other.orden }).eq('id', id);
    await supabase.from('estadisticas_secretarias').update({ orden: stats[idx].orden }).eq('id', other.id);
    fetch();
  };

  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
      {/* Header */}
      <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', gap: '1rem' }}>
        <div>
          <h2 style={{ fontFamily: 'Outfit, sans-serif', fontSize: '1.1rem', fontWeight: 800, color: 'var(--admin-text)', margin: 0 }}>
            📊 Estadísticas e Indicadores
          </h2>
          <p style={{ fontSize: '0.78rem', color: 'var(--admin-text-muted)', margin: '0.25rem 0 0' }}>
            Los indicadores que añadas aquí aparecerán en la página pública de esta Secretaría.
          </p>
        </div>
        <button style={S.btn('primary')} onClick={openNew}>+ Nuevo indicador</button>
      </div>

      {/* Stats grid */}
      {loading ? (
        <div style={{ padding: '2rem', textAlign: 'center', color: 'var(--admin-text-muted)' }}>Cargando estadísticas...</div>
      ) : stats.length === 0 ? (
        <div style={{ padding: '3rem', textAlign: 'center', color: 'var(--admin-text-muted)', border: '2px dashed var(--admin-border)', borderRadius: '12px' }}>
          <div style={{ fontSize: '3rem', marginBottom: '0.5rem' }}>📊</div>
          <div style={{ fontWeight: 600 }}>Aún no hay indicadores</div>
          <div style={{ fontSize: '0.78rem', marginTop: '0.25rem' }}>Haz clic en "+ Nuevo indicador" para agregar el primero.</div>
        </div>
      ) : (
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(280px, 1fr))', gap: '1rem' }}>
          {stats.map((s, i) => (
            <div key={s.id} style={{ position: 'relative' }}>
              <PreviewCard stat={s} />
              {/* Controls */}
              <div style={{ position: 'absolute', top: '0.5rem', right: '0.5rem', display: 'flex', gap: '0.3rem' }}>
                <button onClick={() => moveOrder(s.id, -1)} title="Subir" style={{ ...S.btn('ghost'), padding: '0.25rem 0.4rem', fontSize: '0.7rem' }} disabled={i === 0}>↑</button>
                <button onClick={() => moveOrder(s.id, 1)} title="Bajar" style={{ ...S.btn('ghost'), padding: '0.25rem 0.4rem', fontSize: '0.7rem' }} disabled={i === stats.length - 1}>↓</button>
                <button onClick={() => openEdit(s)} style={{ ...S.btn('ghost'), padding: '0.25rem 0.4rem', fontSize: '0.7rem' }}>✏️</button>
                <button onClick={() => handleDelete(s.id)} style={{ ...S.btn('danger'), padding: '0.25rem 0.4rem', fontSize: '0.7rem' }}>🗑️</button>
              </div>
              {!s.es_publico && (
                <div style={{ position: 'absolute', bottom: '0.5rem', right: '0.5rem', fontSize: '0.65rem', background: '#f59e0b', color: '#fff', borderRadius: '4px', padding: '1px 5px', fontWeight: 700 }}>OCULTO</div>
              )}
            </div>
          ))}
        </div>
      )}

      {/* Form Modal */}
      {showForm && (
        <div style={{ position: 'fixed', inset: 0, background: 'rgba(0,0,0,0.6)', zIndex: 1000, display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '1rem' }}
          onClick={e => { if (e.target === e.currentTarget) setShowForm(false); }}>
          <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '14px', padding: '2rem', width: '100%', maxWidth: '580px', boxShadow: '0 20px 60px rgba(0,0,0,0.4)', maxHeight: '90vh', overflowY: 'auto' }}>
            <h3 style={{ fontFamily: 'Outfit, sans-serif', fontWeight: 800, color: 'var(--admin-text)', margin: '0 0 1.5rem' }}>
              {editId ? '✏️ Editar indicador' : '+ Nuevo indicador'}
            </h3>

            {/* Live Preview */}
            <div style={{ marginBottom: '1.5rem' }}>
              <label style={S.label}>Vista previa</label>
              <PreviewCard stat={form} />
            </div>

            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1rem' }}>
              <div style={{ gridColumn: '1 / -1' }}>
                <label style={S.label}>Título del indicador *</label>
                <input style={S.input} value={form.titulo} onChange={e => setForm(p => ({ ...p, titulo: e.target.value }))} placeholder="Ej: Obras entregadas" />
              </div>
              <div>
                <label style={S.label}>Valor *</label>
                <input style={S.input} value={form.valor} onChange={e => setForm(p => ({ ...p, valor: e.target.value }))} placeholder="Ej: 142" />
              </div>
              <div>
                <label style={S.label}>Unidad</label>
                <input style={S.input} value={form.unidad} onChange={e => setForm(p => ({ ...p, unidad: e.target.value }))} placeholder="Ej: proyectos, km, %..." />
              </div>
              <div style={{ gridColumn: '1 / -1' }}>
                <label style={S.label}>Descripción breve</label>
                <input style={S.input} value={form.descripcion} onChange={e => setForm(p => ({ ...p, descripcion: e.target.value }))} placeholder="Ej: ejecutadas en todo el departamento" />
              </div>
              <div>
                <label style={S.label}>Período</label>
                <input style={S.input} value={form.periodo} onChange={e => setForm(p => ({ ...p, periodo: e.target.value }))} placeholder="Ej: 2025, Enero 2025..." />
              </div>
              <div>
                <label style={S.label}>Color de acento</label>
                <input type="color" style={{ ...S.input, height: '44px', padding: '2px 6px', cursor: 'pointer' }} value={form.color} onChange={e => setForm(p => ({ ...p, color: e.target.value }))} />
              </div>
              <div style={{ gridColumn: '1 / -1' }}>
                <label style={S.label}>Ícono (emoji)</label>
                <div style={{ display: 'flex', gap: '0.5rem', flexWrap: 'wrap', marginBottom: '0.5rem' }}>
                  {EMOJIS.map(e => (
                    <button key={e} type="button" onClick={() => setForm(p => ({ ...p, icono: e }))}
                      style={{ fontSize: '1.3rem', background: form.icono === e ? 'var(--admin-primary)' : 'var(--admin-surface-2)', border: '1px solid var(--admin-border)', borderRadius: '8px', padding: '0.3rem 0.5rem', cursor: 'pointer' }}>
                      {e}
                    </button>
                  ))}
                </div>
                <input style={S.input} value={form.icono} onChange={e => setForm(p => ({ ...p, icono: e.target.value }))} placeholder="O escribe tu propio emoji..." />
              </div>
              <div>
                <label style={S.label}>Orden</label>
                <input type="number" style={S.input} value={form.orden} onChange={e => setForm(p => ({ ...p, orden: parseInt(e.target.value) || 0 }))} />
              </div>
              <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', paddingTop: '1.5rem' }}>
                <input type="checkbox" id="es_publico_est" checked={form.es_publico} onChange={e => setForm(p => ({ ...p, es_publico: e.target.checked }))} />
                <label htmlFor="es_publico_est" style={{ fontSize: '0.82rem', color: 'var(--admin-text)', cursor: 'pointer' }}>Visible al público</label>
              </div>
            </div>

            <div style={{ display: 'flex', gap: '0.75rem', justifyContent: 'flex-end', marginTop: '1.5rem' }}>
              <button style={S.btn('ghost')} onClick={() => setShowForm(false)}>Cancelar</button>
              <button style={S.btn('primary')} onClick={handleSave} disabled={saving}>
                {saving ? 'Guardando...' : '✓ Guardar indicador'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

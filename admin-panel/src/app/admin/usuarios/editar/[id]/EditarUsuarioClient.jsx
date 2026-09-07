'use client';
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { createClient } from '@/lib/supabase/client';

const ROLES = [
  { value: 'secretaria_admin', label: '🏛️ Admin de Secretaría', desc: 'Solo accede a su secretaría asignada' },
  { value: 'super_admin', label: '🛡️ Super Administrador', desc: 'Acceso total al panel y todas las secretarías' },
];

export default function EditarUsuarioClient({ usuario, secretarias }) {
  const router = useRouter();
  const [form, setForm] = useState({
    nombre: usuario.nombre || '',
    apellido: usuario.apellido || '',
    email: usuario.email || '',
    cargo: usuario.cargo || '',
    telefono: usuario.telefono || '',
    rol: usuario.rol || 'secretaria_admin',
    secretaria_id: usuario.secretaria_id || '',
    activo: usuario.activo ?? true,
  });
  const [loading, setLoading] = useState(false);
  const [deleting, setDeleting] = useState(false);
  const [msg, setMsg] = useState(null);

  const handleChange = (e) => {
    const val = e.target.type === 'checkbox' ? e.target.checked : e.target.value;
    setForm(prev => ({ ...prev, [e.target.name]: val }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setMsg(null);
    try {
      const supabase = createClient();
      const updateData = {
        nombre: form.nombre,
        apellido: form.apellido || null,
        cargo: form.cargo || null,
        telefono: form.telefono || null,
        rol: form.rol,
        secretaria_id: form.rol === 'super_admin' ? null : (form.secretaria_id || null),
        activo: form.activo,
      };
      const { error } = await supabase.from('usuarios_admin').update(updateData).eq('id', usuario.id);
      if (error) throw error;
      setMsg({ type: 'success', text: '✅ Usuario actualizado correctamente.' });
      setTimeout(() => router.push('/admin/usuarios'), 1500);
    } catch (err) {
      setMsg({ type: 'error', text: `❌ ${err.message}` });
    } finally {
      setLoading(false);
    }
  };

  const handleToggleActivo = async () => {
    setLoading(true);
    try {
      const supabase = createClient();
      const { error } = await supabase
        .from('usuarios_admin')
        .update({ activo: !form.activo })
        .eq('id', usuario.id);
      if (error) throw error;
      setForm(prev => ({ ...prev, activo: !prev.activo }));
      setMsg({ type: 'success', text: `✅ Usuario ${!form.activo ? 'activado' : 'desactivado'} correctamente.` });
    } catch (err) {
      setMsg({ type: 'error', text: `❌ ${err.message}` });
    } finally {
      setLoading(false);
    }
  };

  const inputStyle = {
    width: '100%', padding: '0.65rem 0.875rem', borderRadius: '10px',
    border: '1px solid var(--admin-border)', background: 'var(--admin-surface-2)',
    color: 'var(--admin-text)', fontFamily: 'Inter, sans-serif', fontSize: '0.85rem',
    outline: 'none', boxSizing: 'border-box',
  };
  const labelStyle = {
    display: 'block', fontSize: '0.75rem', fontWeight: 600,
    color: 'var(--admin-text-muted)', marginBottom: '0.4rem', textTransform: 'uppercase', letterSpacing: '0.5px',
  };

  return (
    <div style={{ maxWidth: '640px', display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
      {/* Header */}
      <div>
        <button onClick={() => router.back()} style={{ background: 'none', border: 'none', color: 'var(--admin-text-muted)', cursor: 'pointer', fontSize: '0.82rem', display: 'flex', alignItems: 'center', gap: '0.4rem', padding: 0, marginBottom: '1rem', fontFamily: 'inherit' }}>
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><polyline points="15 18 9 12 15 6"/></svg>
          Volver a Usuarios
        </button>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', flexWrap: 'wrap', gap: '0.75rem' }}>
          <div>
            <h1 style={{ fontFamily: 'Outfit, sans-serif', fontSize: '1.4rem', fontWeight: 800, color: 'var(--admin-text)', margin: 0 }}>
              ✏️ Editar Usuario
            </h1>
            <p style={{ fontSize: '0.8rem', color: 'var(--admin-text-muted)', margin: '0.25rem 0 0' }}>
              {usuario.nombre} {usuario.apellido || ''} · {usuario.email}
            </p>
          </div>
          <button
            onClick={handleToggleActivo}
            disabled={loading}
            style={{
              padding: '0.5rem 1rem', borderRadius: '8px', fontSize: '0.78rem', fontWeight: 700,
              cursor: 'pointer', fontFamily: 'Outfit, sans-serif',
              background: form.activo ? 'rgba(239,68,68,0.1)' : 'rgba(16,185,129,0.1)',
              color: form.activo ? '#ef4444' : '#10b981',
              border: `1px solid ${form.activo ? 'rgba(239,68,68,0.3)' : 'rgba(16,185,129,0.3)'}`,
            }}
          >
            {form.activo ? '🚫 Desactivar usuario' : '✅ Activar usuario'}
          </button>
        </div>
      </div>

      {/* Mensaje */}
      {msg && (
        <div style={{
          padding: '0.875rem 1rem', borderRadius: '10px', fontSize: '0.85rem',
          background: msg.type === 'success' ? 'rgba(16,185,129,0.1)' : 'rgba(239,68,68,0.1)',
          color: msg.type === 'success' ? '#10b981' : '#ef4444',
          border: `1px solid ${msg.type === 'success' ? 'rgba(16,185,129,0.3)' : 'rgba(239,68,68,0.3)'}`,
        }}>
          {msg.text}
        </div>
      )}

      <form onSubmit={handleSubmit} style={{ display: 'flex', flexDirection: 'column', gap: '1.25rem' }}>
        {/* Datos personales */}
        <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '14px', padding: '1.5rem', display: 'flex', flexDirection: 'column', gap: '1rem' }}>
          <h2 style={{ fontFamily: 'Outfit, sans-serif', fontSize: '0.9rem', fontWeight: 700, color: 'var(--admin-text)', margin: 0 }}>📋 Datos personales</h2>
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1rem' }}>
            <div>
              <label style={labelStyle}>Nombre *</label>
              <input style={inputStyle} name="nombre" value={form.nombre} onChange={handleChange} required />
            </div>
            <div>
              <label style={labelStyle}>Apellido</label>
              <input style={inputStyle} name="apellido" value={form.apellido} onChange={handleChange} />
            </div>
          </div>
          <div>
            <label style={labelStyle}>Email (no editable)</label>
            <input style={{ ...inputStyle, opacity: 0.5, cursor: 'not-allowed' }} value={form.email} readOnly />
          </div>
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1rem' }}>
            <div>
              <label style={labelStyle}>Cargo</label>
              <input style={inputStyle} name="cargo" value={form.cargo} onChange={handleChange} placeholder="Ej: Jefe de Prensa" />
            </div>
            <div>
              <label style={labelStyle}>Teléfono</label>
              <input style={inputStyle} name="telefono" value={form.telefono} onChange={handleChange} placeholder="+591 70000000" />
            </div>
          </div>
        </div>

        {/* Rol y permisos */}
        <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '14px', padding: '1.5rem', display: 'flex', flexDirection: 'column', gap: '1rem' }}>
          <h2 style={{ fontFamily: 'Outfit, sans-serif', fontSize: '0.9rem', fontWeight: 700, color: 'var(--admin-text)', margin: 0 }}>🔐 Rol y Permisos</h2>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '0.5rem' }}>
            {ROLES.map(rol => (
              <label key={rol.value} style={{
                display: 'flex', alignItems: 'center', gap: '0.875rem', padding: '0.875rem 1rem', borderRadius: '10px', cursor: 'pointer',
                background: form.rol === rol.value ? (rol.value === 'super_admin' ? 'rgba(229,57,53,0.08)' : 'rgba(59,130,246,0.08)') : 'var(--admin-surface-2)',
                border: `2px solid ${form.rol === rol.value ? (rol.value === 'super_admin' ? 'rgba(229,57,53,0.4)' : 'rgba(59,130,246,0.4)') : 'var(--admin-border)'}`,
                transition: 'all 0.15s',
              }}>
                <input type="radio" name="rol" value={rol.value} checked={form.rol === rol.value} onChange={handleChange}
                  style={{ accentColor: rol.value === 'super_admin' ? '#E53935' : '#3B82F6', width: 16, height: 16 }} />
                <div>
                  <div style={{ fontSize: '0.85rem', fontWeight: 700, color: 'var(--admin-text)' }}>{rol.label}</div>
                  <div style={{ fontSize: '0.72rem', color: 'var(--admin-text-muted)' }}>{rol.desc}</div>
                </div>
              </label>
            ))}
          </div>

          {form.rol === 'secretaria_admin' && (
            <div>
              <label style={labelStyle}>Secretaría asignada *</label>
              <select name="secretaria_id" value={form.secretaria_id} onChange={handleChange}
                required={form.rol === 'secretaria_admin'}
                style={{ ...inputStyle, cursor: 'pointer' }}>
                <option value="">— Selecciona una secretaría —</option>
                {secretarias.map(s => (
                  <option key={s.id} value={s.id}>{s.icono} {s.nombre_corto}</option>
                ))}
              </select>
            </div>
          )}
        </div>

        {/* Botones */}
        <div style={{ display: 'flex', gap: '0.75rem', justifyContent: 'flex-end' }}>
          <button type="button" onClick={() => router.back()}
            style={{ padding: '0.65rem 1.25rem', borderRadius: '10px', border: '1px solid var(--admin-border)', background: 'var(--admin-surface-2)', color: 'var(--admin-text)', fontFamily: 'Outfit, sans-serif', fontWeight: 600, fontSize: '0.85rem', cursor: 'pointer' }}>
            Cancelar
          </button>
          <button type="submit" disabled={loading}
            style={{
              padding: '0.65rem 1.5rem', borderRadius: '10px', border: 'none',
              background: loading ? 'var(--admin-surface-3)' : 'var(--admin-primary)',
              color: '#fff', fontFamily: 'Outfit, sans-serif', fontWeight: 700, fontSize: '0.85rem',
              cursor: loading ? 'not-allowed' : 'pointer',
              boxShadow: loading ? 'none' : '0 4px 14px var(--admin-primary-glow)',
            }}>
            {loading ? '⏳ Guardando...' : '💾 Guardar Cambios'}
          </button>
        </div>
      </form>
    </div>
  );
}

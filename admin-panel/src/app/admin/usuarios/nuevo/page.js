'use client';
import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';

const ROLES = [
  { value: 'secretaria_admin', label: '🏛️ Admin de Secretaría', desc: 'Solo accede a su secretaría asignada' },
  { value: 'super_admin', label: '🛡️ Super Administrador', desc: 'Acceso total al panel y todas las secretarías' },
];

export default function NuevoUsuarioPage() {
  const router = useRouter();
  const [secretarias, setSecretarias] = useState([]);
  const [form, setForm] = useState({
    nombre: '',
    apellido: '',
    email: '',
    cargo: '',
    telefono: '',
    rol: 'secretaria_admin',
    secretaria_id: '',
  });
  const [loading, setLoading] = useState(false);
  const [msg, setMsg] = useState(null); // { type: 'success'|'error', text }

  useEffect(() => {
    fetch('/api/admin/secretarias-lista')
      .then(r => r.json())
      .then(d => setSecretarias(d.secretarias || []))
      .catch(() => {});
  }, []);

  const handleChange = (e) => {
    setForm(prev => ({ ...prev, [e.target.name]: e.target.value }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setMsg(null);
    try {
      const res = await fetch('/api/admin/usuarios/invite', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(form),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.error || 'Error al crear usuario');
      setMsg({ type: 'success', text: `✅ Invitación enviada a ${form.email}. El usuario recibirá un correo para establecer su contraseña.` });
      setTimeout(() => router.push('/admin/usuarios'), 2500);
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
    outline: 'none', boxSizing: 'border-box', transition: 'border-color 0.15s',
  };
  const labelStyle = {
    display: 'block', fontSize: '0.75rem', fontWeight: 600,
    color: 'var(--admin-text-muted)', marginBottom: '0.4rem', textTransform: 'uppercase', letterSpacing: '0.5px',
  };

  return (
    <div style={{ maxWidth: '640px', display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>

      {/* Header */}
      <div>
        <button
          onClick={() => router.back()}
          style={{ background: 'none', border: 'none', color: 'var(--admin-text-muted)', cursor: 'pointer', fontSize: '0.82rem', display: 'flex', alignItems: 'center', gap: '0.4rem', padding: 0, marginBottom: '1rem', fontFamily: 'inherit' }}
        >
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><polyline points="15 18 9 12 15 6"/></svg>
          Volver a Usuarios
        </button>
        <h1 style={{ fontFamily: 'Outfit, sans-serif', fontSize: '1.4rem', fontWeight: 800, color: 'var(--admin-text)', margin: 0 }}>
          ➕ Nuevo Administrador
        </h1>
        <p style={{ fontSize: '0.8rem', color: 'var(--admin-text-muted)', margin: '0.25rem 0 0' }}>
          Se enviará una invitación por email para que el usuario establezca su contraseña.
        </p>
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

        {/* Card datos personales */}
        <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '14px', padding: '1.5rem', display: 'flex', flexDirection: 'column', gap: '1rem' }}>
          <h2 style={{ fontFamily: 'Outfit, sans-serif', fontSize: '0.9rem', fontWeight: 700, color: 'var(--admin-text)', margin: 0 }}>
            📋 Datos personales
          </h2>
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1rem' }}>
            <div>
              <label style={labelStyle}>Nombre *</label>
              <input style={inputStyle} name="nombre" value={form.nombre} onChange={handleChange} required placeholder="Ej: Juan" />
            </div>
            <div>
              <label style={labelStyle}>Apellido</label>
              <input style={inputStyle} name="apellido" value={form.apellido} onChange={handleChange} placeholder="Ej: Pérez" />
            </div>
          </div>
          <div>
            <label style={labelStyle}>Email *</label>
            <input style={inputStyle} name="email" type="email" value={form.email} onChange={handleChange} required placeholder="admin@gobernacion.gob.bo" />
          </div>
          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1rem' }}>
            <div>
              <label style={labelStyle}>Cargo</label>
              <input style={inputStyle} name="cargo" value={form.cargo} onChange={handleChange} placeholder="Ej: Jefe de Prensa" />
            </div>
            <div>
              <label style={labelStyle}>Teléfono</label>
              <input style={inputStyle} name="telefono" value={form.telefono} onChange={handleChange} placeholder="Ej: +591 70000000" />
            </div>
          </div>
        </div>

        {/* Card rol y permisos */}
        <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '14px', padding: '1.5rem', display: 'flex', flexDirection: 'column', gap: '1rem' }}>
          <h2 style={{ fontFamily: 'Outfit, sans-serif', fontSize: '0.9rem', fontWeight: 700, color: 'var(--admin-text)', margin: 0 }}>
            🔐 Rol y Permisos
          </h2>

          {/* Selector de roles */}
          <div style={{ display: 'flex', flexDirection: 'column', gap: '0.5rem' }}>
            {ROLES.map(rol => (
              <label
                key={rol.value}
                style={{
                  display: 'flex', alignItems: 'center', gap: '0.875rem',
                  padding: '0.875rem 1rem', borderRadius: '10px', cursor: 'pointer',
                  background: form.rol === rol.value ? (rol.value === 'super_admin' ? 'rgba(229,57,53,0.08)' : 'rgba(59,130,246,0.08)') : 'var(--admin-surface-2)',
                  border: `2px solid ${form.rol === rol.value ? (rol.value === 'super_admin' ? 'rgba(229,57,53,0.4)' : 'rgba(59,130,246,0.4)') : 'var(--admin-border)'}`,
                  transition: 'all 0.15s',
                }}
              >
                <input
                  type="radio" name="rol" value={rol.value}
                  checked={form.rol === rol.value}
                  onChange={handleChange}
                  style={{ accentColor: rol.value === 'super_admin' ? '#E53935' : '#3B82F6', width: 16, height: 16 }}
                />
                <div>
                  <div style={{ fontSize: '0.85rem', fontWeight: 700, color: 'var(--admin-text)' }}>{rol.label}</div>
                  <div style={{ fontSize: '0.72rem', color: 'var(--admin-text-muted)' }}>{rol.desc}</div>
                </div>
              </label>
            ))}
          </div>

          {/* Secretaría (solo si es secretaria_admin) */}
          {form.rol === 'secretaria_admin' && (
            <div>
              <label style={labelStyle}>Secretaría asignada *</label>
              <select
                name="secretaria_id"
                value={form.secretaria_id}
                onChange={handleChange}
                required={form.rol === 'secretaria_admin'}
                style={{ ...inputStyle, cursor: 'pointer' }}
              >
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
          <button
            type="button"
            onClick={() => router.back()}
            style={{ padding: '0.65rem 1.25rem', borderRadius: '10px', border: '1px solid var(--admin-border)', background: 'var(--admin-surface-2)', color: 'var(--admin-text)', fontFamily: 'Outfit, sans-serif', fontWeight: 600, fontSize: '0.85rem', cursor: 'pointer' }}
          >
            Cancelar
          </button>
          <button
            type="submit"
            disabled={loading}
            style={{
              padding: '0.65rem 1.5rem', borderRadius: '10px', border: 'none',
              background: loading ? 'var(--admin-surface-3)' : 'var(--admin-primary)',
              color: '#fff', fontFamily: 'Outfit, sans-serif', fontWeight: 700, fontSize: '0.85rem',
              cursor: loading ? 'not-allowed' : 'pointer',
              boxShadow: loading ? 'none' : '0 4px 14px var(--admin-primary-glow)',
              transition: 'all 0.2s',
            }}
          >
            {loading ? '⏳ Enviando invitación...' : '📧 Enviar Invitación'}
          </button>
        </div>
      </form>
    </div>
  );
}

'use client';

import { useEffect, useState } from 'react';
import { createClient } from '@/lib/supabase/client';
import { uploadFile, deleteFile } from '@/lib/supabase/storage';
import FileUpload from '@/components/admin/FileUpload/FileUpload';

const esPdf = (url) => /\.pdf(\?|$)/i.test(url || '');

export default function OrganigramasPage() {
  const [supabase] = useState(() => createClient());
  const [secretarias, setSecretarias] = useState([]);
  const [organigramas, setOrganigramas] = useState({}); // secretaria_id -> archivo_url
  const [loading, setLoading] = useState(true);
  const [editando, setEditando] = useState(null); // secretaría seleccionada
  const [archivo, setArchivo] = useState(null);
  const [saving, setSaving] = useState(false);
  const [msg, setMsg] = useState(null);

  useEffect(() => {
    Promise.all([
      supabase.from('secretarias').select('id, nombre, nombre_corto, icono, color_acento, orden').eq('activo', true).order('orden'),
      supabase.from('organigramas_secretarias').select('secretaria_id, archivo_url'),
    ]).then(([{ data: secs, error: e1 }, { data: orgs, error: e2 }]) => {
      if (e1 || e2) setMsg({ type: 'error', text: `No se pudieron cargar los datos: ${(e1 || e2).message}` });
      setSecretarias(secs || []);
      setOrganigramas(Object.fromEntries((orgs || []).map(o => [o.secretaria_id, o.archivo_url])));
      setLoading(false);
    });
  }, [supabase]);

  const cerrar = () => { setEditando(null); setArchivo(null); };

  const guardar = async () => {
    if (!editando || !archivo) return;
    setSaving(true);
    setMsg(null);
    try {
      const previa = organigramas[editando.id];
      const url = await uploadFile(archivo, archivo.type === 'application/pdf' ? 'documentos' : 'general');
      const { data: { user } } = await supabase.auth.getUser();
      const { error } = await supabase.from('organigramas_secretarias').upsert(
        { secretaria_id: editando.id, archivo_url: url, updated_by: user?.id ?? null, updated_at: new Date().toISOString() },
        { onConflict: 'secretaria_id' }
      );
      if (error) {
        await deleteFile(url);
        throw error;
      }
      if (previa) await deleteFile(previa);
      setOrganigramas(prev => ({ ...prev, [editando.id]: url }));
      setMsg({ type: 'success', text: `✅ Organigrama de ${editando.nombre_corto || editando.nombre} actualizado.` });
      cerrar();
    } catch (err) {
      setMsg({ type: 'error', text: `❌ ${err.message}` });
    } finally {
      setSaving(false);
    }
  };

  const quitar = async (sec) => {
    if (!confirm(`¿Quitar el organigrama de ${sec.nombre_corto || sec.nombre}?`)) return;
    const { error } = await supabase.from('organigramas_secretarias').delete().eq('secretaria_id', sec.id);
    if (error) return setMsg({ type: 'error', text: `❌ ${error.message}` });
    await deleteFile(organigramas[sec.id]);
    setOrganigramas(prev => { const n = { ...prev }; delete n[sec.id]; return n; });
    setMsg({ type: 'success', text: '✅ Organigrama eliminado.' });
  };

  const total = secretarias.length;
  const cargados = secretarias.filter(s => organigramas[s.id]).length;

  return (
    <div className="adminPage" style={{ maxWidth: '1100px' }}>
      <h1 className="adminTitle">🧩 Organigramas de las Secretarías</h1>
      <p className="adminSubtitle">Sube el organigrama oficial (imagen o PDF) de cada secretaría. {total > 0 && `${cargados} de ${total} cargados.`}</p>

      {msg && (
        <div style={{
          margin: '1rem 0', padding: '0.875rem 1rem', borderRadius: '10px', fontSize: '0.85rem',
          background: msg.type === 'success' ? 'rgba(16,185,129,0.1)' : 'rgba(239,68,68,0.1)',
          color: msg.type === 'success' ? '#10b981' : '#ef4444',
          border: `1px solid ${msg.type === 'success' ? 'rgba(16,185,129,0.3)' : 'rgba(239,68,68,0.3)'}`,
        }}>{msg.text}</div>
      )}

      {loading ? (
        <p style={{ color: 'var(--admin-text-muted)' }}>Cargando…</p>
      ) : (
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))', gap: '1rem', marginTop: '1rem' }}>
          {secretarias.map(sec => {
            const url = organigramas[sec.id];
            return (
              <div key={sec.id} style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderTop: `3px solid ${sec.color_acento || 'var(--admin-primary)'}`, borderRadius: '14px', padding: '1.25rem', display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>
                <div style={{ fontFamily: 'Outfit, sans-serif', fontWeight: 700, color: 'var(--admin-text)' }}>{sec.icono} {sec.nombre_corto || sec.nombre}</div>
                {url ? (
                  esPdf(url) ? (
                    <a href={url} target="_blank" rel="noopener noreferrer" style={{ color: 'var(--admin-info)', fontSize: '0.85rem' }}>📄 Ver organigrama (PDF)</a>
                  ) : (
                    <a href={url} target="_blank" rel="noopener noreferrer">
                      {/* eslint-disable-next-line @next/next/no-img-element */}
                      <img src={url} alt={`Organigrama de ${sec.nombre_corto || sec.nombre}`} style={{ width: '100%', height: '140px', objectFit: 'contain', background: 'var(--admin-surface-2)', borderRadius: '8px' }} />
                    </a>
                  )
                ) : (
                  <div style={{ color: 'var(--admin-text-muted)', fontSize: '0.82rem' }}>Sin organigrama cargado.</div>
                )}
                <div style={{ display: 'flex', gap: '0.5rem', marginTop: 'auto' }}>
                  <button type="button" className="btnPrimary" onClick={() => { setEditando(sec); setArchivo(null); setMsg(null); }}>{url ? 'Reemplazar' : 'Subir'}</button>
                  {url && <button type="button" className="btnDanger" onClick={() => quitar(sec)}>Quitar</button>}
                </div>
              </div>
            );
          })}
        </div>
      )}

      {editando && (
        <div role="dialog" aria-modal="true" style={{ position: 'fixed', inset: 0, background: 'rgba(0,0,0,0.6)', display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '1rem', zIndex: 1000 }}>
          <div style={{ background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '16px', padding: '1.5rem', width: '100%', maxWidth: '480px', display: 'flex', flexDirection: 'column', gap: '1rem' }}>
            <h2 style={{ margin: 0, fontFamily: 'Outfit, sans-serif', color: 'var(--admin-text)', fontSize: '1.05rem' }}>Organigrama · {editando.nombre_corto || editando.nombre}</h2>
            <FileUpload onFileSelect={setArchivo} accept="image/*,application/pdf" label="Imagen o PDF del organigrama" icon="🧩" maxSizeMB={10} />
            <div style={{ display: 'flex', gap: '0.75rem', justifyContent: 'flex-end' }}>
              <button type="button" className="btnSecondary" onClick={cerrar} disabled={saving}>Cancelar</button>
              <button type="button" className="btnPrimary" onClick={guardar} disabled={!archivo || saving}>{saving ? 'Guardando…' : 'Guardar'}</button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

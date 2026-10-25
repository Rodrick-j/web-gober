'use client';

import { useEffect, useState } from 'react';
import { createClient } from '@/lib/supabase/client';
import { revalidateConfig } from '../configuracion/actions';

function getYouTubeId(value) {
  try {
    const url = new URL(value);
    if (url.hostname === 'youtu.be') return url.pathname.slice(1) || null;
    if (['youtube.com', 'www.youtube.com', 'm.youtube.com'].includes(url.hostname)) {
      if (url.pathname === '/watch') return url.searchParams.get('v');
      const m = url.pathname.match(/^\/(?:embed|shorts|live)\/([\w-]+)/);
      return m ? m[1] : null;
    }
  } catch { /* url inválida */ }
  return null;
}

const POR_PAGINA = 8;

export default function VideosPage() {
  const [supabase] = useState(() => createClient());
  const [videos, setVideos] = useState([]);
  const [nuevo, setNuevo] = useState('');
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [msg, setMsg] = useState(null);
  const [pagina, setPagina] = useState(0);

  useEffect(() => {
    supabase
      .from('configuracion_global')
      .select('valor')
      .eq('clave', 'video_inicio')
      .maybeSingle()
      .then(({ data, error }) => {
        if (error) setMsg({ type: 'error', text: `No se pudieron cargar los videos: ${error.message}` });
        else setVideos(Array.isArray(data?.valor?.urls) ? data.valor.urls : []);
        setLoading(false);
      });
  }, [supabase]);

  const agregar = () => {
    const url = nuevo.trim();
    setMsg(null);
    if (!getYouTubeId(url)) return setMsg({ type: 'error', text: 'Ingresa un enlace válido de YouTube (youtube.com o youtu.be).' });
    if (videos.includes(url)) return setMsg({ type: 'error', text: 'Ese video ya está en la lista.' });
    setVideos(prev => [...prev, url]);
    setPagina(0);
    setNuevo('');
  };

  const quitar = (url) => setVideos(prev => prev.filter(v => v !== url));

  // `i` es la posición real en el arreglo (0 = más antiguo). En pantalla se muestra al revés.
  const mover = (i, dir) => setVideos(prev => {
    const j = i + dir;
    if (j < 0 || j >= prev.length) return prev;
    const copia = [...prev];
    [copia[i], copia[j]] = [copia[j], copia[i]];
    return copia;
  });

  const guardar = async () => {
    setSaving(true);
    setMsg(null);
    try {
      // Se conservan las otras claves del JSON y solo se reemplaza la lista de URLs
      const { data: actual } = await supabase.from('configuracion_global').select('valor').eq('clave', 'video_inicio').maybeSingle();
      const valor = { ...(actual?.valor || {}), urls: videos };
      const { error } = await supabase.from('configuracion_global').upsert({ clave: 'video_inicio', valor }, { onConflict: 'clave' });
      if (error) throw error;
      await revalidateConfig();
      setMsg({ type: 'success', text: '✅ Videos guardados. Ya se muestran en la página principal.' });
    } catch (err) {
      setMsg({ type: 'error', text: `❌ ${err.message}` });
    } finally {
      setSaving(false);
    }
  };

  const total = videos.length;
  const totalPaginas = Math.max(1, Math.ceil(total / POR_PAGINA));
  const paginaActual = Math.min(pagina, totalPaginas - 1);
  // Más nuevos primero: se invierte una copia y se corta la página
  const visibles = [...videos]
    .map((url, idx) => ({ url, idx }))
    .reverse()
    .slice(paginaActual * POR_PAGINA, (paginaActual + 1) * POR_PAGINA);

  const card = { background: 'var(--admin-surface)', border: '1px solid var(--admin-border)', borderRadius: '14px', padding: '1.25rem' };

  return (
    <div className="adminPage" style={{ maxWidth: '860px' }}>
      <h1 className="adminTitle">▶ Videos de YouTube</h1>
      <p className="adminSubtitle">Videos destacados de la página principal. Se muestran del más reciente al más antiguo; los nuevos aparecen arriba.</p>

      {msg && (
        <div style={{
          margin: '1rem 0', padding: '0.875rem 1rem', borderRadius: '10px', fontSize: '0.85rem',
          background: msg.type === 'success' ? 'rgba(16,185,129,0.1)' : 'rgba(239,68,68,0.1)',
          color: msg.type === 'success' ? '#10b981' : '#ef4444',
          border: `1px solid ${msg.type === 'success' ? 'rgba(16,185,129,0.3)' : 'rgba(239,68,68,0.3)'}`,
        }}>{msg.text}</div>
      )}

      <div style={{ ...card, margin: '1rem 0', display: 'flex', gap: '0.75rem', flexWrap: 'wrap' }}>
        <input
          className="formInput" style={{ flex: 1, minWidth: '240px' }}
          placeholder="https://www.youtube.com/watch?v=... o https://youtu.be/..."
          value={nuevo} onChange={e => setNuevo(e.target.value)}
          onKeyDown={e => { if (e.key === 'Enter') { e.preventDefault(); agregar(); } }}
        />
        <button type="button" className="btnSecondary" onClick={agregar}>Agregar video</button>
      </div>

      {loading ? (
        <p style={{ color: 'var(--admin-text-muted)' }}>Cargando…</p>
      ) : videos.length === 0 ? (
        <div style={{ ...card, color: 'var(--admin-text-muted)', textAlign: 'center' }}>Aún no hay videos. Agrega el primero arriba.</div>
      ) : (
        <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>
          {visibles.map(({ url, idx: i }) => {
            const id = getYouTubeId(url);
            return (
              <div key={url} style={{ ...card, display: 'flex', gap: '1rem', alignItems: 'center', flexWrap: 'wrap' }}>
                {id && (
                  // eslint-disable-next-line @next/next/no-img-element
                  <img src={`https://i.ytimg.com/vi/${id}/mqdefault.jpg`} alt="" width={160} height={90} style={{ borderRadius: '8px', objectFit: 'cover' }} />
                )}
                <div style={{ flex: 1, minWidth: '180px' }}>
                  <span style={{ display: 'inline-block', marginBottom: '0.25rem', padding: '0.1rem 0.55rem', borderRadius: '99px', fontSize: '0.7rem', fontWeight: 700, background: 'var(--admin-surface-2)', color: 'var(--admin-text-muted)' }}>
                    {i === total - 1 ? 'Más reciente · ' : ''}Video n.º {i + 1}
                  </span>
                  <a href={url} target="_blank" rel="noopener noreferrer" style={{ display: 'block', color: 'var(--admin-text)', wordBreak: 'break-all', fontSize: '0.85rem' }}>{url}</a>
                </div>
                <div style={{ display: 'flex', gap: '0.4rem' }}>
                  <button type="button" className="btnSecondary" onClick={() => mover(i, 1)} disabled={i === total - 1} aria-label="Subir (más reciente)">↑</button>
                  <button type="button" className="btnSecondary" onClick={() => mover(i, -1)} disabled={i === 0} aria-label="Bajar (más antiguo)">↓</button>
                  <button type="button" className="btnDanger" onClick={() => quitar(url)}>Quitar</button>
                </div>
              </div>
            );
          })}
        </div>
      )}

      {!loading && totalPaginas > 1 && (
        <div style={{ marginTop: '1rem', display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '0.75rem', flexWrap: 'wrap' }}>
          <button type="button" className="btnSecondary" onClick={() => setPagina(paginaActual - 1)} disabled={paginaActual === 0}>← Más recientes</button>
          <span style={{ fontSize: '0.82rem', color: 'var(--admin-text-muted)' }}>
            Página {paginaActual + 1} de {totalPaginas} · {total} videos
          </span>
          <button type="button" className="btnSecondary" onClick={() => setPagina(paginaActual + 1)} disabled={paginaActual >= totalPaginas - 1}>Más antiguos →</button>
        </div>
      )}

      <div style={{ marginTop: '1.5rem', display: 'flex', justifyContent: 'flex-end' }}>
        <button type="button" className="btnPrimary" onClick={guardar} disabled={saving || loading}>
          {saving ? 'Guardando…' : 'Guardar cambios'}
        </button>
      </div>
    </div>
  );
}

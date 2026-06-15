import { createClient } from '@/lib/supabase/server';
import { getAdminUser } from '@/lib/auth';
import Link from 'next/link';

export const metadata = { title: 'Dashboard — Admin GADOR' };

export default async function AdminDashboard() {
  const { perfil } = await getAdminUser();
  const supabase = await createClient();

  let stats = { noticiasPublicadas: 0, noticiasBorrador: 0, documentos: 0, vistas: 0 };

  if (perfil.rol === 'super_admin') {
    const { count: nPub } = await supabase.from('noticias').select('*', { count: 'exact', head: true }).eq('estado', 'publicado');
    const { count: nBor } = await supabase.from('noticias').select('*', { count: 'exact', head: true }).eq('estado', 'borrador');
    const { count: dTot } = await supabase.from('documentos').select('*', { count: 'exact', head: true });
    const { data: vistasData } = await supabase.from('noticias').select('vistas');
    const totalVistas = vistasData?.reduce((acc, curr) => acc + (curr.vistas || 0), 0) || 0;
    stats = { noticiasPublicadas: nPub || 0, noticiasBorrador: nBor || 0, documentos: dTot || 0, vistas: totalVistas };
  } else {
    const secId = perfil.secretaria_id;
    if (secId) {
      const { count: nPub } = await supabase.from('noticias').select('*', { count: 'exact', head: true }).eq('estado', 'publicado').eq('secretaria_id', secId);
      const { count: nBor } = await supabase.from('noticias').select('*', { count: 'exact', head: true }).eq('estado', 'borrador').eq('secretaria_id', secId);
      const { count: dTot } = await supabase.from('documentos').select('*', { count: 'exact', head: true }).eq('secretaria_id', secId);
      const { data: vistasData } = await supabase.from('noticias').select('vistas').eq('secretaria_id', secId);
      const totalVistas = vistasData?.reduce((acc, curr) => acc + (curr.vistas || 0), 0) || 0;
      stats = { noticiasPublicadas: nPub || 0, noticiasBorrador: nBor || 0, documentos: dTot || 0, vistas: totalVistas };
    }
  }

  const queryReciente = supabase
    .from('noticias')
    .select('id, titulo, estado, fecha_publicacion, secretaria_id, secretarias(nombre_corto)')
    .order('created_at', { ascending: false })
    .limit(8);

  if (perfil.rol !== 'super_admin' && perfil.secretaria_id) {
    queryReciente.eq('secretaria_id', perfil.secretaria_id);
  }

  const { data: actividadReciente } = await queryReciente;

  const S = {
    page: { display:'flex', flexDirection:'column', gap:'1.25rem', maxWidth:'1200px' },
    header: { display:'flex', justifyContent:'space-between', alignItems:'center', flexWrap:'wrap', gap:'0.75rem' },
    h1: { fontFamily:"'Outfit',sans-serif", fontSize:'1.35rem', fontWeight:800, color:'#F1F5F9', margin:0, letterSpacing:'-0.3px' },
    sub: { color:'#64748B', marginTop:'0.2rem', fontSize:'0.78rem' },
    newBtn: {
      display:'inline-flex', alignItems:'center', gap:'0.4rem',
      background:'#C1272D', color:'white', border:'none',
      padding:'0.5rem 1.1rem', borderRadius:'8px', fontWeight:600,
      fontSize:'0.8rem', cursor:'pointer', textDecoration:'none',
      fontFamily:'Inter,sans-serif', boxShadow:'0 4px 12px rgba(193,39,45,0.3)',
    },
    statsGrid: { display:'grid', gridTemplateColumns:'repeat(4,1fr)', gap:'1rem' },
    statCard: {
      background:'var(--admin-surface)', border:'1px solid var(--admin-border)',
      borderRadius:'12px', padding:'1rem 1.1rem', display:'flex', flexDirection:'column', gap:'0.6rem',
    },
    statTop: { display:'flex', justifyContent:'space-between', alignItems:'center' },
    statLabel: { fontSize:'0.7rem', fontWeight:600, color:'var(--admin-text-muted)', textTransform:'uppercase', letterSpacing:'0.5px' },
    iconBox: (bg, color) => ({ width:32, height:32, borderRadius:8, background:bg, color, display:'flex', alignItems:'center', justifyContent:'center' }),
    statVal: { fontFamily:"'Outfit',sans-serif", fontSize:'1.9rem', fontWeight:800, color:'#F1F5F9', letterSpacing:'-1px', lineHeight:1 },
    trend: (color) => ({ fontSize:'0.68rem', fontWeight:600, color }),
    tableCard: { background:'var(--admin-surface)', border:'1px solid var(--admin-border)', borderRadius:'12px', padding:'1.1rem', overflow:'hidden' },
    tHead: { display:'flex', justifyContent:'space-between', alignItems:'center', marginBottom:'1rem' },
    tTitle: { fontFamily:"'Outfit',sans-serif", fontSize:'0.95rem', fontWeight:700, color:'var(--admin-text)' },
    secBtn: {
      display:'inline-flex', alignItems:'center', gap:'0.3rem',
      background:'var(--admin-surface-2)', color:'var(--admin-text)', border:'1px solid var(--admin-border)',
      padding:'0.35rem 0.75rem', borderRadius:'7px', fontWeight:600, fontSize:'0.75rem',
      textDecoration:'none', fontFamily:'inherit',
    },
  };

  return (
    <div style={S.page}>

      {/* Header */}
      <div style={S.header}>
        <div>
          <h1 style={S.h1}>¡Bienvenido, {perfil.nombre}! 👋</h1>
          <p style={S.sub}>
            {perfil.rol === 'super_admin' ? 'Vista global · Gobernación de Oruro' : `Panel de ${perfil.secretarias?.nombre_corto || 'tu secretaría'}`}
          </p>
        </div>
        <Link href="/admin/noticias/crear" style={S.newBtn}>
          <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          Nueva Noticia
        </Link>
      </div>

      {/* Stats */}
      <div style={S.statsGrid}>
        <div style={S.statCard}>
          <div style={S.statTop}>
            <span style={S.statLabel}>Publicadas</span>
            <div style={S.iconBox('rgba(16,185,129,0.12)', '#34D399')}>
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M4 22h16a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H8a2 2 0 0 0-2 2v16a2 2 0 0 1-2 2Zm0 0a2 2 0 0 1-2-2v-9c0-1.1.9-2 2-2h2"/></svg>
            </div>
          </div>
          <div style={S.statVal}>{stats.noticiasPublicadas}</div>
          <div style={S.trend('#34D399')}>● Noticias en vivo</div>
        </div>

        <div style={S.statCard}>
          <div style={S.statTop}>
            <span style={S.statLabel}>Borradores</span>
            <div style={S.iconBox('rgba(245,158,11,0.12)', '#FCD34D')}>
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>
            </div>
          </div>
          <div style={S.statVal}>{stats.noticiasBorrador}</div>
          <div style={S.trend('#FCD34D')}>● En progreso</div>
        </div>

        <div style={S.statCard}>
          <div style={S.statTop}>
            <span style={S.statLabel}>Documentos</span>
            <div style={S.iconBox('rgba(59,130,246,0.12)', '#93C5FD')}>
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
            </div>
          </div>
          <div style={S.statVal}>{stats.documentos}</div>
          <div style={S.trend('#93C5FD')}>● En Gaceta</div>
        </div>

        <div style={S.statCard}>
          <div style={S.statTop}>
            <span style={S.statLabel}>Vistas totales</span>
            <div style={S.iconBox('rgba(193,39,45,0.12)', '#FCA5A5')}>
              <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
            </div>
          </div>
          <div style={S.statVal}>{stats.vistas.toLocaleString()}</div>
          <div style={S.trend('#FCA5A5')}>● Lecturas</div>
        </div>
      </div>

      {/* Recent News Table */}
      <div style={S.tableCard}>
        <div style={S.tHead}>
          <h2 style={S.tTitle}>Noticias Recientes</h2>
          <Link href="/admin/noticias" style={S.secBtn}>Ver todas →</Link>
        </div>
        <div style={{ overflowX:'auto' }}>
          <table className="table" style={{ fontSize:'0.8rem' }}>
            <thead>
              <tr>
                <th>Título</th>
                {perfil.rol === 'super_admin' && <th>Secretaría</th>}
                <th>Estado</th>
                <th>Fecha</th>
                <th>Acción</th>
              </tr>
            </thead>
            <tbody>
              {actividadReciente && actividadReciente.length > 0 ? (
                actividadReciente.map((n) => (
                  <tr key={n.id}>
                    <td style={{ fontWeight:500, maxWidth:'360px', whiteSpace:'nowrap', overflow:'hidden', textOverflow:'ellipsis', fontSize:'0.8rem' }}>
                      {n.titulo}
                    </td>
                    {perfil.rol === 'super_admin' && (
                      <td>
                        <span className="badge" style={{ background:'rgba(255,255,255,0.05)', color:'#94A3B8', border:'1px solid rgba(255,255,255,0.07)', fontSize:'0.7rem' }}>
                          {n.secretarias?.nombre_corto || '—'}
                        </span>
                      </td>
                    )}
                    <td>
                      <span className={`badge ${n.estado === 'publicado' ? 'badgeSuccess' : 'badgeWarning'}`} style={{ fontSize:'0.68rem' }}>
                        {n.estado === 'publicado' ? '● Publicado' : '● Borrador'}
                      </span>
                    </td>
                    <td style={{ color:'#64748B', fontSize:'0.75rem', whiteSpace:'nowrap' }}>
                      {n.fecha_publicacion ? new Date(n.fecha_publicacion).toLocaleDateString('es-BO') : '—'}
                    </td>
                    <td>
                      <Link href={`/admin/noticias/${n.id}`} style={{ color:'#60A5FA', textDecoration:'none', fontWeight:600, fontSize:'0.75rem' }}>
                        Editar →
                      </Link>
                    </td>
                  </tr>
                ))
              ) : (
                <tr>
                  <td colSpan={perfil.rol === 'super_admin' ? 5 : 4} style={{ textAlign:'center', padding:'2.5rem', color:'#64748B', fontSize:'0.85rem' }}>
                    No hay noticias recientes.
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

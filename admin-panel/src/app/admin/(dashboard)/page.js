import { createClient } from '@/lib/supabase/server';
import { getAdminUser } from '@/lib/auth';
import Link from 'next/link';
import styles from './dashboard.module.css';

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
    .limit(10);

  if (perfil.rol !== 'super_admin' && perfil.secretaria_id) {
    queryReciente.eq('secretaria_id', perfil.secretaria_id);
  }

  const { data: actividadReciente } = await queryReciente;

  // Dividir lo más actual (las primeras 4) de lo anterior/historial (las siguientes 6)
  const noticiasActuales = actividadReciente?.slice(0, 4) || [];
  const noticiasPasadas = actividadReciente?.slice(4, 10) || [];

  const hora = new Date().getHours();
  const saludo = hora < 12 ? 'Buenos días' : hora < 18 ? 'Buenas tardes' : 'Buenas noches';

  return (
    <div className="adminPage">

      {/* ── HEADER ── */}
      <div className={styles.pageHeader}>
        <div>
          <h1 className="adminTitle">{saludo}, {perfil.nombre} 👋</h1>
          <p className="adminSubtitle">
            {perfil.rol === 'super_admin'
              ? 'Vista global · Gobernación Autónoma Departamental de Oruro'
              : `Panel de ${perfil.secretarias?.nombre_corto || 'tu secretaría'} · ${new Date().toLocaleDateString('es-BO', { weekday: 'long', day: 'numeric', month: 'long' })}`}
          </p>
        </div>
        <Link href="/admin/noticias/crear" className="btnPrimary" id="dashboard-new-news-btn">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
          Nueva Noticia
        </Link>
      </div>

      {/* ── STATS GRID ── */}
      <div className="statsGrid">

        <div className="statCard">
          <div className="statCardTop">
            <span className="statLabel">Publicadas</span>
            <div className="statIconBox" style={{ background: 'rgba(16,185,129,0.1)', color: '#34D399' }}>
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><polyline points="22 4 12 14.01 9 11.01"/></svg>
            </div>
          </div>
          <div className="statValue">{stats.noticiasPublicadas}</div>
          <div className="statTrend">
            <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><polyline points="22 7 13.5 15.5 8.5 10.5 2 17"/><polyline points="16 7 22 7 22 13"/></svg>
            Noticias activas
          </div>
        </div>

        <div className="statCard">
          <div className="statCardTop">
            <span className="statLabel">Borradores</span>
            <div className="statIconBox" style={{ background: 'rgba(245,158,11,0.1)', color: '#FBBF24' }}>
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>
            </div>
          </div>
          <div className="statValue">{stats.noticiasBorrador}</div>
          <div className="statTrend" style={{ color: 'var(--admin-warning)' }}>
            Pendientes de publicar
          </div>
        </div>

        <div className="statCard">
          <div className="statCardTop">
            <span className="statLabel">Documentos</span>
            <div className="statIconBox" style={{ background: 'rgba(59,130,246,0.1)', color: '#93C5FD' }}>
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
            </div>
          </div>
          <div className="statValue">{stats.documentos}</div>
          <div className="statTrend" style={{ color: 'var(--admin-info)' }}>
            En Gaceta Oficial
          </div>
        </div>

        <div className="statCard">
          <div className="statCardTop">
            <span className="statLabel">Vistas Totales</span>
            <div className="statIconBox" style={{ background: 'rgba(229,57,53,0.1)', color: '#FCA5A5' }}>
              <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
            </div>
          </div>
          <div className="statValue">{stats.vistas >= 1000 ? `${(stats.vistas / 1000).toFixed(1)}k` : stats.vistas.toLocaleString()}</div>
          <div className="statTrend" style={{ color: '#FCA5A5' }}>
            Lecturas registradas
          </div>
        </div>

      </div>

      {/* ── ACCESOS RÁPIDOS ── */}
      <div className={styles.quickActions}>
        <div className={styles.quickTitle}>Accesos Rápidos</div>
        <div className={styles.quickGrid}>
          <Link href="/admin/noticias/crear" className={styles.quickCard} id="quick-create-news">
            <div className={styles.quickIcon} style={{ background: 'rgba(229,57,53,0.1)', color: '#FCA5A5' }}>
              <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
            </div>
            <span>Crear Noticia</span>
          </Link>
          <Link href="/admin/gaceta" className={styles.quickCard} id="quick-gaceta">
            <div className={styles.quickIcon} style={{ background: 'rgba(59,130,246,0.1)', color: '#93C5FD' }}>
              <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
            </div>
            <span>Subir Documento</span>
          </Link>
          <Link href="/admin/carrusel" className={styles.quickCard} id="quick-carrusel">
            <div className={styles.quickIcon} style={{ background: 'rgba(245,158,11,0.1)', color: '#FBBF24' }}>
              <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><rect x="2" y="7" width="20" height="14" rx="2"/><path d="M16 3H8"/></svg>
            </div>
            <span>Gestionar Carrusel</span>
          </Link>
          {perfil.rol === 'super_admin' && (
            <Link href="/admin/secretarias" className={styles.quickCard} id="quick-secretarias">
              <div className={styles.quickIcon} style={{ background: 'rgba(16,185,129,0.1)', color: '#34D399' }}>
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
              </div>
              <span>Secretarías</span>
            </Link>
          )}
        </div>
      </div>

      {/* ── SECCIÓN DIVIDIDA: ACTUALIDAD VS HISTORIAL ── */}
      <div className={styles.dashboardSplit}>
        
        {/* COLUMNA IZQUIERDA: LO MÁS ACTUAL */}
        <div className={styles.splitSection}>
          <div className={styles.sectionHeader}>
            <div className={styles.sectionTitleWrap}>
              <span className={styles.sectionPulse} />
              <h2 className={styles.splitTitle}>Lo Más Actual</h2>
            </div>
            <span className={styles.sectionLabel}>En Vivo</span>
          </div>

          <div className={styles.feedList}>
            {noticiasActuales.length > 0 ? (
              noticiasActuales.map((n) => {
                const isPublished = n.estado === 'publicado';
                const feedColor = isPublished ? 'var(--admin-success)' : 'var(--admin-warning)';
                return (
                  <div key={n.id} className={styles.newsFeedCard} style={{ '--feed-color': feedColor }}>
                    <div className={styles.newsFeedContent}>
                      <div className={styles.newsFeedTitle} title={n.titulo}>
                        {n.titulo}
                      </div>
                      <div className={styles.newsFeedMeta}>
                        <span className={`badge ${isPublished ? 'badgeSuccess' : 'badgeWarning'}`} style={{ fontSize: '0.65rem', padding: '0.15rem 0.5rem' }}>
                          {isPublished ? '● Publicado' : '● Borrador'}
                        </span>
                        {n.secretarias?.nombre_corto && (
                          <span className={styles.feedSecretariaBadge}>
                            {n.secretarias.nombre_corto}
                          </span>
                        )}
                        <span className={styles.feedTime}>
                          {n.fecha_publicacion ? new Date(n.fecha_publicacion).toLocaleDateString('es-BO', { day: 'numeric', month: 'short' }) : '—'}
                        </span>
                      </div>
                    </div>
                    <Link
                      href={`/admin/noticias/editar/${n.id}`}
                      className={styles.feedEditBtn}
                      id={`edit-feed-${n.id}`}
                    >
                      <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5"><path d="M12 20h9"/><path d="M16.5 3.5a2.12 2.12 0 0 1 3 3L7 19l-4 1 1-4Z"/></svg>
                    </Link>
                  </div>
                );
              })
            ) : (
              <div className={styles.emptyFeed}>No hay publicaciones recientes.</div>
            )}
          </div>
        </div>

        {/* COLUMNA DERECHA: HISTORIAL Y ARCHIVO */}
        <div className={styles.splitSection}>
          <div className={styles.sectionHeader}>
            <div className={styles.sectionTitleWrap}>
              <span className={styles.sectionArchiveIcon}>📂</span>
              <h2 className={styles.splitTitle}>Historial y Archivo</h2>
            </div>
            <Link href="/admin/noticias" className={styles.viewAllLink}>
              Ver todas →
            </Link>
          </div>

          <div className={styles.archiveList}>
            {noticiasPasadas.length > 0 ? (
              <div className={styles.archiveTableWrap}>
                <table className={styles.archiveTable}>
                  <thead>
                    <tr>
                      <th>Título</th>
                      <th>Estado</th>
                      <th>Fecha</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                    {noticiasPasadas.map((n) => (
                      <tr key={n.id}>
                        <td className={styles.archiveTitleCell} title={n.titulo}>
                          {n.titulo}
                        </td>
                        <td>
                          <span className={`badge ${n.estado === 'publicado' ? 'badgeSuccess' : 'badgeWarning'}`} style={{ fontSize: '0.6rem', padding: '0.12rem 0.4rem' }}>
                            {n.estado === 'publicado' ? 'Publicado' : 'Borrador'}
                          </span>
                        </td>
                        <td className={styles.archiveDateCell}>
                          {n.fecha_publicacion ? new Date(n.fecha_publicacion).toLocaleDateString('es-BO', { day: 'numeric', month: 'numeric' }) : '—'}
                        </td>
                        <td>
                          <Link href={`/admin/noticias/editar/${n.id}`} className={styles.archiveEditBtn} id={`edit-archive-${n.id}`}>
                            Editar
                          </Link>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            ) : (
              <div className={styles.emptyArchive}>
                <span>No hay registros anteriores en la vista rápida.</span>
              </div>
            )}
          </div>
        </div>

      </div>
    </div>
  );
}

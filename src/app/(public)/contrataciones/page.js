import React from 'react';
import Link from 'next/link';
import { createClient } from '@/lib/supabase/public';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import styles from './contrataciones.module.css';

export const revalidate = 60;

export const metadata = {
  title: 'Contrataciones y Convocatorias | GADOR',
  description: 'Términos de referencia, convocatorias de adquisición de bienes y servicios, oportunidades de empleo y lista de proveedores del Gobierno Autónomo Departamental de Oruro.',
};

const TIPO_LABEL = { tdr: 'Términos de Referencia', bienes_servicios: 'Bienes y Servicios', empleo: 'Oportunidad de Empleo' };
const ESTADO_LABEL = { vigente: 'Vigente', cerrada: 'Cerrada', adjudicada: 'Adjudicada', desierta: 'Desierta' };
const fmt = (v) => (v ? new Date(String(v).split('T')[0] + 'T00:00:00').toLocaleDateString('es-BO') : null);

export default async function ContratacionesPage() {
  let convocatorias = [];
  let proveedores = [];
  try {
    const supabase = createClient();
    const [{ data: c }, { data: p }] = await Promise.all([
      supabase
        .from('convocatorias')
        .select('id, tipo, titulo, codigo, descripcion, archivo_url, fecha_publicacion, fecha_limite, estado')
        .eq('activo', true)
        .order('fecha_publicacion', { ascending: false }),
      supabase
        .from('proveedores')
        .select('id, nombre, nit, contacto, rubro, productos_servicios')
        .eq('activo', true)
        .order('nombre', { ascending: true }),
    ]);
    convocatorias = c || [];
    proveedores = p || [];
  } catch {
    /* tablas aún no creadas */
  }

  const vigentes = convocatorias.filter((c) => c.estado === 'vigente');
  const historicas = convocatorias.filter((c) => c.estado !== 'vigente');

  const CardList = ({ items }) => (
    <div className={styles.convGrid}>
      {items.map((c) => (
        <article key={c.id} className={styles.convCard}>
          <div className={styles.convTop}>
            <span className={styles.tag}>{TIPO_LABEL[c.tipo] || c.tipo}</span>
            <span className={`${styles.estado} ${c.estado === 'vigente' ? styles.estVigente : styles.estOtro}`}>
              {ESTADO_LABEL[c.estado] || c.estado}
            </span>
          </div>
          <h3 className={styles.convTitle}>{c.titulo}</h3>
          <div className={styles.convMeta}>
            {c.codigo ? `${c.codigo} · ` : ''}Publicado {fmt(c.fecha_publicacion)}
            {c.fecha_limite ? ` · Cierre ${fmt(c.fecha_limite)}` : ''}
          </div>
          {c.descripcion && <p className={styles.convDesc}>{c.descripcion}</p>}
          {c.archivo_url && (
            <a className={styles.convBtn} href={c.archivo_url} target="_blank" rel="noopener noreferrer">⬇ Ver pliego / TdR</a>
          )}
        </article>
      ))}
    </div>
  );

  return (
    <main className={styles.main}>
      <AnimatedBackground />
      <header className={styles.hero}>
        <h1 className={styles.heroTitle}>Contrataciones y Convocatorias</h1>
        <p className={styles.heroSub}>
          Términos de referencia, adquisición de bienes y servicios, oportunidades de empleo y lista de proveedores.
        </p>
      </header>

      <div className={styles.container}>
        <h2 className={styles.sectionTitle}>Convocatorias vigentes</h2>
        {vigentes.length === 0 ? (
          <div className={styles.empty}>No hay convocatorias vigentes en este momento.</div>
        ) : (
          <CardList items={vigentes} />
        )}

        {historicas.length > 0 && (
          <>
            <h2 className={styles.sectionTitle}>Procesos anteriores</h2>
            <CardList items={historicas} />
          </>
        )}

        <h2 className={styles.sectionTitle}>Lista de Proveedores</h2>
        {proveedores.length === 0 ? (
          <div className={styles.empty}>La lista de proveedores se encuentra en actualización.</div>
        ) : (
          <div className={styles.tableWrap}>
            <table className={styles.table}>
              <thead>
                <tr><th>Proveedor</th><th>NIT</th><th>Rubro</th><th>Productos / Servicios</th><th>Contacto</th></tr>
              </thead>
              <tbody>
                {proveedores.map((p) => (
                  <tr key={p.id}>
                    <td>{p.nombre}</td>
                    <td>{p.nit || '—'}</td>
                    <td>{p.rubro || '—'}</td>
                    <td>{p.productos_servicios || '—'}</td>
                    <td>{p.contacto || '—'}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}

        <h2 className={styles.sectionTitle}>Documentación relacionada</h2>
        <div className={styles.docsRow}>
          <Link className={styles.docLink} href="/institucion/contrataciones">📁 Documentos de Contrataciones</Link>
          <Link className={styles.docLink} href="/institucion/licitacion-publica">📁 Licitación Pública</Link>
        </div>
      </div>
    </main>
  );
}

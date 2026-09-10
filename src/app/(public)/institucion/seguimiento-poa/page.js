import React from 'react';
import Link from 'next/link';
import { createClient } from '@/lib/supabase/public';
import CenefaCultural from '@/components/CenefaCultural/CenefaCultural';
import styles from './seguimiento.module.css';

export const revalidate = 60;

export const metadata = {
  title: 'Seguimiento y Evaluación al POA | Institución | GADOR',
  description: 'Seguimiento a la ejecución de la Programación Operativa Anual (POA) del Gobierno Autónomo Departamental de Oruro e informes de evaluación.',
};

const fmtBOB = (n) =>
  new Intl.NumberFormat('es-BO', { style: 'currency', currency: 'BOB', maximumFractionDigits: 0 }).format(Number(n) || 0);
const pct = (ej, pr) => (Number(pr) > 0 ? ((Number(ej) / Number(pr)) * 100) : 0);

export default async function SeguimientoPoaPage() {
  let global = null;
  let municipios = [];
  let documentos = [];

  try {
    const supabase = createClient();

    const { data: globales } = await supabase
      .from('poa_resumen_global')
      .select('*')
      .order('gestion', { ascending: false });
    global = globales?.[0] || null;

    if (global?.gestion) {
      const { data: muni } = await supabase
        .from('poa_resumen_municipio')
        .select('*')
        .eq('gestion', global.gestion);
      // Agregar por municipio (la vista separa por tipo)
      const map = {};
      (muni || []).forEach((r) => {
        const m = (map[r.municipio] ||= { municipio: r.municipio, prog: 0, ejec: 0 });
        m.prog += Number(r.total_programado) || 0;
        m.ejec += Number(r.total_ejecutado) || 0;
      });
      municipios = Object.values(map).sort((a, b) => b.prog - a.prog);
    }

    const { data: docs } = await supabase
      .from('institucion_documentos')
      .select('id, titulo, descripcion, archivo_url, fecha_publicacion')
      .eq('categoria', 'seguimiento-poa')
      .eq('activo', true)
      .order('fecha_publicacion', { ascending: false });
    documentos = docs || [];
  } catch {
    /* vistas o tablas aún no creadas */
  }

  const ejecPct = global ? pct(global.total_ejecutado, global.total_programado) : 0;

  return (
    <main className={styles.main}>
      <CenefaCultural />
      <header className={styles.hero}>
        <h1 className={styles.heroTitle}>Seguimiento y Evaluación al POA</h1>
        <p className={styles.heroSub}>
          Avance en la ejecución de la Programación Operativa Anual e informes de seguimiento
          del Gobierno Autónomo Departamental de Oruro.
        </p>
      </header>

      <div className={styles.container}>
        {global ? (
          <>
            <span className={styles.gestionTag}>Gestión {global.gestion}</span>

            <div className={styles.kpis}>
              <div className={styles.kpi}>
                <div className={styles.kpiLabel}>Presupuesto programado</div>
                <div className={styles.kpiValue}>{fmtBOB(global.total_programado)}</div>
                <div className={styles.kpiSub}>{global.total_items} ítems POA</div>
              </div>
              <div className={styles.kpi}>
                <div className={styles.kpiLabel}>Presupuesto ejecutado</div>
                <div className={styles.kpiValue}>{fmtBOB(global.total_ejecutado)}</div>
                <div className={styles.bar}>
                  <div className={styles.barFill} style={{ width: `${Math.min(100, ejecPct).toFixed(1)}%` }} />
                </div>
              </div>
              <div className={styles.kpi}>
                <div className={styles.kpiLabel}>% de ejecución</div>
                <div className={styles.kpiValue}>{ejecPct.toFixed(1)}%</div>
              </div>
              <div className={styles.kpi}>
                <div className={styles.kpiLabel}>Inversión ejecutada</div>
                <div className={styles.kpiValue}>{fmtBOB(global.total_inversion_ejecutado)}</div>
                <div className={styles.kpiSub}>de {fmtBOB(global.total_inversion_programado)} programado</div>
              </div>
            </div>

            {municipios.length > 0 && (
              <>
                <h2 className={styles.sectionTitle}>Ejecución por municipio / provincia</h2>
                <div className={styles.tableWrap}>
                  <table className={styles.table}>
                    <thead>
                      <tr><th>Municipio / Provincia</th><th className="num">Programado</th><th className="num">Ejecutado</th><th className="num">% Ejec.</th></tr>
                    </thead>
                    <tbody>
                      {municipios.map((m) => (
                        <tr key={m.municipio}>
                          <td>{m.municipio}</td>
                          <td className={styles.num}>{fmtBOB(m.prog)}</td>
                          <td className={styles.num}>{fmtBOB(m.ejec)}</td>
                          <td className={styles.num}>{pct(m.ejec, m.prog).toFixed(1)}%</td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </>
            )}
          </>
        ) : (
          <div className={styles.note}>
            El resumen de ejecución del POA se mostrará aquí una vez cargados los datos de la Programación Operativa Anual.
            Consulte también el detalle por secretaría en la sección <Link href="/secretarias">Secretarías</Link>.
          </div>
        )}

        <h2 className={styles.sectionTitle}>Informes de Seguimiento y Evaluación</h2>
        {documentos.length === 0 ? (
          <div className={styles.empty}>Aún no se han publicado informes de seguimiento y evaluación al POA.</div>
        ) : (
          <div className={styles.docList}>
            {documentos.map((d) => (
              <div key={d.id} className={styles.docItem}>
                <div>
                  <div className={styles.docTitle}>{d.titulo}</div>
                  {d.descripcion && <div style={{ fontSize: '0.82rem', color: '#888' }}>{d.descripcion}</div>}
                </div>
                {d.archivo_url && (
                  <a className={styles.docBtn} href={d.archivo_url} target="_blank" rel="noopener noreferrer">⬇ Descargar</a>
                )}
              </div>
            ))}
          </div>
        )}
      </div>
    </main>
  );
}

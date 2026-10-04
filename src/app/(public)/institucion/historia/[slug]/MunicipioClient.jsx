'use client';

import React, { useState } from 'react';
import Link from 'next/link';
import Image from 'next/image';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import styles from '../historia.module.css';

const ChakanaIcon = ({ className }) => (
  <svg viewBox="0 0 100 100" className={className} fill="currentColor">
    <rect x="40" y="0" width="20" height="100" />
    <rect x="0" y="40" width="100" height="20" />
    <rect x="25" y="15" width="50" height="70" />
    <rect x="15" y="25" width="70" height="50" />
    <circle cx="50" cy="50" r="8" fill="rgba(255,255,255,0.2)" />
  </svg>
);

const BASE_TABS = [
  { id: 'intro',      icon: '🏛️', label: 'Datos de Municipio' },
  { id: 'gobierno',   icon: '🏢', label: 'Gobierno' },
  { id: 'demografia', icon: '👥', label: 'Demografía' },
  { id: 'territorio', icon: '🌄', label: 'Territorio' },
  { id: 'transporte', icon: '✈️', label: 'Transporte' },
  { id: 'vecinos',    icon: '🗺️', label: 'Vecinos' },
  { id: 'distancias', icon: '📍', label: 'Distancias' },
];

export default function MunicipioClient({ mun, allMunicipios }) {
  const [activeTab, setActiveTab] = useState('intro');
  const [searchTerm, setSearchTerm] = useState('');
  const tabs = mun.provinciaFicha
    ? [
      { id: 'intro', icon: '✦', label: 'Identidad y comunidad' },
      { id: 'cultura', icon: '♫', label: 'Cultura viva y patrimonio' },
      { id: 'territorio', icon: '△', label: 'Territorio y paisaje' },
    ]
    : mun.cultura?.length
    ? [
      BASE_TABS[0],
      { id: 'cultura', icon: '✦', label: 'Cultura y patrimonio' },
      ...BASE_TABS.slice(1),
    ]
    : BASE_TABS;
  const escudo = mun.media?.find((imagen) => imagen.tipo === 'escudo');
  const lugares = mun.media?.filter((imagen) => imagen.tipo === 'turismo') || [];
  const municipiosRelacionados = mun.provinciaFicha
    ? (allMunicipios || []).filter((municipio) => municipio.slug !== mun.slug && municipio.provincia === mun.provincia)
    : (allMunicipios || []).filter((municipio) => municipio.slug !== mun.slug);
  const municipiosVisibles = municipiosRelacionados.filter((municipio) =>
    municipio.nombre.toLowerCase().includes(searchTerm.toLowerCase())
  );
  const mostrarRelacionados = !mun.provinciaFicha || municipiosRelacionados.length > 0;
  const metricasTerritoriales = mun.provinciaFicha
    ? [
      {
        etiqueta: 'Altitud',
        valor: `${mun.altitud.toLocaleString('en-US')} m`,
        detalle: 'Sobre el nivel del mar',
      },
      ...(mun.territorio?.clima ? [{
        etiqueta: 'Clima',
        valor: 'Alta montaña',
        detalle: mun.territorio.clima,
      }] : []),
      ...(mun.territorio?.superficie ? [{
        etiqueta: mun.territorio.superficieEtiqueta || 'Referencia territorial',
        valor: mun.territorio.superficie,
        detalle: mun.provinciaFicha.nombre,
      }] : []),
      ...(mun.territorio?.organizacion ? [{
        etiqueta: 'Organización territorial',
        valor: mun.territorio.organizacionCorta || 'Organización local',
        detalle: mun.territorio.organizacion,
      }] : []),
    ]
    : [];

  return (
    <div className={styles.page}>
      <AnimatedBackground />

      {/* === HERO === */}
      <div className={styles.hero}>
        <div className={styles.heroBg} />
        <ChakanaIcon className={styles.heroChakana} />
        <ChakanaIcon className={styles.heroChakana2} />

        <div className={styles.heroContent}>
          <nav className={styles.heroBreadcrumb}>
            <Link href="/">Inicio</Link><span>›</span>
            <Link href="/institucion">Institución</Link><span>›</span>
            <Link href="/institucion/historia">Datos de Municipio</Link><span>›</span>
            <span style={{ color: 'rgba(255,255,255,0.9)' }}>{mun.nombre}</span>
          </nav>

          <div className={styles.heroBadge}>
            <span className={styles.heroBadgeDot} />
            {mun.esCapital ? '⭐ Capital del Departamento' : `Prov. ${mun.provincia}`} · Oruro, Bolivia
          </div>

          <div className={styles.heroTop}>
            <div>
              <h1 className={styles.heroTitle}>Municipio de {mun.nombre}</h1>
              <p className={styles.heroSubtitle}>
                {mun.gentilicio} · Departamento de Oruro
              </p>
            </div>

            <div className={styles.heroStats}>
              <div className={styles.heroStat}>
                <span className={styles.heroStatValue}>{mun.altitud.toLocaleString('en-US')}m</span>
                <span className={styles.heroStatLabel}>Altitud</span>
              </div>
              {mun.poblacion !== 'N/D' && (
                <div className={styles.heroStat}>
                  <span className={styles.heroStatValue}>{mun.poblacion}</span>
                  <span className={styles.heroStatLabel}>Habitantes</span>
                </div>
              )}
              <div className={styles.heroStat}>
                <span className={styles.heroStatValue}>{mun.codigo}</span>
                <span className={styles.heroStatLabel}>Código</span>
              </div>
              <div className={styles.heroStat}>
                <span className={styles.heroStatValue}>UTC-4</span>
                <span className={styles.heroStatLabel}>Zona horaria</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* === TABS === */}
      <div className={styles.tabsWrapper}>

        {/* TAB BAR */}
        <div className={styles.tabBar}>
          {tabs.map((tab) => (
            <button
              key={tab.id}
              className={`${styles.tabBtn} ${activeTab === tab.id ? styles.tabBtnActive : ''}`}
              onClick={() => setActiveTab(tab.id)}
            >
              <span className={styles.tabIcon}>{tab.icon}</span>
              {tab.label}
            </button>
          ))}
        </div>

        {/* TAB: INTRO */}
        {activeTab === 'intro' && (
          <div key="intro" className={styles.tabPanel}>
            <div className={styles.panelHeader}>
              <div className={styles.panelHeaderIcon}>🏛️</div>
              <h2 className={styles.panelHeaderTitle}>
                {mun.provinciaFicha ? `La esencia de ${mun.nombre}` : `Datos del Municipio de ${mun.nombre}`}
              </h2>
            </div>
            <div className={styles.panelBody}>
              {mun.provinciaFicha ? (
                <>
                  <section className={`${styles.identidadPresentacion} ${!escudo ? styles.identidadPresentacionSinEscudo : ''}`} aria-labelledby="identidad-title">
                    <div className={styles.identidadNarrativa}>
                      <span className={styles.presentacionEyebrow}>{mun.provinciaFicha.nombre} · Oruro</span>
                      <h3 id="identidad-title">Identidad que une comunidad, paisaje y memoria.</h3>
                      <p>{mun.descripcion}</p>
                    </div>

                    {escudo && (
                      <figure className={styles.escudoPresentacion}>
                        <div className={styles.escudoPresentacionImagen}>
                          <Image
                            src={escudo.src}
                            alt={escudo.alt}
                            fill
                            priority
                            sizes="(max-width: 760px) 100vw, 38vw"
                          />
                        </div>
                        <figcaption>{escudo.titulo}</figcaption>
                      </figure>
                    )}
                  </section>

                  <div className={styles.identidadMetricas}>
                    <div className={styles.statCard}>
                      <span className={styles.statCardLabel}>Población</span>
                      <span className={styles.statCardValue}>{mun.poblacion}</span>
                      <span className={styles.statCardSub}>Censo {mun.anoCenso}</span>
                    </div>
                    <div className={styles.statCard}>
                      <span className={styles.statCardLabel}>Altitud</span>
                      <span className={styles.statCardValue}>{mun.altitud.toLocaleString('en-US')} m</span>
                      <span className={styles.statCardSub}>Sobre el nivel del mar</span>
                    </div>
                    <div className={styles.statCard}>
                      <span className={styles.statCardLabel}>Provincia</span>
                      <span className={styles.statCardValue}>{mun.provincia}</span>
                      <span className={styles.statCardSub}>Comunidad provincial</span>
                    </div>
                    <div className={styles.statCard}>
                      <span className={styles.statCardLabel}>Código municipal</span>
                      <span className={styles.statCardValue} style={{ fontFamily: 'monospace' }}>{mun.codigo}</span>
                      <span className={styles.statCardSub}>Registro territorial</span>
                    </div>
                  </div>

                  <section className={styles.provinciaFicha} aria-labelledby="provincia-ficha-title">
                    <div className={styles.provinciaFichaHeading}>
                      <div>
                        <span>Comunidad provincial</span>
                        <h3 id="provincia-ficha-title">{mun.provinciaFicha.nombre}</h3>
                      </div>
                      <strong>{mun.provinciaFicha.poblacionTotal} <small>habitantes</small></strong>
                    </div>

                    <div className={styles.provinciaMunicipios}>
                      {mun.provinciaFicha.municipios.map((municipio) => (
                        <Link
                          href={`/institucion/historia/${municipio.slug}`}
                          className={styles.provinciaMunicipio}
                          aria-current={municipio.nombre === mun.nombre ? 'page' : undefined}
                          key={municipio.nombre}
                        >
                          <span>{municipio.nombre === mun.nombre ? '●' : '○'}</span>
                          <div>
                            <strong>{municipio.nombre}</strong>
                            <small>{municipio.rol}</small>
                          </div>
                          <em>{municipio.poblacion !== 'N/D' ? `${municipio.poblacion} hab.` : 'Dato por confirmar'}</em>
                        </Link>
                      ))}
                    </div>

                    <p className={styles.provinciaFichaNote}>
                      {mun.provinciaFicha.notaPoblacion || `Población registrada según el Censo ${mun.provinciaFicha.anoCenso} del INE.`}
                    </p>
                  </section>
                </>
              ) : (
                <div className={styles.panelGrid2}>
                  <div>
                    <p className={styles.introText}>{mun.descripcion}</p>
                    {mun.ciudadesHermanadas && mun.ciudadesHermanadas.length > 0 && (
                      <>
                        <div className={styles.subHeading} style={{ marginTop: '1.25rem' }}>🤝 Ciudades Hermanadas</div>
                        <div className={styles.sisterCities}>
                          {mun.ciudadesHermanadas.map(c => (
                            <div key={c.ciudad} className={styles.sisterCity}>
                              <span>{c.flag}</span><span>{c.ciudad}</span>
                            </div>
                          ))}
                        </div>
                      </>
                    )}
                  </div>
                  <div>
                    <div className={styles.panelGrid2} style={{ gap: '0.65rem' }}>
                      <div className={styles.statCard}>
                        <span className={styles.statCardLabel}>Departamento</span>
                        <span className={styles.statCardValue}>Oruro</span>
                      </div>
                      <div className={styles.statCard}>
                        <span className={styles.statCardLabel}>Provincia</span>
                        <span className={styles.statCardValue}>{mun.provincia}</span>
                      </div>
                      <div className={styles.statCard}>
                        <span className={styles.statCardLabel}>País</span>
                        <span className={styles.statCardValue}>Bolivia</span>
                      </div>
                      <div className={styles.statCard}>
                        <span className={styles.statCardLabel}>Código municipal</span>
                        <span className={styles.statCardValue} style={{ fontFamily: 'monospace' }}>{mun.codigo}</span>
                      </div>
                    </div>
                  </div>
                </div>
              )}
            </div>
          </div>
        )}

        {/* TAB: CULTURA */}
        {activeTab === 'cultura' && mun.cultura?.length > 0 && (
          <div key="cultura" className={styles.tabPanel}>
            <div className={styles.panelHeader}>
              <div className={styles.panelHeaderIcon}>✦</div>
              <h2 className={styles.panelHeaderTitle}>
                {mun.provinciaFicha ? `Cultura viva, patrimonio y saberes de ${mun.nombre}` : `Cultura y patrimonio de ${mun.nombre}`}
              </h2>
            </div>
            <div className={styles.panelBody}>
              {mun.provinciaFicha ? (
                <>
                  <div className={`${styles.culturaPresentacion} ${lugares.length === 0 ? styles.culturaPresentacionSinFoto : ''}`}>
                    <div className={styles.culturaGrid}>
                      {mun.cultura.map((item) => (
                        <article className={`${styles.culturaCard} ${styles.culturaCardReveal}`} key={item.titulo}>
                          <span className={styles.culturaIcon} aria-hidden="true">{item.icono}</span>
                          <h3>{item.titulo}</h3>
                          <p>{item.texto}</p>
                        </article>
                      ))}
                    </div>

                    {lugares.map((lugar) => (
                      <figure className={styles.lugarDestacado} key={lugar.src}>
                        <div className={styles.lugarDestacadoImagen}>
                          <Image
                            src={lugar.src}
                            alt={lugar.alt}
                            fill
                            sizes="(max-width: 760px) 100vw, 42vw"
                          />
                        </div>
                        <figcaption>
                          <span>Una mirada al territorio</span>
                          <strong>{lugar.titulo}</strong>
                        </figcaption>
                      </figure>
                    ))}
                  </div>

                  {mun.gastronomia?.length > 0 && (
                    <section className={styles.saboresPresentacion} aria-labelledby="sabores-title">
                      <div className={styles.presentacionSectionHeading}>
                        <span>Saberes que se comparten</span>
                        <h3 id="sabores-title">Sabores del altiplano</h3>
                      </div>
                      <div className={styles.saboresGrid}>
                        {mun.gastronomia.map((plato) => (
                          <article className={styles.saborCard} key={plato.titulo}>
                            <span aria-hidden="true">{plato.icono}</span>
                            <div>
                              <h4>{plato.titulo}</h4>
                              <p>{plato.texto}</p>
                            </div>
                          </article>
                        ))}
                      </div>
                    </section>
                  )}

                  {mun.normativa?.length > 0 && (
                    <section className={styles.normativaPresentacion} aria-labelledby="normativa-title">
                      <div className={styles.presentacionSectionHeading}>
                        <span>Marco de reconocimiento</span>
                        <h3 id="normativa-title">Leyes que resguardan su territorio</h3>
                      </div>
                      <div className={styles.normativaGrid}>
                        {mun.normativa.map((ley) => (
                          <article className={styles.normativaCard} key={ley.titulo}>
                            <span>Normativa</span>
                            <h4>{ley.titulo}</h4>
                            <p>{ley.texto}</p>
                          </article>
                        ))}
                      </div>
                    </section>
                  )}
                </>
              ) : (
                <div className={styles.culturaGrid}>
                  {mun.cultura.map((item) => (
                    <article className={styles.culturaCard} key={item.titulo}>
                      <span className={styles.culturaIcon} aria-hidden="true">{item.icono}</span>
                      <h3>{item.titulo}</h3>
                      <p>{item.texto}</p>
                    </article>
                  ))}
                </div>
              )}
            </div>
          </div>
        )}

        {/* TAB: GOBIERNO */}
        {activeTab === 'gobierno' && !mun.provinciaFicha && (
          <div key="gobierno" className={styles.tabPanel}>
            <div className={styles.panelHeader}>
              <div className={styles.panelHeaderIcon}>🏢</div>
              <h2 className={styles.panelHeaderTitle}>Gobierno Municipal de {mun.nombre}</h2>
            </div>
            <div className={styles.panelBody}>
              {mun.autoridades?.length > 0 && (
                <div className={styles.autoridadesGrid}>
                  {mun.autoridades.map((autoridad) => (
                    <article className={styles.autoridadCard} key={autoridad.cargo}>
                      <span aria-hidden="true">🏛️</span>
                      <div>
                        <h3>{autoridad.cargo}</h3>
                        <p>{autoridad.detalle}</p>
                      </div>
                    </article>
                  ))}
                </div>
              )}

              <table className={styles.dataTable} style={{ marginTop: mun.autoridades?.length ? '1.25rem' : 0 }}>
                <tbody>
                  <tr>
                    <th>Dirección de la Alcaldía</th>
                    <td>{mun.direccion !== 'N/D' ? `${mun.direccion} · ${mun.nombre}, Bolivia` : <span style={{ color: 'var(--color-text-muted)', fontStyle: 'italic' }}>No disponible</span>}</td>
                  </tr>
                  <tr>
                    <th>Teléfono</th>
                    <td>{mun.telefono !== 'N/D' ? `${mun.telefono} (Internacional: +591 ${mun.telefono})` : <span style={{ color: 'var(--color-text-muted)', fontStyle: 'italic' }}>No disponible</span>}</td>
                  </tr>
                  <tr>
                    <th>Sitio web oficial</th>
                    <td>
                      {mun.web
                        ? <a href={`https://${mun.web}`} target="_blank" rel="noopener noreferrer" style={{ color: 'var(--color-primary)', fontWeight: 600, textDecoration: 'underline' }}>{mun.web}</a>
                        : <span style={{ color: 'var(--color-text-muted)', fontStyle: 'italic' }}>No disponible</span>}
                    </td>
                  </tr>
                  {!mun.autoridades?.length && (
                    <tr>
                      <th>Alcalde Municipal</th>
                      <td><strong>{mun.alcalde !== 'N/D' ? mun.alcalde : <span style={{ color: 'var(--color-text-muted)', fontStyle: 'italic' }}>No disponible</span>}</strong></td>
                    </tr>
                  )}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {/* TAB: DEMOGRAFÍA */}
        {activeTab === 'demografia' && !mun.provinciaFicha && (
          <div key="demografia" className={styles.tabPanel}>
            <div className={styles.panelHeader}>
              <div className={styles.panelHeaderIcon}>👥</div>
              <h2 className={styles.panelHeaderTitle}>Demografía del Municipio</h2>
            </div>
            <div className={styles.panelBody}>
              <div className={styles.panelGrid3} style={{ marginBottom: '1.5rem' }}>
                <div className={styles.statCard}>
                  <span className={styles.statCardLabel}>Población</span>
                  <span className={styles.statCardValue}>{mun.poblacion !== 'N/D' ? mun.poblacion : '—'}</span>
                  <span className={styles.statCardSub}>{mun.poblacion !== 'N/D' ? `Habitantes (Censo ${mun.anoCenso})` : 'Dato no disponible'}</span>
                </div>
                {mun.rankingDep !== 'N/D' && (
                  <div className={styles.statCard}>
                    <span className={styles.statCardLabel}>Ranking depart.</span>
                    <span className={styles.statCardValue}>{mun.rankingDep}</span>
                    <span className={styles.statCardSub}>En el departamento</span>
                  </div>
                )}
                <div className={styles.statCard}>
                  <span className={styles.statCardLabel}>Gentilicio</span>
                  <span className={styles.statCardValue} style={{ fontSize: '1rem' }}>{mun.gentilicio}</span>
                </div>
                {mun.provinciaFicha && (
                  <div className={styles.statCard}>
                    <span className={styles.statCardLabel}>{mun.provinciaFicha.nombre}</span>
                    <span className={styles.statCardValue}>{mun.provinciaFicha.poblacionTotal}</span>
                    <span className={styles.statCardSub}>Habitantes · Censo {mun.provinciaFicha.anoCenso}</span>
                  </div>
                )}
              </div>
              <table className={styles.dataTable}>
                <tbody>
                  <tr>
                    <th>Densidad de población</th>
                    <td style={{ color: 'var(--color-text-muted)', fontStyle: 'italic' }}>Dato no disponible</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        )}

        {/* TAB: TERRITORIO */}
        {activeTab === 'territorio' && (
          <div key="territorio" className={styles.tabPanel}>
            <div className={styles.panelHeader}>
              <div className={styles.panelHeaderIcon}>🌄</div>
              <h2 className={styles.panelHeaderTitle}>
                {mun.provinciaFicha ? `Altiplano, paisaje y territorio de ${mun.nombre}` : 'Territorio y Geografía'}
              </h2>
            </div>
            <div className={styles.panelBody}>
              {mun.provinciaFicha ? (
                <section className={styles.territorioPresentacion} aria-label={`Territorio de ${mun.nombre}`}>
                  <div className={styles.territorioMetricas}>
                    {metricasTerritoriales.map((metrica) => (
                      <article className={styles.territorioMetrica} key={metrica.etiqueta}>
                        <span>{metrica.etiqueta}</span>
                        <strong>{metrica.valor}</strong>
                        <small>{metrica.detalle}</small>
                      </article>
                    ))}
                  </div>

                  <div className={styles.territorioHistoria}>
                    {mun.territorio?.ubicacion && (
                      <article>
                        <span>Ubicación</span>
                        <p>{mun.territorio.ubicacion}</p>
                      </article>
                    )}
                    {mun.territorio?.relieve && (
                      <article>
                        <span>Relieve y paisaje</span>
                        <p>{mun.territorio.relieve}</p>
                      </article>
                    )}
                    {mun.territorio?.limites && (
                      <article>
                        <span>Límites territoriales</span>
                        <p>{mun.territorio.limites}</p>
                      </article>
                    )}
                    <div className={styles.coordenadasPresentacion}>
                      <span>Coordenadas geográficas</span>
                      <div>
                        <strong>{mun.lat}°</strong>
                        <small>{mun.latStr}</small>
                      </div>
                      <div>
                        <strong>{mun.lng}°</strong>
                        <small>{mun.lngStr}</small>
                      </div>
                    </div>
                  </div>
                </section>
              ) : (
              <div className={styles.panelGrid2}>
                <div>
                  <div className={styles.panelGrid2} style={{ gap: '0.65rem', marginBottom: '1.25rem' }}>
                    <div className={styles.statCard}>
                      <span className={styles.statCardLabel}>Altitud</span>
                      <span className={styles.statCardValue}>{mun.altitud.toLocaleString('en-US')} m</span>
                      <span className={styles.statCardSub}>Sobre el nivel del mar</span>
                    </div>
                    <div className={styles.statCard}>
                      <span className={styles.statCardLabel}>Zona Horaria</span>
                      <span className={styles.statCardValue}>UTC -4</span>
                      <span className={styles.statCardSub}>America/La_Paz</span>
                    </div>
                  </div>
                  <table className={styles.dataTable}>
                    <tbody>
                      <tr><th>Superficie</th><td>{mun.territorio?.superficie || <span style={{ color: 'var(--color-text-muted)', fontStyle: 'italic' }}>No disponible</span>}</td></tr>
                      {mun.territorio?.ubicacion && <tr><th>Ubicación</th><td>{mun.territorio.ubicacion}</td></tr>}
                      {mun.territorio?.relieve && <tr><th>Relieve</th><td>{mun.territorio.relieve}</td></tr>}
                      {mun.territorio?.clima && <tr><th>Clima</th><td>{mun.territorio.clima}</td></tr>}
                      {mun.territorio?.limites && <tr><th>Límites territoriales</th><td>{mun.territorio.limites}</td></tr>}
                      <tr><th>Horario de verano</th><td style={{ fontSize: '0.85rem', color: 'var(--color-text-muted)' }}>Bolivia no aplica cambio horario estacional</td></tr>
                    </tbody>
                  </table>
                </div>
                <div>
                  <div className={styles.subHeading} style={{ marginTop: 0 }}>📡 Coordenadas Geográficas</div>
                  <div className={styles.coordBox}>
                    <div className={styles.coordRow}>
                      <span className={styles.coordLabel}>Latitud</span>
                      <span className={styles.coordValue}>{mun.lat}°</span>
                      <span className={styles.coordSub}>{mun.latStr}</span>
                    </div>
                    <div className={styles.coordRow}>
                      <span className={styles.coordLabel}>Longitud</span>
                      <span className={styles.coordValue}>{mun.lng}°</span>
                      <span className={styles.coordSub}>{mun.lngStr}</span>
                    </div>
                  </div>
                  {mun.idiomas && mun.idiomas.length > 0 && (
                    <>
                      <div className={styles.subHeading}>🌐 Nombre en otros idiomas</div>
                      <div className={styles.langGrid}>
                        {mun.idiomas.map(item => (
                          <div key={item.lang} className={styles.langItem}>
                            <div className={styles.langName}>{item.lang}</div>
                            <div className={styles.langValue}>{item.name}</div>
                          </div>
                        ))}
                      </div>
                    </>
                  )}
                </div>
              </div>
              )}
            </div>
          </div>
        )}

        {/* TAB: TRANSPORTE */}
        {activeTab === 'transporte' && (
          <div key="transporte" className={styles.tabPanel}>
            <div className={styles.panelHeader}>
              <div className={styles.panelHeaderIcon}>✈️</div>
              <h2 className={styles.panelHeaderTitle}>Medios de Transporte</h2>
            </div>
            <div className={styles.panelBody}>
              <div className={styles.subHeading} style={{ marginTop: 0 }}>Aeropuertos Cercanos</div>
              <div className={styles.transportGrid}>
                {mun.aeropuertos.map((a, i) => (
                  <div key={i} className={styles.transportItem}>
                    <span className={styles.transportIcon}>✈️</span>
                    <div>
                      <div className={styles.transportName}>{a.nombre}</div>
                      <div className={styles.transportDist}>{a.dist}</div>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        )}

        {/* TAB: VECINOS */}
        {activeTab === 'vecinos' && (
          <div key="vecinos" className={styles.tabPanel}>
            <div className={styles.panelHeader}>
              <div className={styles.panelHeaderIcon}>🗺️</div>
              <h2 className={styles.panelHeaderTitle}>Municipios Vecinos de {mun.nombre}</h2>
            </div>
            <div className={styles.panelBody}>
              {mun.vecinos && mun.vecinos.length > 0 ? (
                <div className={styles.neighborGrid}>
                  {mun.vecinos.map((v) => (
                    <div key={v.nombre} className={styles.neighborCard}>
                      <div className={styles.neighborName}>{v.nombre}</div>
                      <div className={styles.neighborDist}>📍 {v.dist}</div>
                    </div>
                  ))}
                </div>
              ) : (
                <p style={{ color: 'var(--color-text-muted)', fontStyle: 'italic' }}>No hay datos de municipios vecinos.</p>
              )}
            </div>
          </div>
        )}

        {/* TAB: DISTANCIAS */}
        {activeTab === 'distancias' && (
          <div key="distancias" className={styles.tabPanel}>
            <div className={styles.panelHeader}>
              <div className={styles.panelHeaderIcon}>📍</div>
              <h2 className={styles.panelHeaderTitle}>Distancias a Principales Ciudades</h2>
            </div>
            <div className={styles.panelBody}>
              <p style={{ fontSize: '0.78rem', color: 'var(--color-text-muted)', marginBottom: '1rem' }}>
                Distancias calculadas en línea recta desde {mun.nombre}.
              </p>
              {mun.distancias && mun.distancias.length > 0 ? (
                <div className={styles.distanceGrid}>
                  {mun.distancias.map((d) => (
                    <div key={d.nombre} className={styles.distanceItem}>
                      <span className={styles.distanceName}>{d.closest ? '🏆 ' : ''}{d.nombre}</span>
                      <span className={styles.distanceKm} style={d.closest ? { background: 'rgba(255,184,67,0.15)', color: '#b7791f' } : {}}>
                        {d.km}
                      </span>
                    </div>
                  ))}
                </div>
              ) : (
                <p style={{ color: 'var(--color-text-muted)', fontStyle: 'italic' }}>No hay datos de distancias.</p>
              )}
            </div>
          </div>
        )}

        {/* Volver atrás y Carrusel */}
        <div className={styles.carouselContainer}>
          {mostrarRelacionados && (
            <>
              <div className={styles.carouselHeader}>
                <h2 className={styles.carouselTitle}>
                  {mun.provinciaFicha
                    ? `Conoce también ${municipiosRelacionados[0]?.nombre || mun.provinciaFicha.nombre}`
                    : 'Explorar otros Municipios'}
                </h2>
                {!mun.provinciaFicha && (
                  <input
                    type="text"
                    placeholder="Buscar municipio..."
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                    className={styles.carouselSearch}
                  />
                )}
              </div>

              <div className={styles.carouselWrapper}>
                {municipiosVisibles.map(m => (
                  <Link href={`/institucion/historia/${m.slug}`} key={m.slug} className={styles.carouselItem}>
                    <div className={styles.carouselItemIcon}>🏛️</div>
                    <div className={styles.carouselItemName}>{m.nombre}</div>
                    <div className={styles.carouselItemProv}>Prov. {m.provincia}</div>
                  </Link>
                ))}

                {municipiosVisibles.length === 0 && (
                  <p style={{ padding: '1rem', color: 'var(--color-text-muted)' }}>No se encontraron municipios con ese nombre.</p>
                )}
              </div>
            </>
          )}

          <Link href="/institucion/historia" className={styles.backLink} style={{ marginTop: '2rem' }}>
            ← Ver todos los municipios del Departamento
          </Link>
        </div>

      </div>
    </div>
  );
}

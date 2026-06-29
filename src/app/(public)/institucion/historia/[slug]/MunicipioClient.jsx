'use client';

import React, { useState } from 'react';
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

const TABS = [
  { id: 'intro',      icon: '🏛️', label: 'El Municipio' },
  { id: 'gobierno',   icon: '🏢', label: 'Gobierno' },
  { id: 'demografia', icon: '👥', label: 'Demografía' },
  { id: 'territorio', icon: '🌄', label: 'Territorio' },
  { id: 'transporte', icon: '✈️', label: 'Transporte' },
  { id: 'vecinos',    icon: '🗺️', label: 'Vecinos' },
  { id: 'distancias', icon: '📍', label: 'Distancias' },
];

export default function MunicipioClient({ mun }) {
  const [activeTab, setActiveTab] = useState('intro');

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
            <a href="/">Inicio</a><span>›</span>
            <a href="/institucion">Institución</a><span>›</span>
            <a href="/institucion/historia">Historia</a><span>›</span>
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
                <span className={styles.heroStatValue}>{mun.altitud.toLocaleString()}m</span>
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
          {TABS.map((tab) => (
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
              <h2 className={styles.panelHeaderTitle}>El Municipio de {mun.nombre}</h2>
            </div>
            <div className={styles.panelBody}>
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
                      <span className={styles.statCardValue}>Bolivia 🇧🇴</span>
                    </div>
                    <div className={styles.statCard}>
                      <span className={styles.statCardLabel}>Código municipal</span>
                      <span className={styles.statCardValue} style={{ fontFamily: 'monospace' }}>{mun.codigo}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        )}

        {/* TAB: GOBIERNO */}
        {activeTab === 'gobierno' && (
          <div key="gobierno" className={styles.tabPanel}>
            <div className={styles.panelHeader}>
              <div className={styles.panelHeaderIcon}>🏢</div>
              <h2 className={styles.panelHeaderTitle}>Gobierno Municipal de {mun.nombre}</h2>
            </div>
            <div className={styles.panelBody}>
              <table className={styles.dataTable}>
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
                  <tr>
                    <th>Alcalde Municipal</th>
                    <td><strong>{mun.alcalde !== 'N/D' ? mun.alcalde : <span style={{ color: 'var(--color-text-muted)', fontStyle: 'italic' }}>No disponible</span>}</strong></td>
                  </tr>
                  <tr>
                    <th>Partido Político</th>
                    <td>{mun.partido !== 'N/D' ? <span className={styles.chip}>🌿 {mun.partido}</span> : <span style={{ color: 'var(--color-text-muted)', fontStyle: 'italic' }}>No disponible</span>}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        )}

        {/* TAB: DEMOGRAFÍA */}
        {activeTab === 'demografia' && (
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
              <h2 className={styles.panelHeaderTitle}>Territorio y Geografía</h2>
            </div>
            <div className={styles.panelBody}>
              <div className={styles.panelGrid2}>
                <div>
                  <div className={styles.panelGrid2} style={{ gap: '0.65rem', marginBottom: '1.25rem' }}>
                    <div className={styles.statCard}>
                      <span className={styles.statCardLabel}>Altitud</span>
                      <span className={styles.statCardValue}>{mun.altitud.toLocaleString()} m</span>
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
                      <tr><th>Superficie</th><td style={{ color: 'var(--color-text-muted)', fontStyle: 'italic' }}>No disponible</td></tr>
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

        {/* Volver atrás */}
        <a href="/institucion/historia" className={styles.backLink}>
          ← Ver todos los municipios de Oruro
        </a>

      </div>
    </div>
  );
}

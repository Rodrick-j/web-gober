'use client';

import { useEffect, useMemo, useRef, useState } from 'react';
import Link from 'next/link';
import {
  BarChart3, Layers, Table2, Info, Search, X, Download, ChevronRight, ChevronDown,
  Folder, Database, MapPin, SlidersHorizontal, Menu,
} from 'lucide-react';
import {
  GRUPOS, INDICADORES, RAMPAS, METODOS, calcularCortes, claseDe, coloresPara, fmtEntero,
} from './indicadores';
import styles from './geoportal.module.css';

const BASES = {
  claro: {
    nombre: 'Claro',
    url: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
    attr: '© OpenStreetMap · © CARTO',
  },
  calles: {
    nombre: 'Calles',
    url: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    attr: '© OpenStreetMap',
  },
  satelite: {
    nombre: 'Satélite',
    url: 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
    attr: 'Imágenes © Esri',
  },
  topo: {
    nombre: 'Topográfico',
    url: 'https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png',
    attr: '© OpenStreetMap · © OpenTopoMap',
  },
};

const SIN_DATO = '#cfd4dc';
const RAIL = [
  { id: 'indicadores', label: 'Información estadística', Icon: BarChart3 },
  { id: 'capas', label: 'Capas y mapa base', Icon: Layers },
  { id: 'ranking', label: 'Ranking y tabla', Icon: Table2 },
  { id: 'acerca', label: 'Acerca de los datos', Icon: Info },
];

const norm = (s) => (s || '').normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();

export default function GeoportalOruro() {
  const mapDiv = useRef(null);
  const mapRef = useRef(null);
  const LRef = useRef(null);
  const tileRef = useRef(null);
  const muniLayerRef = useRef(null);
  const provLayerRef = useRef(null);
  const labelLayerRef = useRef(null);
  const layersByCode = useRef({});
  const restilarRef = useRef(null);

  const [geo, setGeo] = useState(null); // { mun, prov, dep }
  const [error, setError] = useState('');
  const [mapaListo, setMapaListo] = useState(false);

  const [tab, setTab] = useState('indicadores');
  const [panelAbierto, setPanelAbierto] = useState(false);
  const [abiertos, setAbiertos] = useState({ censo: true, territorio: false, poa: false });
  const [indId, setIndId] = useState('poblacion');
  const [nClases, setNClases] = useState(5);
  const [metodo, setMetodo] = useState('cuantiles');
  const [rampa, setRampa] = useState('institucional');
  const [base, setBase] = useState('claro');
  const [provincia, setProvincia] = useState('');
  const [verProvincias, setVerProvincias] = useState(true);
  const [verEtiquetas, setVerEtiquetas] = useState(true);
  const [opacidad, setOpacidad] = useState(0.85);
  const [busqueda, setBusqueda] = useState('');
  const [seleccion, setSeleccion] = useState(null);

  const ind = INDICADORES[indId];

  // ---------- datos ----------
  const features = useMemo(() => (geo ? geo.mun.features : []), [geo]);
  const provincias = useMemo(() => (geo ? geo.prov.features.map((f) => f.properties.nombre) : []), [geo]);

  const filas = useMemo(
    () => features.map((f) => ({ ...f.properties, valor: ind.get(f.properties) })),
    [features, ind],
  );

  const { cortes, colores, conDato } = useMemo(() => {
    const vals = filas
      .filter((r) => (!provincia || r.provincia === provincia) && r.valor != null && !Number.isNaN(r.valor))
      .map((r) => r.valor);
    const cs = calcularCortes(vals, nClases, metodo);
    return { cortes: cs, colores: coloresPara(cs.length + 1, rampa), conDato: vals.length };
  }, [filas, provincia, nClases, metodo, rampa]);

  const resumen = useMemo(() => {
    const sel = filas.filter((r) => (!provincia || r.provincia === provincia) && r.valor != null);
    if (!sel.length) return null;
    const suma = sel.reduce((a, r) => a + r.valor, 0);
    const orden = [...sel].sort((a, b) => b.valor - a.valor);
    return { n: sel.length, suma, promedio: suma / sel.length, max: orden[0], min: orden[orden.length - 1] };
  }, [filas, provincia]);

  const ranking = useMemo(() => {
    const q = norm(busqueda);
    return [...filas]
      .filter((r) => (!provincia || r.provincia === provincia) && (!q || norm(r.nombre).includes(q) || norm(r.provincia).includes(q)))
      .sort((a, b) => (b.valor ?? -Infinity) - (a.valor ?? -Infinity));
  }, [filas, provincia, busqueda]);

  const maxValor = useMemo(() => Math.max(1, ...filas.map((r) => r.valor ?? 0)), [filas]);

  // ---------- carga de GeoJSON ----------
  useEffect(() => {
    let vivo = true;
    Promise.all(
      ['municipios', 'provincias', 'departamento'].map((n) =>
        fetch(`/geoportal/oruro_${n}.geojson`).then((r) => {
          if (!r.ok) throw new Error(n);
          return r.json();
        }),
      ),
    )
      .then(([mun, prov, dep]) => vivo && setGeo({ mun, prov, dep }))
      .catch(() => vivo && setError('No se pudieron cargar los límites del mapa. Intenta recargar la página.'));
    return () => { vivo = false; };
  }, []);

  // ---------- creación del mapa ----------
  useEffect(() => {
    if (!geo || !mapDiv.current) return undefined;
    let cancelado = false;
    let map;

    Promise.all([import('leaflet'), import('leaflet/dist/leaflet.css')]).then(([mod]) => {
      if (cancelado || !mapDiv.current) return;
      const L = mod.default || mod;
      LRef.current = L;

      map = L.map(mapDiv.current, { zoomControl: false, zoomSnap: 0.25, minZoom: 5, attributionControl: true });
      L.control.zoom({ position: 'topright' }).addTo(map);
      L.control.scale({ metric: true, imperial: false, position: 'bottomright' }).addTo(map);
      mapRef.current = map;

      L.geoJSON(geo.dep, { style: { color: '#67181a', weight: 3, fill: false, opacity: 0.9 }, interactive: false }).addTo(map);

      const muni = L.geoJSON(geo.mun, {
        style: { color: '#ffffff', weight: 1, fillColor: SIN_DATO, fillOpacity: 0.85 },
        onEachFeature: (f, layer) => {
          layersByCode.current[f.properties.pcode] = layer;
          layer.bindTooltip('', { sticky: true, className: styles.tip, direction: 'top' });
          layer.on({
            mouseover: () => {
              layer.setStyle({ weight: 2.5, color: '#0f172a' });
              layer.bringToFront();
            },
            mouseout: () => restilarRef.current?.(layer),
            click: () => setSeleccion(f.properties),
          });
        },
      }).addTo(map);
      muniLayerRef.current = muni;

      const prov = L.geoJSON(geo.prov, {
        style: { color: '#67181a', weight: 1.6, fill: false, opacity: 0.75, dashArray: '5 4' },
        interactive: false,
      }).addTo(map);
      provLayerRef.current = prov;

      labelLayerRef.current = L.layerGroup();
      geo.mun.features.forEach((f) => {
        const { lat, lng, nombre } = f.properties;
        if (lat == null) return;
        L.marker([lat, lng], {
          interactive: false,
          icon: L.divIcon({ className: styles.etiqueta, html: `<span>${nombre}</span>`, iconSize: [0, 0] }),
        }).addTo(labelLayerRef.current);
      });

      map.fitBounds(muni.getBounds(), { padding: [20, 20] });
      setMapaListo(true);
    });

    return () => {
      cancelado = true;
      if (map) map.remove();
      mapRef.current = null;
      muniLayerRef.current = null;
      layersByCode.current = {};
      setMapaListo(false);
    };
  }, [geo]);

  // ---------- mapa base ----------
  useEffect(() => {
    const L = LRef.current;
    const map = mapRef.current;
    if (!mapaListo || !L || !map) return;
    if (tileRef.current) map.removeLayer(tileRef.current);
    const b = BASES[base];
    tileRef.current = L.tileLayer(b.url, { attribution: b.attr, maxZoom: 18, subdomains: 'abc' }).addTo(map);
    tileRef.current.bringToBack();
  }, [base, mapaListo]);

  // ---------- estilo temático ----------
  useEffect(() => {
    const muni = muniLayerRef.current;
    if (!mapaListo || !muni) return;
    const aplicar = (layer) => {
      const p = layer.feature.properties;
      const v = ind.get(p);
      const fuera = provincia && p.provincia !== provincia;
      const color = v == null || Number.isNaN(v) ? SIN_DATO : colores[claseDe(v, cortes)];
      layer.setStyle({
        color: '#ffffff',
        weight: 1,
        fillColor: fuera ? '#e5e7eb' : color,
        fillOpacity: fuera ? 0.35 : opacidad,
      });
      layer.setTooltipContent(
        `<strong>${p.nombre}</strong><br/><span>${p.provincia}</span><br/>${ind.label}: <b>${v == null ? 'Sin dato' : `${ind.fmt(v)}${ind.unidad === 'Bs' || ind.unidad === 'Bs/hab' ? '' : ` ${ind.unidad}`}`}</b>`,
      );
    };
    restilarRef.current = aplicar;
    muni.eachLayer(aplicar);
  }, [ind, cortes, colores, provincia, opacidad, mapaListo]);

  // ---------- capas opcionales ----------
  useEffect(() => {
    const map = mapRef.current;
    const prov = provLayerRef.current;
    if (!mapaListo || !map || !prov) return;
    if (verProvincias) prov.addTo(map);
    else map.removeLayer(prov);
  }, [verProvincias, mapaListo]);

  useEffect(() => {
    const map = mapRef.current;
    const labels = labelLayerRef.current;
    if (!mapaListo || !map || !labels) return undefined;
    const actualizar = () => {
      if (verEtiquetas && map.getZoom() >= 8) labels.addTo(map);
      else map.removeLayer(labels);
    };
    actualizar();
    map.on('zoomend', actualizar);
    return () => map.off('zoomend', actualizar);
  }, [verEtiquetas, mapaListo]);

  // ---------- zoom al filtrar provincia / seleccionar ----------
  useEffect(() => {
    const map = mapRef.current;
    const muni = muniLayerRef.current;
    if (!mapaListo || !map || !muni) return;
    const L = LRef.current;
    const grupo = L.featureGroup();
    muni.eachLayer((l) => {
      if (!provincia || l.feature.properties.provincia === provincia) grupo.addLayer(l);
    });
    if (grupo.getLayers().length) map.flyToBounds(grupo.getBounds(), { padding: [30, 30], duration: 0.8 });
  }, [provincia, mapaListo]);

  const irA = (p) => {
    setSeleccion(p);
    const layer = layersByCode.current[p.pcode];
    if (layer && mapRef.current) mapRef.current.flyToBounds(layer.getBounds(), { padding: [60, 60], duration: 0.8, maxZoom: 10 });
    setPanelAbierto(false);
  };

  const descargarCSV = () => {
    const cab = ['Municipio', 'Provincia', 'Población 2024', 'Superficie km2', 'Densidad hab/km2', 'Altitud msnm', 'POA total Bs', 'POA inversión Bs', 'POA gasto corriente Bs'];
    const esc = (v) => `"${String(v ?? '').replace(/"/g, '""')}"`;
    const lineas = filas
      .sort((a, b) => a.nombre.localeCompare(b.nombre, 'es'))
      .map((r) => [r.nombre, r.provincia, r.poblacion, r.area_km2, r.densidad, r.altitud, r.poa_total, r.poa_inversion, r.poa_corriente].map(esc).join(','));
    const blob = new Blob([`﻿${[cab.map(esc).join(','), ...lineas].join('\n')}`], { type: 'text/csv;charset=utf-8' });
    const a = document.createElement('a');
    a.href = URL.createObjectURL(blob);
    a.download = 'geoportal_oruro_municipios.csv';
    a.click();
    URL.revokeObjectURL(a.href);
  };

  const rangoTexto = (i) => {
    const lo = i === 0 ? null : cortes[i - 1];
    const hi = i === cortes.length ? null : cortes[i];
    if (lo == null) return `≤ ${ind.fmt(hi)}`;
    if (hi == null) return `> ${ind.fmt(lo)}`;
    return `${ind.fmt(lo)} – ${ind.fmt(hi)}`;
  };

  const conteoClase = (i) =>
    filas.filter((r) => {
      if (provincia && r.provincia !== provincia) return false;
      return r.valor != null && claseDe(r.valor, cortes) === i;
    }).length;

  return (
    <main className={styles.page}>
      <header className={styles.cabecera}>
        <div>
          <span className={styles.etiquetaCab}>Geoportal departamental</span>
          <h1>Geoportal de Oruro</h1>
          <p>Mapas temáticos de los 35 municipios y 16 provincias del Departamento de Oruro.</p>
        </div>
        <button type="button" className={styles.btnPanel} onClick={() => setPanelAbierto((v) => !v)} aria-label="Abrir panel de filtros">
          <Menu size={18} /> Filtros
        </button>
      </header>

      <div className={styles.shell}>
        {/* ── Riel de herramientas ── */}
        <nav className={styles.rail} aria-label="Herramientas del geoportal">
          {RAIL.map(({ id, label, Icon }) => (
            <button
              key={id}
              type="button"
              title={label}
              aria-label={label}
              aria-pressed={tab === id}
              className={`${styles.railBtn} ${tab === id ? styles.railActivo : ''}`}
              onClick={() => { setTab(id); setPanelAbierto(true); }}
            >
              <Icon size={20} />
            </button>
          ))}
        </nav>

        {/* ── Panel lateral ── */}
        <aside className={`${styles.panel} ${panelAbierto ? styles.panelAbierto : ''}`}>
          <button type="button" className={styles.cerrarPanel} onClick={() => setPanelAbierto(false)} aria-label="Cerrar panel"><X size={18} /></button>

          {tab === 'indicadores' && (
            <>
              <h2 className={styles.tituloPanel}><BarChart3 size={18} /> Información estadística</h2>

              <div className={styles.arbol}>
                {GRUPOS.map((g) => (
                  <div key={g.id} className={styles.grupo}>
                    <button type="button" className={styles.grupoCab} onClick={() => setAbiertos((a) => ({ ...a, [g.id]: !a[g.id] }))} aria-expanded={!!abiertos[g.id]}>
                      {abiertos[g.id] ? <ChevronDown size={16} /> : <ChevronRight size={16} />}
                      <Folder size={16} /> <span>{g.label}</span>
                    </button>
                    {abiertos[g.id] && (
                      <div className={styles.grupoItems}>
                        {g.items.map((id) => (
                          <button key={id} type="button" className={`${styles.item} ${indId === id ? styles.itemActivo : ''}`} onClick={() => { setIndId(id); setPanelAbierto(false); }}>
                            <Database size={14} /> {INDICADORES[id].label}
                          </button>
                        ))}
                      </div>
                    )}
                  </div>
                ))}
                <div className={styles.pendiente}>
                  <Folder size={16} /> <span>CNPV 2012 y 2001</span>
                  <em>Próximamente</em>
                </div>
              </div>

              <div className={styles.filtros}>
                <h3><SlidersHorizontal size={15} /> Filtros del mapa</h3>

                <label className={styles.campo}>
                  <span>Provincia</span>
                  <select value={provincia} onChange={(e) => { setProvincia(e.target.value); setSeleccion(null); }}>
                    <option value="">Todo el departamento</option>
                    {provincias.map((p) => <option key={p} value={p}>{p}</option>)}
                  </select>
                </label>

                <label className={styles.campo}>
                  <span>Método de clasificación</span>
                  <select value={metodo} onChange={(e) => setMetodo(e.target.value)}>
                    {Object.entries(METODOS).map(([k, v]) => <option key={k} value={k}>{v}</option>)}
                  </select>
                </label>

                <label className={styles.campo}>
                  <span>Número de grupos: <b>{nClases}</b></span>
                  <input type="range" min="3" max="7" value={nClases} onChange={(e) => setNClases(Number(e.target.value))} />
                </label>

                <div className={styles.campo}>
                  <span>Paleta de colores</span>
                  <div className={styles.rampas}>
                    {Object.keys(RAMPAS).map((k) => (
                      <button key={k} type="button" aria-label={`Paleta ${k}`} aria-pressed={rampa === k} className={`${styles.rampa} ${rampa === k ? styles.rampaActiva : ''}`} onClick={() => setRampa(k)}
                        style={{ background: `linear-gradient(90deg, ${RAMPAS[k][0]}, ${RAMPAS[k][3]}, ${RAMPAS[k][6]})` }} />
                    ))}
                  </div>
                </div>
              </div>

              {resumen && (
                <div className={styles.resumen}>
                  <h3>{ind.label}</h3>
                  <p className={styles.desc}>{ind.desc}</p>
                  <div className={styles.kpis}>
                    {indId === 'poblacion' || indId === 'area_km2' || indId.startsWith('poa_') ? (
                      <div><small>Total ({resumen.n} municipios)</small><b>{ind.fmt(resumen.suma)}</b></div>
                    ) : (
                      <div><small>Promedio</small><b>{ind.fmt(resumen.promedio)}</b></div>
                    )}
                    <div><small>Mayor</small><b>{resumen.max.nombre}</b><i>{ind.fmt(resumen.max.valor)}</i></div>
                    <div><small>Menor</small><b>{resumen.min.nombre}</b><i>{ind.fmt(resumen.min.valor)}</i></div>
                  </div>
                  {conDato < (provincia ? filas.filter((r) => r.provincia === provincia).length : filas.length) && (
                    <p className={styles.aviso}>Hay municipios sin dato para este indicador (en gris en el mapa).</p>
                  )}
                </div>
              )}
            </>
          )}

          {tab === 'capas' && (
            <>
              <h2 className={styles.tituloPanel}><Layers size={18} /> Capas y mapa base</h2>
              <div className={styles.filtros}>
                <h3>Mapa base</h3>
                <div className={styles.bases}>
                  {Object.entries(BASES).map(([k, b]) => (
                    <button key={k} type="button" aria-pressed={base === k} className={`${styles.baseBtn} ${base === k ? styles.baseActiva : ''}`} onClick={() => setBase(k)}>{b.nombre}</button>
                  ))}
                </div>
                <h3>Capas</h3>
                <label className={styles.check}><input type="checkbox" checked={verProvincias} onChange={(e) => setVerProvincias(e.target.checked)} /> Límites de provincias</label>
                <label className={styles.check}><input type="checkbox" checked={verEtiquetas} onChange={(e) => setVerEtiquetas(e.target.checked)} /> Nombres de municipios (con zoom)</label>
                <label className={styles.campo}>
                  <span>Transparencia del color: <b>{Math.round((1 - opacidad) * 100)}%</b></span>
                  <input type="range" min="0.3" max="1" step="0.05" value={opacidad} onChange={(e) => setOpacidad(Number(e.target.value))} />
                </label>
              </div>
            </>
          )}

          {tab === 'ranking' && (
            <>
              <h2 className={styles.tituloPanel}><Table2 size={18} /> {ind.label}</h2>
              <div className={styles.buscador}>
                <Search size={16} />
                <input value={busqueda} onChange={(e) => setBusqueda(e.target.value)} placeholder="Buscar municipio o provincia…" aria-label="Buscar municipio o provincia" />
                {busqueda && <button type="button" onClick={() => setBusqueda('')} aria-label="Limpiar búsqueda"><X size={14} /></button>}
              </div>
              <ol className={styles.ranking}>
                {ranking.map((r, i) => (
                  <li key={r.pcode}>
                    <button type="button" onClick={() => irA(r)} className={seleccion?.pcode === r.pcode ? styles.rankActivo : ''}>
                      <span className={styles.pos}>{i + 1}</span>
                      <span className={styles.rankNombre}>{r.nombre}<small>{r.provincia}</small></span>
                      <span className={styles.rankValor}>{r.valor == null ? 'Sin dato' : ind.fmt(r.valor)}</span>
                      <span className={styles.barra}><i style={{ width: `${r.valor == null ? 0 : Math.max(2, (r.valor / maxValor) * 100)}%` }} /></span>
                    </button>
                  </li>
                ))}
              </ol>
              <button type="button" className={styles.descargar} onClick={descargarCSV}><Download size={16} /> Descargar tabla (CSV)</button>
            </>
          )}

          {tab === 'acerca' && (
            <>
              <h2 className={styles.tituloPanel}><Info size={18} /> Acerca de los datos</h2>
              <div className={styles.acerca}>
                <p><b>Límites administrativos:</b> 16 provincias y 35 municipios de Oruro, tomados de los límites oficiales publicados por OCHA (COD-AB), elaborados sobre la base del INE. Licencia CC BY-IGO.</p>
                <p><b>Población:</b> Censo de Población y Vivienda 2024, según las fichas municipales del portal. Algunos municipios aún no tienen dato cargado.</p>
                <p><b>Planificación (POA):</b> montos programados de gasto corriente e inversión por municipio, de la planificación municipal registrada por la Gobernación.</p>
                <p><b>Mapas base:</b> © OpenStreetMap, © CARTO, © Esri, © OpenTopoMap.</p>
                <p className={styles.aviso}>Este geoportal es referencial. Para cifras oficiales consulte al INE (ine.gob.bo).</p>
              </div>
            </>
          )}
        </aside>

        {/* ── Mapa ── */}
        <section className={styles.mapaWrap} aria-label="Mapa temático de Oruro">
          {error && <div className={styles.error}>{error}</div>}
          {!geo && !error && <div className={styles.cargando}>Cargando mapa de Oruro…</div>}
          <div ref={mapDiv} className={styles.mapa} />

          {geo && (
            <div className={styles.leyenda} aria-label="Leyenda">
              <strong>{ind.label}</strong>
              <small>{ind.unidad}</small>
              <ul>
                {colores.map((c, i) => (
                  <li key={c + i}><i style={{ background: c }} /> <span>{rangoTexto(i)}</span> <em>{conteoClase(i)}</em></li>
                ))}
                <li><i style={{ background: SIN_DATO }} /> <span>Sin dato</span> <em>{filas.filter((r) => (!provincia || r.provincia === provincia) && r.valor == null).length}</em></li>
              </ul>
            </div>
          )}

          {seleccion && (
            <div className={styles.ficha}>
              <button type="button" onClick={() => setSeleccion(null)} aria-label="Cerrar ficha" className={styles.cerrarFicha}><X size={16} /></button>
              <span className={styles.fichaProv}><MapPin size={13} /> Provincia {seleccion.provincia}</span>
              <h3>{seleccion.nombre}</h3>
              <dl>
                <div><dt>Población 2024</dt><dd>{seleccion.poblacion ? `${fmtEntero(seleccion.poblacion)} hab.` : 'Sin dato'}</dd></div>
                <div><dt>Superficie</dt><dd>{INDICADORES.area_km2.fmt(seleccion.area_km2)} km²</dd></div>
                <div><dt>Densidad</dt><dd>{seleccion.densidad ? `${INDICADORES.densidad.fmt(seleccion.densidad)} hab/km²` : 'Sin dato'}</dd></div>
                <div><dt>Altitud capital</dt><dd>{seleccion.altitud ? `${fmtEntero(seleccion.altitud)} msnm` : 'Sin dato'}</dd></div>
                <div><dt>Presupuesto POA</dt><dd>{seleccion.poa_total != null ? INDICADORES.poa_total.fmt(seleccion.poa_total) : 'Sin dato'}</dd></div>
                <div><dt>Inversión POA</dt><dd>{seleccion.poa_inversion != null ? INDICADORES.poa_inversion.fmt(seleccion.poa_inversion) : 'Sin dato'}</dd></div>
              </dl>
              {seleccion.slug && <Link href={`/institucion/historia/${seleccion.slug}`} className={styles.fichaLink}>Ver ficha completa del municipio →</Link>}
            </div>
          )}
        </section>
      </div>
    </main>
  );
}

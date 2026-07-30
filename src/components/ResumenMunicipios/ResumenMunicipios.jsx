'use client';

import React, { useMemo, useState } from 'react';
import planificacionData from '@/data/planificacion.json';
import { BarChart3, Calculator, MapPin, Search } from 'lucide-react';
import styles from './ResumenMunicipios.module.css';
import { getMuniFullName } from '@/utils/formatMuni';

export default function ResumenMunicipios() {
  const [searchTerm, setSearchTerm] = useState('');

  // 1. Agrupar y procesar datos por municipio
  const { dataPorMunicipio, totalesGenerales } = useMemo(() => {
    const mapa = {};
    const totales = {
      gastoCorriente: 0,
      inversion: 0,
      totalGeneral: 0
    };

    planificacionData.forEach(item => {
      const muni = item.municipio;
      const monto = Number(item.monto) || 0;
      const esGasto = item.tipo === 'GASTO CORRIENTE';
      const esInversion = item.tipo === 'INVERSION';

      if (!mapa[muni]) {
        mapa[muni] = { nombre: muni, gastoCorriente: 0, inversion: 0, total: 0 };
      }

      if (esGasto) {
        mapa[muni].gastoCorriente += monto;
        totales.gastoCorriente += monto;
      } else if (esInversion) {
        mapa[muni].inversion += monto;
        totales.inversion += monto;
      }

      mapa[muni].total += monto;
      totales.totalGeneral += monto;
    });

    const arrayData = Object.values(mapa).sort((a, b) => a.nombre.localeCompare(b.nombre));
    return { dataPorMunicipio: arrayData, totalesGenerales: totales };
  }, []);

  // 2. Filtrar por búsqueda
  const datosFiltrados = useMemo(() => {
    return dataPorMunicipio.filter(m => m.nombre.toLowerCase().includes(searchTerm.toLowerCase()));
  }, [dataPorMunicipio, searchTerm]);

  const formatMoney = (amount) => {
    if (!amount || amount === 0) return '-';
    return new Intl.NumberFormat('es-BO', { style: 'currency', currency: 'BOB', maximumFractionDigits: 0 }).format(amount);
  };

  const calcularPorcentaje = (valor, total) => {
    if (!total || total === 0) return 0;
    return ((valor / total) * 100).toFixed(1);
  };

  return (
    <div className={styles.container}>
      {/* Header y Buscador */}
      <div className={styles.header}>
        <div className={styles.titleGroup}>
          <BarChart3 className={styles.titleIcon} size={28} />
          <div>
            <h2 className={styles.title}>Resumen General por Municipio</h2>
            <p className={styles.subtitle}>Distribución de Gasto Corriente e Inversión</p>
          </div>
        </div>

        <div className={styles.searchGroup}>
          <Search className={styles.searchIcon} size={18} />
          <input 
            type="text" 
            placeholder="Buscar municipio..." 
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className={styles.searchInput}
          />
        </div>
      </div>

      {/* Totales Generales (Tarjetas Superiores) */}
      <div className={styles.totalesGrid}>
        <div className={styles.totalCard}>
          <div className={styles.totalLabel}>TOTAL GASTO CORRIENTE</div>
          <div className={styles.totalValueGasto}>{formatMoney(totalesGenerales.gastoCorriente)}</div>
          <div className={styles.totalBar}>
            <div 
              className={styles.totalBarFillGasto} 
              style={{ width: `${calcularPorcentaje(totalesGenerales.gastoCorriente, totalesGenerales.totalGeneral)}%` }}
            ></div>
          </div>
          <div className={styles.totalPercentage}>
            {calcularPorcentaje(totalesGenerales.gastoCorriente, totalesGenerales.totalGeneral)}% del Presupuesto
          </div>
        </div>

        <div className={styles.totalCard}>
          <div className={styles.totalLabel}>TOTAL INVERSIÓN</div>
          <div className={styles.totalValueInversion}>{formatMoney(totalesGenerales.inversion)}</div>
          <div className={styles.totalBar}>
            <div 
              className={styles.totalBarFillInversion} 
              style={{ width: `${calcularPorcentaje(totalesGenerales.inversion, totalesGenerales.totalGeneral)}%` }}
            ></div>
          </div>
          <div className={styles.totalPercentage}>
            {calcularPorcentaje(totalesGenerales.inversion, totalesGenerales.totalGeneral)}% del Presupuesto
          </div>
        </div>

        <div className={`${styles.totalCard} ${styles.totalCardMain}`}>
          <div className={styles.totalLabel}>PRESUPUESTO TOTAL (DEPARTAMENTO)</div>
          <div className={styles.totalValueMain}>{formatMoney(totalesGenerales.totalGeneral)}</div>
        </div>
      </div>

      {/* Tabla Resumen */}
      <div className={styles.tableContainer}>
        <div className={styles.tableResponsive}>
          <table className={styles.dataTable}>
            <thead>
              <tr>
                <th width="25%">Municipio (Etiquetas de fila)</th>
                <th width="30%">Gasto Corriente</th>
                <th width="30%">Inversión</th>
                <th width="15%" style={{ textAlign: 'right' }}>Total General</th>
              </tr>
            </thead>
            <tbody>
              {datosFiltrados.length > 0 ? (
                datosFiltrados.map((item, index) => {
                  const pctGasto = calcularPorcentaje(item.gastoCorriente, item.total);
                  const pctInversion = calcularPorcentaje(item.inversion, item.total);

                  return (
                    <tr key={index}>
                      <td className={styles.muniCell}>
                        <MapPin size={16} className={styles.muniIcon} />
                        {getMuniFullName(item.nombre)}
                      </td>
                      <td>
                        <div className={styles.valCell}>
                          <span>{formatMoney(item.gastoCorriente)}</span>
                          <span className={styles.pctGasto}>{pctGasto}%</span>
                        </div>
                        <div className={styles.barContainer}>
                          <div className={styles.barFillGasto} style={{ width: `${pctGasto}%` }}></div>
                        </div>
                      </td>
                      <td>
                        <div className={styles.valCell}>
                          <span>{formatMoney(item.inversion)}</span>
                          <span className={styles.pctInversion}>{pctInversion}%</span>
                        </div>
                        <div className={styles.barContainer}>
                          <div className={styles.barFillInversion} style={{ width: `${pctInversion}%` }}></div>
                        </div>
                      </td>
                      <td className={styles.totalCell}>
                        {formatMoney(item.total)}
                      </td>
                    </tr>
                  )
                })
              ) : (
                <tr>
                  <td colSpan="4" className={styles.emptyState}>No se encontró el municipio.</td>
                </tr>
              )}
            </tbody>
            <tfoot>
              <tr className={styles.tfootRow}>
                <td>TOTAL GENERAL</td>
                <td>{formatMoney(totalesGenerales.gastoCorriente)}</td>
                <td>{formatMoney(totalesGenerales.inversion)}</td>
                <td style={{ textAlign: 'right' }}>{formatMoney(totalesGenerales.totalGeneral)}</td>
              </tr>
            </tfoot>
          </table>
        </div>
      </div>
    </div>
  );
}

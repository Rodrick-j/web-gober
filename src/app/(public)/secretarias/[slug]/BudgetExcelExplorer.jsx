'use client';

import { useState, useMemo } from 'react';
import { Search, Download, Printer, RefreshCw, FileSpreadsheet, Layers, Coins } from 'lucide-react';
import budgetsData from './municipalitiesBudgets.json';

// Simple list of municipality IDs and names to match keys in JSON
const municipios = [
  { id: "oruro", nombre: "Gob. Autónomo Municipal de Oruro (Capital)" },
  { id: "challapata", nombre: "Gob. Autónomo Municipal de Challapata" },
  { id: "huanuni", nombre: "Gob. Autónomo Municipal de Huanuni" },
  { id: "caracollo", nombre: "Gob. Autónomo Municipal de Caracollo" },
  { id: "corque", nombre: "Gob. Autónomo Municipal de Corque" },
  { id: "toledo", nombre: "Gob. Autónomo Municipal de Toledo" },
  { id: "salinas", nombre: "Gob. Autónomo Municipal de Salinas de Garci Mendoza" },
  { id: "turco", nombre: "Gob. Autónomo Municipal de Turco" },
  { id: "santiago_de_huari", nombre: "Gob. Autónomo Municipal de Santiago de Huari" },
  { id: "curahuara_de_carangas", nombre: "Gob. Autónomo Municipal de Curahuara de Carangas" },
  { id: "pazna", nombre: "Gob. Autónomo Municipal de Pazña" },
  { id: "huayllamarca", nombre: "Gob. Autónomo Municipal de Huayllamarca" },
  { id: "machacamarca", nombre: "Gob. Autónomo Municipal de Machacamarca" },
  { id: "eucaliptos", nombre: "Gob. Autónomo Municipal de Eucaliptos" },
  { id: "santiago_de_andamarca", nombre: "Gob. Autónomo Municipal de Santiago de Andamarca" },
  { id: "sabaya", nombre: "Gob. Autónomo Municipal de Sabaya" },
  { id: "santuario_de_quillacas", nombre: "Gob. Autónomo Municipal de Santuario de Quillacas" },
  { id: "antequera", nombre: "Gob. Autónomo Municipal de Antequera" },
  { id: "el_choro", nombre: "Gob. Autónomo Municipal de El Choro" },
  { id: "totora", nombre: "Gob. Autónomo Municipal de Totora" },
  { id: "poopo", nombre: "Gob. Autónomo Municipal de Poopó" },
  { id: "belen_de_andamarca", nombre: "Gob. Autónomo Municipal de Belén de Andamarca" },
  { id: "cruz_de_machacamarca", nombre: "Gob. Autónomo Municipal de Cruz de Machacamarca" },
  { id: "esmeralda", nombre: "Gob. Autónomo Municipal de Esmeralda" },
  { id: "carangas", nombre: "Gob. Autónomo Municipal de Carangas" },
  { id: "coipasa", nombre: "Gob. Autónomo Municipal de Coipasa" },
  { id: "escara", nombre: "Gob. Autónomo Municipal de Escara" },
  { id: "huachacalla", nombre: "Gob. Autónomo Municipal de Huachacalla" },
  { id: "la_rivera", nombre: "Gob. Autónomo Municipal de La Rivera" },
  { id: "pampa_aullagas", nombre: "Gob. Autónomo Municipal de Pampa Aullagas" },
  { id: "todos_santos", nombre: "Gob. Autónomo Municipal de Todos Santos" },
  { id: "yunyugo_de_litoral", nombre: "Gob. Autónomo Municipal de Yunguyo del Litoral" },
  { id: "chipaya", nombre: "Gob. Autónomo Municipal de Chipaya" },
  { id: "soracachi", nombre: "Gob. Autónomo Municipal de Soracachi" },
  { id: "choquecota", nombre: "Gob. Autónomo Municipal de Choquecota" }
].sort((a, b) => a.nombre.localeCompare(b.nombre));

const formatBOB = (valStr) => {
  const val = parseFloat((valStr || "0").replace(/,/g, ''));
  if (isNaN(val) || val === 0) return "-";
  return new Intl.NumberFormat('es-BO', { minimumFractionDigits: 0, maximumFractionDigits: 0 }).format(val);
};

export default function BudgetExcelExplorer() {
  const [selectedMuni, setSelectedMuni] = useState('antequera');
  const [searchQuery, setSearchQuery] = useState('');
  const [onlyPrograms, setOnlyPrograms] = useState(false);

  const rawRows = useMemo(() => {
    return budgetsData[selectedMuni] || [];
  }, [selectedMuni]);

  const filteredRows = useMemo(() => {
    return rawRows.filter(row => {
      const isProgram = row.proyecto === '0 000';
      if (onlyPrograms && !isProgram) return false;
      
      const query = searchQuery.toLowerCase();
      return (
        row.description.toLowerCase().includes(query) ||
        row.prg.includes(query) ||
        row.proyecto.includes(query)
      );
    });
  }, [rawRows, searchQuery, onlyPrograms]);

  // Calculate quick metrics for the selected municipality
  const metrics = useMemo(() => {
    let totalBudget = 0;
    let programsCount = 0;
    let projectsCount = 0;

    rawRows.forEach(row => {
      const isProgram = row.proyecto === '0 000';
      const val = parseFloat(row.total.replace(/,/g, '')) || 0;
      if (isProgram) {
        totalBudget += val;
        programsCount++;
      } else {
        projectsCount++;
      }
    });

    return { totalBudget, programsCount, projectsCount };
  }, [rawRows]);

  const exportToCSV = () => {
    const headers = ['Prg', 'Proyecto', 'Descripción', 'Grupo 1', 'Grupo 2', 'Grupo 3', 'Grupo 4', 'Grupo 5', 'Grupo 6', 'Grupo 7', 'Grupo 8', 'Grupo 9', 'Total'];
    const rows = filteredRows.map(r => [
      r.prg,
      r.proyecto,
      r.description,
      r.grupo1.replace(/,/g, ''),
      r.grupo2.replace(/,/g, ''),
      r.grupo3.replace(/,/g, ''),
      r.grupo4.replace(/,/g, ''),
      r.grupo5.replace(/,/g, ''),
      r.grupo6.replace(/,/g, ''),
      r.grupo7.replace(/,/g, ''),
      r.grupo8.replace(/,/g, ''),
      r.grupo9.replace(/,/g, ''),
      r.total.replace(/,/g, '')
    ]);

    const csvContent = "data:text/csv;charset=utf-8,\uFEFF" 
      + [headers.join(';'), ...rows.map(e => e.join(';'))].join('\n');
    
    const encodedUri = encodeURI(csvContent);
    const link = document.createElement("a");
    link.setAttribute("href", encodedUri);
    link.setAttribute("download", `POA_2026_${selectedMuni.toUpperCase()}.csv`);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  const handlePrint = () => {
    window.print();
  };

  return (
    <div className="excel-explorer-container">
      <style jsx>{`
        .excel-explorer-container {
          background: #ffffff;
          border: 1px solid #e2e8f0;
          border-radius: 16px;
          padding: 2rem;
          box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
          margin-top: 1.5rem;
          font-family: 'Inter', sans-serif;
        }

        .excel-header {
          display: flex;
          justify-content: space-between;
          align-items: flex-start;
          flex-wrap: wrap;
          gap: 1.5rem;
          margin-bottom: 2rem;
        }

        .excel-title-section h3 {
          font-size: 1.5rem;
          font-weight: 800;
          color: #9c0720;
          margin: 0;
          letter-spacing: -0.5px;
        }

        .excel-title-section p {
          font-size: 0.88rem;
          color: #64748b;
          margin: 0.35rem 0 0 0;
        }

        /* Metrics grid */
        .metrics-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
          gap: 1rem;
          margin-bottom: 2rem;
        }

        .metric-card {
          background: #f8fafc;
          border: 1px solid #e2e8f0;
          border-radius: 12px;
          padding: 1rem 1.25rem;
          display: flex;
          align-items: center;
          gap: 0.85rem;
        }

        .metric-icon-box {
          background: #ffefef;
          color: #9c0720;
          width: 40px;
          height: 40px;
          border-radius: 8px;
          display: flex;
          align-items: center;
          justify-content: center;
        }

        .metric-info h4 {
          font-size: 0.72rem;
          font-weight: 700;
          text-transform: uppercase;
          color: #64748b;
          margin: 0;
        }

        .metric-info p {
          font-size: 1.15rem;
          font-weight: 800;
          color: #1e293b;
          margin: 0.15rem 0 0 0;
        }

        /* Controls Section */
        .controls-row {
          display: flex;
          justify-content: space-between;
          align-items: center;
          gap: 1rem;
          margin-bottom: 1.5rem;
          flex-wrap: wrap;
        }

        .search-select-group {
          display: flex;
          gap: 0.75rem;
          flex-wrap: wrap;
          flex-grow: 1;
        }

        .muni-selector {
          padding: 0.65rem 1rem;
          border-radius: 8px;
          border: 1px solid #cbd5e1;
          font-weight: 700;
          color: #1e293b;
          background-color: #f8fafc;
          outline: none;
          cursor: pointer;
          min-width: 260px;
        }

        .muni-selector:focus {
          border-color: #9c0720;
        }

        .search-wrapper {
          position: relative;
          min-width: 240px;
          flex-grow: 1;
        }

        .search-input {
          width: 100%;
          padding: 0.65rem 1rem 0.65rem 2.5rem;
          border-radius: 8px;
          border: 1px solid #cbd5e1;
          font-size: 0.9rem;
          outline: none;
        }

        .search-input:focus {
          border-color: #9c0720;
        }

        .actions-group {
          display: flex;
          gap: 0.5rem;
        }

        .btn-action {
          padding: 0.65rem 1.15rem;
          border-radius: 8px;
          font-weight: 700;
          font-size: 0.88rem;
          cursor: pointer;
          border: 1px solid #cbd5e1;
          background: #ffffff;
          color: #475569;
          display: flex;
          align-items: center;
          gap: 0.4rem;
          transition: all 0.2s;
        }

        .btn-action:hover {
          background: #f8fafc;
          color: #1e293b;
        }

        .btn-primary-action {
          background: #9c0720;
          border-color: #9c0720;
          color: #ffffff;
        }

        .btn-primary-action:hover {
          background: #7a0518;
          color: #ffffff;
        }

        /* Checkbox filter */
        .filter-checkbox-label {
          display: flex;
          align-items: center;
          gap: 0.5rem;
          font-size: 0.85rem;
          font-weight: 600;
          color: #475569;
          cursor: pointer;
          user-select: none;
        }

        /* Table Spreadsheet Style */
        .table-scroll-container {
          width: 100%;
          overflow-x: auto;
          border: 1px solid #e2e8f0;
          border-radius: 12px;
          box-shadow: 0 2px 8px rgba(0,0,0,0.01);
        }

        .excel-table {
          width: 100%;
          border-collapse: collapse;
          font-size: 0.82rem;
          text-align: left;
        }

        .excel-table th {
          background: #f1f5f9;
          color: #475569;
          font-weight: 700;
          padding: 0.65rem 0.75rem;
          border: 1px solid #cbd5e1;
          font-size: 0.75rem;
          text-transform: uppercase;
          letter-spacing: 0.2px;
          white-space: nowrap;
        }

        .excel-table td {
          padding: 0.55rem 0.75rem;
          border: 1px solid #e2e8f0;
          color: #334155;
          white-space: nowrap;
        }

        .row-program {
          font-weight: 800 !important;
          background-color: #fffdf5 !important; /* Soft yellow highlighting */
        }

        .row-program td {
          color: #1e293b !important;
          border-top: 1.5px solid #cbd5e1 !important;
          border-bottom: 1.5px solid #cbd5e1 !important;
        }

        .text-right {
          text-align: right;
        }

        .text-center {
          text-align: center;
        }

        .col-prg { width: 50px; }
        .col-proj { width: 70px; }
        .col-desc { min-width: 280px; max-width: 400px; white-space: normal !important; }

        @media (max-width: 768px) {
          .excel-explorer-container {
            padding: 1rem;
          }
          .excel-header {
            margin-bottom: 1.25rem;
          }
          .controls-row {
            flex-direction: column;
            align-items: stretch;
          }
          .search-select-group {
            flex-direction: column;
          }
          .muni-selector {
            min-width: 100%;
          }
          .actions-group {
            width: 100%;
            display: grid;
            grid-template-columns: 1fr 1fr;
          }
          .btn-action {
            justify-content: center;
          }
        }
      `}</style>

      {/* Header */}
      <header className="excel-header">
        <div className="excel-title-section">
          <h3>Planilla de Presupuesto Institucional (Excel)</h3>
          <p>Explorador detallado por categoría programática y objeto de gasto de los municipios de Oruro para la Gestión 2026.</p>
        </div>
      </header>

      {/* Metrics Cards */}
      <section className="metrics-grid">
        <div className="metric-card">
          <div className="metric-icon-box">
            <Coins size={18} />
          </div>
          <div className="metric-info">
            <h4>Presupuesto Total</h4>
            <p>{formatBOB(metrics.totalBudget.toString())} BOB</p>
          </div>
        </div>
        <div className="metric-card">
          <div className="metric-card-bg" />
          <div className="metric-icon-box">
            <Layers size={18} />
          </div>
          <div className="metric-info">
            <h4>Programas Presupuestarios</h4>
            <p>{metrics.programsCount} Categorías</p>
          </div>
        </div>
        <div className="metric-card">
          <div className="metric-icon-box">
            <FileSpreadsheet size={18} />
          </div>
          <div className="metric-info">
            <h4>Proyectos / Actividades</h4>
            <p>{metrics.projectsCount} Registrados</p>
          </div>
        </div>
      </section>

      {/* Controls Bar */}
      <section className="controls-row">
        <div className="search-select-group">
          {/* Municipality Dropdown */}
          <select 
            className="muni-selector"
            value={selectedMuni}
            onChange={(e) => setSelectedMuni(e.target.value)}
          >
            {municipios.map(m => (
              <option key={m.id} value={m.id}>
                {m.nombre}
              </option>
            ))}
          </select>

          {/* Search Box */}
          <div className="search-wrapper">
            <Search size={16} color="#94a3b8" style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)' }} />
            <input 
              type="text" 
              className="search-input" 
              placeholder="Buscar por programa, proyecto o descripción..." 
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
            />
          </div>
        </div>

        {/* Action Buttons */}
        <div className="actions-group">
          <button className="btn-action btn-primary-action" onClick={exportToCSV}>
            <Download size={16} /> Exportar CSV
          </button>
          <button className="btn-action" onClick={handlePrint}>
            <Printer size={16} /> Imprimir
          </button>
        </div>
      </section>

      {/* Extra Filters */}
      <div style={{ marginBottom: '1.25rem', display: 'flex', gap: '1.5rem', alignItems: 'center' }}>
        <label className="filter-checkbox-label">
          <input 
            type="checkbox" 
            checked={onlyPrograms} 
            onChange={(e) => setOnlyPrograms(e.target.checked)} 
            style={{ width: '15px', height: '15px', accentColor: '#9c0720', cursor: 'pointer' }}
          />
          Ver solo Totales de Programas (Resaltados)
        </label>
        <span style={{ fontSize: '0.8rem', color: '#64748b', fontWeight: '500' }}>
          Mostrando <strong>{filteredRows.length}</strong> de {rawRows.length} filas
        </span>
      </div>

      {/* Spreadsheet grid */}
      <div className="table-scroll-container">
        <table className="excel-table">
          <thead>
            <tr>
              <th className="text-center col-prg">Prg.</th>
              <th className="text-center col-proj">Proyecto</th>
              <th className="col-desc">Descripción Categórica Programática</th>
              <th className="text-right">Grupo 1</th>
              <th className="text-right">Grupo 2</th>
              <th className="text-right">Grupo 3</th>
              <th className="text-right">Grupo 4</th>
              <th className="text-right">Grupo 5</th>
              <th className="text-right">Grupo 6</th>
              <th className="text-right">Grupo 7</th>
              <th className="text-right">Grupo 8</th>
              <th className="text-right">Grupo 9</th>
              <th className="text-right">Total POA</th>
            </tr>
          </thead>
          <tbody>
            {filteredRows.length === 0 ? (
              <tr>
                <td colSpan={13} style={{ textAlign: 'center', padding: '3rem', color: '#64748b', fontStyle: 'italic', background: '#f8fafc' }}>
                  No se encontraron resultados coincidentes con la búsqueda.
                </td>
              </tr>
            ) : (
              filteredRows.map((row, idx) => {
                const isProgram = row.proyecto === '0 000';
                return (
                  <tr key={idx} className={isProgram ? 'row-program' : ''}>
                    <td className="text-center">{row.prg}</td>
                    <td className="text-center">{row.proyecto}</td>
                    <td className="col-desc">{row.description}</td>
                    <td className="text-right">{formatBOB(row.grupo1)}</td>
                    <td className="text-right">{formatBOB(row.grupo2)}</td>
                    <td className="text-right">{formatBOB(row.grupo3)}</td>
                    <td className="text-right">{formatBOB(row.grupo4)}</td>
                    <td className="text-right">{formatBOB(row.grupo5)}</td>
                    <td className="text-right">{formatBOB(row.grupo6)}</td>
                    <td className="text-right">{formatBOB(row.grupo7)}</td>
                    <td className="text-right">{formatBOB(row.grupo8)}</td>
                    <td className="text-right">{formatBOB(row.grupo9)}</td>
                    <td className="text-right" style={{ color: isProgram ? '#9c0720' : '#1e293b' }}>
                      {formatBOB(row.total)}
                    </td>
                  </tr>
                );
              })
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}

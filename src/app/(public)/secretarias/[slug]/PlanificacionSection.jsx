'use client';

import { useState, useEffect, useMemo } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { FileText, Database, MapPin, ChevronDown, Building, Search, ArrowLeft, Download, Eye, X, PieChart } from 'lucide-react';
import styles from './SecretariaDetail.module.css'; // Reusing styles from the page
import { createClient } from '@/lib/supabase/client';
import BudgetDashboard from './BudgetDashboard';
const provinciasOruro = [
  { nombre: "Cercado", municipios: ["Oruro", "Caracollo", "El Choro", "Soracachi (Paria)"] },
  { nombre: "Abaroa", municipios: ["Challapata", "Quillacas"] },
  { nombre: "Carangas", municipios: ["Corque", "Choquecota"] },
  { nombre: "Pantaleón Dalence", municipios: ["Huanuni", "Machacamarca"] },
  { nombre: "Ladislao Cabrera", municipios: ["Salinas de Garci Mendoza", "Pampa Aullagas"] },
  { nombre: "Litoral", municipios: ["Huachacalla", "Esmeralda", "Cruz de Machacamarca", "Escara", "Yunguyo del Litoral"] },
  { nombre: "Mejillones", municipios: ["La Rivera", "Todos Santos", "Carangas"] },
  { nombre: "Nor Carangas", municipios: ["Huayllamarca"] },
  { nombre: "Poopó", municipios: ["Poopó", "Pazña", "Antequera"] },
  { nombre: "Sabaya", municipios: ["Sabaya", "Coipasa", "Chipaya"] },
  { nombre: "Sajama", municipios: ["Curahuara de Carangas", "Turco"] },
  { nombre: "San Pedro de Totora", municipios: ["Totora"] },
  { nombre: "Saucarí", municipios: ["Toledo"] },
  { nombre: "Sebastián Pagador", municipios: ["Santiago de Huari"] },
  { nombre: "Tomás Barrón", municipios: ["Eucaliptus"] }
];

export default function PlanificacionSection({ secretariaId }) {
  const [activeTab, setActiveTab] = useState('sistemas');
  const [openProvincia, setOpenProvincia] = useState(null);
  const [viewMode, setViewMode] = useState('dashboard'); // 'dashboard', 'cards', 'poa', 'sisin'
  const [mapTab, setMapTab] = useState('territorio');
  const [poaYear, setPoaYear] = useState('');
  const [searchQuery, setSearchQuery] = useState('');
  const [poaDocs, setPoaDocs] = useState([]);
  const [previewDoc, setPreviewDoc] = useState(null);
  const supabase = useMemo(() => createClient(), []);

  useEffect(() => {
    if (secretariaId) {
      async function fetchPoaDocs() {
        const { data, error } = await supabase
          .from('poa_documents')
          .select('*')
          .eq('secretaria_id', secretariaId)
          .order('created_at', { ascending: false });
        if (data) {
          setPoaDocs(data);
          // Set default year to the most recent one available
          const years = [...new Set(data.map(d => d.gestion))].sort((a, b) => b - a);
          if (years.length > 0) {
            setPoaYear(years[0].toString());
          } else {
            setPoaYear(new Date().getFullYear().toString());
          }
        }
      }
      fetchPoaDocs();
    }
  }, [secretariaId, supabase]);

  const availableYears = [...new Set(poaDocs.map(d => d.gestion))].sort((a, b) => b - a);
  if (availableYears.length === 0) availableYears.push(new Date().getFullYear());

  const filteredDocs = poaDocs.filter(doc => {
    const matchesYear = doc.gestion.toString() === poaYear;
    const matchesSearch = doc.nombre.toLowerCase().includes(searchQuery.toLowerCase());
    return matchesYear && matchesSearch;
  });

  return (
    <div style={{ marginTop: '0' }}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '1.5rem', flexWrap: 'wrap', gap: '1rem' }}>
        <h2 style={{ fontSize: 'clamp(1.5rem, 4vw, 2rem)', color: '#1a1a2e', fontWeight: '900', margin: 0 }}>
          Planificación Departamental
        </h2>
        <div style={{ display: 'flex', gap: '0.5rem' }}>
          <button
            onClick={() => setActiveTab(activeTab === 'sistemas' ? 'territorio' : 'sistemas')}
            style={{
              padding: '0.6rem 1.25rem',
              background: activeTab !== 'sistemas' ? '#9c0720' : '#f5f5f5',
              color: activeTab !== 'sistemas' ? '#fff' : '#444',
              border: 'none',
              borderRadius: '8px',
              fontWeight: 'bold',
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              gap: '0.5rem',
              transition: 'all 0.2s'
            }}
          >
            <MapPin size={18} /> {activeTab !== 'sistemas' ? 'Cerrar Mapas' : 'Ver Mapas y Territorio'}
          </button>
        </div>
      </div>

      {/* Tab Content */}
      <AnimatePresence mode="wait">
        {activeTab === 'sistemas' && (
          <motion.div
            key="sistemas"
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -10 }}
          >
            <div style={{ display: 'flex', gap: '1rem', marginBottom: '1.5rem' }}>
              <button
                onClick={() => setViewMode('dashboard')}
                style={{
                  background: viewMode === 'dashboard' ? '#9c0720' : '#f5f5f5',
                  color: viewMode === 'dashboard' ? '#fff' : '#444',
                  border: 'none', padding: '0.6rem 1.25rem', borderRadius: '8px', fontWeight: 'bold', cursor: 'pointer', transition: 'all 0.2s', display: 'flex', alignItems: 'center', gap: '0.5rem'
                }}
              >
                <PieChart size={18} /> Vista Interactiva
              </button>
              <button
                onClick={() => setViewMode('cards')}
                style={{
                  background: viewMode === 'cards' ? '#9c0720' : '#f5f5f5',
                  color: viewMode === 'cards' ? '#fff' : '#444',
                  border: 'none', padding: '0.6rem 1.25rem', borderRadius: '8px', fontWeight: 'bold', cursor: 'pointer', transition: 'all 0.2s', display: 'flex', alignItems: 'center', gap: '0.5rem'
                }}
              >
                <FileText size={18} /> Documentos (PDF)
              </button>
            </div>

            {viewMode === 'dashboard' && (
              <BudgetDashboard />
            )}

            {viewMode === 'cards' && (
              <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(300px, 1fr))', gap: '1.5rem' }}>
                {/* Card POA */}
                <div style={{ background: 'linear-gradient(135deg, #9c0720 0%, #7a0518 100%)', border: 'none', borderRadius: '12px', padding: '1.75rem', boxShadow: '0 8px 16px rgba(156, 7, 32, 0.2)', transition: 'transform 0.2s', color: '#fff', position: 'relative', overflow: 'hidden' }}>
                  {/* Decorative background element */}
                  <div style={{ position: 'absolute', right: '0', top: '0', height: '100%', width: '60%', opacity: 0.4, mixBlendMode: 'screen', WebkitMaskImage: 'linear-gradient(to left, rgba(0,0,0,1) 0%, rgba(0,0,0,0) 100%)', maskImage: 'linear-gradient(to left, rgba(0,0,0,1) 0%, rgba(0,0,0,0) 100%)' }}>
                    <img src="/icono-planificacion.jpg" alt="" style={{ width: '100%', height: '100%', objectFit: 'cover', objectPosition: 'center' }} />
                  </div>
                  
                  <div style={{ position: 'relative', zIndex: 1 }}>
                    <div style={{ background: 'rgba(255, 255, 255, 0.2)', width: '50px', height: '50px', borderRadius: '12px', display: 'flex', alignItems: 'center', justifyContent: 'center', color: '#fff', marginBottom: '1.25rem' }}>
                      <FileText size={24} />
                    </div>
                    <h3 style={{ fontSize: '1.35rem', fontWeight: 'bold', color: '#fff', marginBottom: '0.75rem' }}>Presupuesto Institucional por Municipio del Departamento de Oruro Gestión 2026</h3>
                    <p style={{ color: 'rgba(255, 255, 255, 0.9)', fontSize: '0.95rem', marginBottom: '1.75rem', lineHeight: '1.5' }}>
                      Acceda a los documentos e instrumentos de planificación anual del Gobierno Autónomo Departamental de Oruro.
                    </p>
                    <button 
                      onClick={() => setViewMode('poa')}
                      style={{ display: 'inline-flex', alignItems: 'center', gap: '0.5rem', background: '#fff', color: '#9c0720', padding: '0.75rem 1.5rem', borderRadius: '8px', fontWeight: 'bold', fontSize: '0.95rem', border: 'none', cursor: 'pointer', boxShadow: '0 4px 6px rgba(0,0,0,0.1)' }}
                    >
                      Acceder al POA
                    </button>
                  </div>
                </div>


              </div>
            )}

            {viewMode === 'poa' && (
              <motion.div
                initial={{ opacity: 0, x: 20 }}
                animate={{ opacity: 1, x: 0 }}
                style={{ background: '#fff', border: '1px solid #eaeaea', borderRadius: '12px', padding: '2rem', boxShadow: '0 4px 12px rgba(0,0,0,0.05)' }}
              >
                <div style={{ display: 'flex', alignItems: 'center', gap: '1rem', marginBottom: '2rem' }}>
                  <button 
                    onClick={() => setViewMode('cards')}
                    style={{ background: '#f5f5f5', border: 'none', width: '40px', height: '40px', borderRadius: '50%', display: 'flex', alignItems: 'center', justifyContent: 'center', cursor: 'pointer', color: '#444' }}
                  >
                    <ArrowLeft size={20} />
                  </button>
                  <h3 style={{ fontSize: '1.5rem', fontWeight: 'bold', color: '#1a1a2e', margin: 0 }}>Descarga de Documentos POA</h3>
                </div>

                <div style={{ display: 'flex', gap: '1rem', marginBottom: '2rem', flexWrap: 'wrap' }}>
                  <div style={{ flex: '1', minWidth: '250px', position: 'relative' }}>
                    <Search size={18} color="#888" style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)' }} />
                    <input 
                      type="text" 
                      placeholder="Buscar documento por nombre..." 
                      value={searchQuery}
                      onChange={(e) => setSearchQuery(e.target.value)}
                      style={{ width: '100%', padding: '0.75rem 1rem 0.75rem 2.5rem', borderRadius: '8px', border: '1px solid #ddd', fontSize: '1rem' }}
                    />
                  </div>
                  <select 
                    value={poaYear}
                    onChange={(e) => setPoaYear(e.target.value)}
                    style={{ padding: '0.75rem 1rem', borderRadius: '8px', border: '1px solid #ddd', fontSize: '1rem', fontWeight: '600', color: '#1a1a2e', background: '#f9f9f9', minWidth: '150px' }}
                  >
                    {availableYears.map(year => (
                      <option key={year} value={year}>Gestión {year}</option>
                    ))}
                  </select>
                </div>

                <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
                  {filteredDocs.length === 0 ? (
                    <p style={{ color: '#888', fontStyle: 'italic', textAlign: 'center', padding: '2rem' }}>No se encontraron documentos para esta gestión.</p>
                  ) : (
                    filteredDocs.map((doc) => (
                      <div key={doc.id} style={{ display: 'flex', flexWrap: 'wrap', gap: '1rem', alignItems: 'center', justifyContent: 'space-between', padding: '1.25rem 1.5rem', border: '1px solid #eaeaea', borderRadius: '12px', transition: 'all 0.2s', cursor: 'pointer', background: '#fff', boxShadow: '0 2px 4px rgba(0,0,0,0.02)' }} 
                        onMouseEnter={(e) => { e.currentTarget.style.boxShadow = '0 8px 16px rgba(156,7,32,0.08)'; e.currentTarget.style.borderColor = '#ffefef'; e.currentTarget.style.transform = 'translateY(-2px)' }} 
                        onMouseLeave={(e) => { e.currentTarget.style.boxShadow = '0 2px 4px rgba(0,0,0,0.02)'; e.currentTarget.style.borderColor = '#eaeaea'; e.currentTarget.style.transform = 'translateY(0)' }}
                      >
                        <div style={{ display: 'flex', alignItems: 'center', gap: '1.25rem', flex: '1 1 auto', minWidth: '250px' }}>
                          <div style={{ background: 'linear-gradient(135deg, #ffefef 0%, #ffe0e0 100%)', color: '#9c0720', padding: '1rem', borderRadius: '10px' }}>
                            <FileText size={26} />
                          </div>
                          <div>
                            <h4 style={{ margin: '0 0 0.35rem 0', fontSize: '1.15rem', color: '#1a1a2e', fontWeight: '700' }}>{doc.nombre}</h4>
                            <span style={{ fontSize: '0.85rem', color: '#666', display: 'flex', alignItems: 'center', gap: '0.5rem', flexWrap: 'wrap' }}>
                              <span style={{ background: '#f0f0f0', padding: '0.15rem 0.5rem', borderRadius: '4px', fontWeight: '600' }}>PDF</span>
                              • {doc.tamano_mb} MB • Publicado {new Date(doc.created_at).toLocaleDateString()}
                            </span>
                          </div>
                        </div>
                        <div style={{ display: 'flex', gap: '0.75rem', flexWrap: 'wrap' }}>
                          <button 
                            onClick={() => setPreviewDoc(doc)} 
                            style={{ background: '#f5f5f5', border: 'none', color: '#444', padding: '0.6rem 1rem', borderRadius: '8px', display: 'flex', alignItems: 'center', gap: '0.5rem', fontWeight: '600', cursor: 'pointer', transition: 'all 0.2s' }} 
                            onMouseEnter={(e) => { e.currentTarget.style.background = '#e0e0e0'; e.currentTarget.style.color = '#1a1a2e' }} 
                            onMouseLeave={(e) => { e.currentTarget.style.background = '#f5f5f5'; e.currentTarget.style.color = '#444' }}
                          >
                            <Eye size={18} /> Vista Previa
                          </button>
                          <a 
                            href={`${doc.archivo_url}?download=`} 
                            download 
                            target="_blank" 
                            rel="noreferrer" 
                            style={{ textDecoration: 'none', background: '#9c0720', border: '1px solid #9c0720', color: '#fff', padding: '0.6rem 1.25rem', borderRadius: '8px', display: 'flex', alignItems: 'center', gap: '0.5rem', fontWeight: '600', cursor: 'pointer', transition: 'all 0.2s', boxShadow: '0 4px 6px rgba(156,7,32,0.2)' }} 
                            onMouseEnter={(e) => { e.currentTarget.style.background = '#7a0518'; e.currentTarget.style.transform = 'translateY(-1px)' }} 
                            onMouseLeave={(e) => { e.currentTarget.style.background = '#9c0720'; e.currentTarget.style.transform = 'translateY(0)' }}
                          >
                            <Download size={18} /> Descargar
                          </a>
                        </div>
                      </div>
                    ))
                  )}
                </div>
              </motion.div>
            )}

            {/* Preview Modal */}
            <AnimatePresence>
              {previewDoc && (
                <motion.div
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  exit={{ opacity: 0 }}
                  style={{ position: 'fixed', top: 0, left: 0, width: '100vw', height: '100vh', background: 'rgba(0,0,0,0.85)', zIndex: 9999, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', padding: '2rem' }}
                >
                  <motion.div
                    initial={{ y: 50, opacity: 0, scale: 0.95 }}
                    animate={{ y: 0, opacity: 1, scale: 1 }}
                    exit={{ y: 20, opacity: 0, scale: 0.95 }}
                    style={{ width: '100%', maxWidth: '1000px', height: '100%', maxHeight: '90vh', background: '#fff', borderRadius: '16px', overflow: 'hidden', display: 'flex', flexDirection: 'column', boxShadow: '0 25px 50px -12px rgba(0,0,0,0.5)' }}
                  >
                    <div style={{ padding: '1.25rem 2rem', background: '#f8f9fa', borderBottom: '1px solid #eaeaea', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                      <div style={{ display: 'flex', alignItems: 'center', gap: '1rem' }}>
                        <div style={{ background: '#ffefef', color: '#9c0720', padding: '0.5rem', borderRadius: '8px' }}>
                          <FileText size={20} />
                        </div>
                        <h3 style={{ margin: 0, fontSize: '1.25rem', color: '#1a1a2e', fontWeight: '700' }}>{previewDoc.nombre}</h3>
                      </div>
                      <div style={{ display: 'flex', gap: '1rem', alignItems: 'center' }}>
                        <a href={`${previewDoc.archivo_url}?download=`} download target="_blank" rel="noreferrer" style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', textDecoration: 'none', color: '#9c0720', fontWeight: '600', fontSize: '0.9rem' }}>
                          <Download size={16} /> Descargar Archivo
                        </a>
                        <div style={{ width: '1px', height: '24px', background: '#ddd' }}></div>
                        <button onClick={() => setPreviewDoc(null)} style={{ background: 'transparent', border: 'none', cursor: 'pointer', color: '#666', display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '0.5rem', borderRadius: '50%', transition: 'all 0.2s' }} onMouseEnter={(e) => { e.currentTarget.style.background = '#eaeaea'; e.currentTarget.style.color = '#1a1a2e' }} onMouseLeave={(e) => { e.currentTarget.style.background = 'transparent'; e.currentTarget.style.color = '#666' }}>
                          <X size={24} />
                        </button>
                      </div>
                    </div>
                    <div style={{ flex: 1, position: 'relative', background: '#e0e0e0' }}>
                      <iframe src={`${previewDoc.archivo_url}#toolbar=0`} style={{ position: 'absolute', top: 0, left: 0, width: '100%', height: '100%', border: 'none' }} title={previewDoc.nombre} />
                    </div>
                  </motion.div>
                </motion.div>
              )}
            </AnimatePresence>
          </motion.div>
        )}

        {activeTab === 'territorio' && (
          <motion.div
            key="territorio"
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -10 }}
            style={{ marginTop: '2rem' }}
          >
            {/* Map Tabs */}
            <div style={{ display: 'flex', gap: '0.5rem', marginBottom: '2rem', borderBottom: '2px solid #eee', flexWrap: 'wrap' }}>
              <button
                onClick={() => setMapTab('territorio')}
                style={{
                  padding: '0.5rem 1rem',
                  background: 'transparent',
                  border: 'none',
                  borderBottom: mapTab === 'territorio' ? '3px solid #9c0720' : '3px solid transparent',
                  color: mapTab === 'territorio' ? '#9c0720' : '#666',
                  fontWeight: 'bold',
                  fontSize: '1rem',
                  cursor: 'pointer',
                  display: 'flex',
                  alignItems: 'center',
                  gap: '0.4rem',
                  transition: 'all 0.2s'
                }}
              >
                <MapPin size={18} /> División Territorial
              </button>
              <button
                onClick={() => setMapTab('electoral')}
                style={{
                  padding: '0.5rem 1rem',
                  background: 'transparent',
                  border: 'none',
                  borderBottom: mapTab === 'electoral' ? '3px solid #9c0720' : '3px solid transparent',
                  color: mapTab === 'electoral' ? '#9c0720' : '#666',
                  fontWeight: 'bold',
                  fontSize: '1rem',
                  cursor: 'pointer',
                  display: 'flex',
                  alignItems: 'center',
                  gap: '0.4rem',
                  transition: 'all 0.2s'
                }}
              >
                <Database size={18} /> Geografía Electoral
              </button>
            </div>

            {mapTab === 'territorio' && (
              <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }}>
                <p style={{ color: '#4a4848', marginBottom: '1.5rem', lineHeight: '1.6', fontSize: '1rem' }}>
                  El departamento de Oruro (Bolivia) se divide administrativamente en <strong>16 provincias</strong> y <strong>35 municipios</strong>. La capital departamental es la ciudad de Oruro.
                </p>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem' }}>
                  {provinciasOruro.map((prov, index) => (
                    <div key={index} style={{ border: '1px solid #eaeaea', borderRadius: '8px', overflow: 'hidden', background: '#fff' }}>
                      <button
                        onClick={() => setOpenProvincia(openProvincia === index ? null : index)}
                        style={{
                          width: '100%', padding: '1rem 1.5rem', background: openProvincia === index ? 'rgba(156, 7, 32, 0.03)' : '#fff',
                          border: 'none', display: 'flex', alignItems: 'center', justifyContent: 'space-between', cursor: 'pointer',
                          fontWeight: 'bold', color: openProvincia === index ? '#9c0720' : '#1a1a2e', fontSize: '1rem'
                        }}
                      >
                        <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                          <MapPin size={18} color={openProvincia === index ? '#9c0720' : '#888'} /> Provincia {prov.nombre}
                        </div>
                        <ChevronDown size={20} style={{ transform: openProvincia === index ? 'rotate(180deg)' : 'rotate(0deg)', transition: 'transform 0.3s' }} />
                      </button>
                      <AnimatePresence>
                        {openProvincia === index && (
                          <motion.div initial={{ height: 0, opacity: 0 }} animate={{ height: 'auto', opacity: 1 }} exit={{ height: 0, opacity: 0 }} style={{ overflow: 'hidden' }}>
                            <div style={{ padding: '0 1.5rem 1rem 3.5rem' }}>
                              <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(200px, 1fr))', gap: '0.75rem' }}>
                                {prov.municipios.map((mun, i) => (
                                  <div key={i} style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', color: '#4a4848', fontSize: '0.9rem' }}>
                                    <Building size={14} color="#ccc" /> {mun}
                                  </div>
                                ))}
                              </div>
                            </div>
                          </motion.div>
                        )}
                      </AnimatePresence>
                    </div>
                  ))}
                </div>
              </motion.div>
            )}

            {mapTab === 'electoral' && (
              <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }}>
                <div style={{ background: '#fff', borderRadius: '16px', border: '1px solid #eaeaea', padding: '2rem', boxShadow: '0 10px 40px rgba(0,0,0,0.04)' }}>
                  <h3 style={{ fontSize: '1.4rem', color: '#1a1a2e', fontWeight: '800', marginBottom: '1.5rem', display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                    <MapPin color="#9c0720" /> Circunscripciones Uninominales del Departamento de Oruro
                  </h3>
                  <p style={{ color: '#555', marginBottom: '2rem', lineHeight: '1.6' }}>
                    A continuación puede visualizar o descargar el mapa oficial del Órgano Electoral Plurinacional con la distribución de las circunscripciones uninominales y los municipios correspondientes al departamento de Oruro.
                  </p>
                  
                  <div style={{ width: '100%', height: '75vh', minHeight: '600px', borderRadius: '12px', overflow: 'hidden', border: '1px solid #ddd', background: '#f5f5f5' }}>
                    <iframe 
                      src="/documents/Circunscripciones_Uninominales_Oruro.pdf#zoom=FitH" 
                      width="100%" height="100%" style={{ border: 'none' }} title="Mapa de Circunscripciones de Oruro"
                    />
                  </div>

                  <div style={{ marginTop: '2rem', textAlign: 'center' }}>
                    <a 
                      href="/documents/Circunscripciones_Uninominales_Oruro.pdf" download 
                      style={{ display: 'inline-flex', alignItems: 'center', gap: '0.5rem', background: '#9c0720', color: '#fff', padding: '0.75rem 2rem', borderRadius: '8px', fontWeight: 'bold', textDecoration: 'none', transition: 'background 0.2s', boxShadow: '0 4px 6px rgba(156,7,32,0.2)' }}
                      onMouseEnter={(e) => { e.currentTarget.style.background = '#7a0518'; e.currentTarget.style.transform = 'translateY(-2px)' }} 
                      onMouseLeave={(e) => { e.currentTarget.style.background = '#9c0720'; e.currentTarget.style.transform = 'translateY(0)' }}
                    >
                      <Download size={18} /> Descargar PDF Completo
                    </a>
                  </div>
                </div>
              </motion.div>
            )}
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}

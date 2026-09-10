'use client';
import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import { uploadFile } from '@/lib/supabase/storage';
import FileUpload from '@/components/admin/FileUpload/FileUpload';
import styles from './InstitucionDocumentos.module.css';
import { Plus, Trash2, FileText, Search } from 'lucide-react';

// Categorías del repositorio de documentos institucionales.
// Las marcadas "RM 067/2025" corresponden a contenidos mínimos exigidos por la
// Resolución Ministerial N° 067/2025 (Lineamientos de Contenidos Mínimos).
const CATEGORIAS = [
  { id: 'informacion-financiera', label: 'Información Financiera' },
  { id: 'recursos-humanos', label: 'Recursos Humanos' },
  { id: 'desarrollo-organizacional', label: 'Desarrollo Organizacional' },
  { id: 'contrataciones', label: 'Contrataciones' },
  { id: 'licitacion-publica', label: 'Licitación Pública' },
  // ── Marco Normativo (RM 067/2025) ──
  { id: 'marco-normativo', label: 'Marco Normativo (general)' },
  { id: 'normativa-nacional', label: 'Normativa Nacional' },
  { id: 'normativa-internacional', label: 'Normativa Internacional' },
  { id: 'reglamentos-vigentes', label: 'Reglamentos Vigentes' },
  // ── Plan Estratégico y POA (RM 067/2025) ──
  { id: 'plan-estrategico', label: 'Plan Estratégico Institucional' },
  { id: 'poa-documento', label: 'Programación Operativa Anual (POA)' },
  { id: 'seguimiento-poa', label: 'Seguimiento y Evaluación al POA' },
  { id: 'flujos-procesos', label: 'Flujos de Procesos' },
  // ── Información Financiera detallada (RM 067/2025) ──
  { id: 'presupuesto', label: 'Presupuesto Institucional' },
  { id: 'ejecucion-presupuestaria', label: 'Ejecución Presupuestaria' },
  { id: 'fuentes-financiamiento', label: 'Fuentes de Financiamiento' },
  // ── Recursos Humanos detallado (RM 067/2025) ──
  { id: 'mof', label: 'Manual de Organización de Funciones (MOF)' },
  { id: 'mpp', label: 'Manual de Procesos y Procedimientos (MPP)' },
  { id: 'poai', label: 'Plan Operativo Anual Individual (POAI)' },
  { id: 'escala-salarial', label: 'Escala Salarial' },
  { id: 'nomina-servidores', label: 'Nómina de Servidores Públicos' },
];

export default function InstitucionDocumentosAdmin() {
  const [documentos, setDocumentos] = useState([]);
  const [loading, setLoading] = useState(true);
  const [filtroCategoria, setFiltroCategoria] = useState('todas');
  
  // Modal state
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [archivoFile, setArchivoFile] = useState(null);
  const [formData, setFormData] = useState({
    titulo: '',
    descripcion: '',
    categoria: 'informacion-financiera',
  });

  const supabase = createClient();

  useEffect(() => {
    fetchDocumentos();
  }, []);

  const fetchDocumentos = async () => {
    setLoading(true);
    const { data, error } = await supabase
      .from('institucion_documentos')
      .select('*')
      .eq('activo', true)
      .order('creado_en', { ascending: false });
      
    if (data && !error) {
      setDocumentos(data);
    }
    setLoading(false);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!formData.titulo || !archivoFile) {
      alert('El título y el archivo PDF son obligatorios.');
      return;
    }

    setIsSubmitting(true);

    try {
      const { data: userData } = await supabase.auth.getUser();

      // Subir el PDF al bucket documentos-pdf y obtener su URL pública
      const archivo_url = await uploadFile(archivoFile, 'documentos');

      const { error } = await supabase
        .from('institucion_documentos')
        .insert([
          {
            titulo: formData.titulo,
            descripcion: formData.descripcion,
            categoria: formData.categoria,
            archivo_url,
            creado_por: userData?.user?.id
          }
        ]);

      if (error) throw error;

      setIsModalOpen(false);
      setFormData({ titulo: '', descripcion: '', categoria: 'informacion-financiera' });
      setArchivoFile(null);
      fetchDocumentos();
    } catch (err) {
      alert('Error al guardar documento: ' + (err.message || err));
    } finally {
      setIsSubmitting(false);
    }
  };

  const handleDelete = async (id) => {
    if (confirm('¿Estás seguro de que deseas eliminar este documento?')) {
      const { error } = await supabase
        .from('institucion_documentos')
        .update({ activo: false })
        .eq('id', id);
        
      if (!error) {
        fetchDocumentos();
      }
    }
  };

  const docsFiltrados = filtroCategoria === 'todas' 
    ? documentos 
    : documentos.filter(d => d.categoria === filtroCategoria);

  return (
    <>
      <div className={styles.container}>
        <div className={styles.header}>
          <div>
            <h1 className={styles.title}>Documentos de Institución</h1>
            <p className={styles.subtitle}>Sube y gestiona PDFs para las secciones de Recursos Humanos, Finanzas, etc.</p>
          </div>
          <button className={styles.btnPrimary} onClick={() => setIsModalOpen(true)}>
            <Plus size={20} />
            Nuevo Documento
          </button>
        </div>

        <div className={styles.filters}>
          <div className={styles.searchBox}>
            <Search size={18} />
            <select 
              value={filtroCategoria} 
              onChange={(e) => setFiltroCategoria(e.target.value)}
              className={styles.selectFilter}
            >
              <option value="todas">Todas las categorías</option>
              {CATEGORIAS.map(cat => (
                <option key={cat.id} value={cat.id}>{cat.label}</option>
              ))}
            </select>
          </div>
        </div>

        {loading ? (
          <div className={styles.loading}>Cargando documentos...</div>
        ) : docsFiltrados.length === 0 ? (
          <div className={styles.emptyState}>No hay documentos subidos en esta categoría.</div>
        ) : (
          <div className={styles.tableContainer}>
            <table className={styles.table}>
              <thead>
                <tr>
                  <th>Título</th>
                  <th>Categoría</th>
                  <th>Fecha</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
                {docsFiltrados.map(doc => (
                  <tr key={doc.id}>
                    <td>
                      <div className={styles.docTitleCell}>
                        <FileText size={18} />
                        {doc.titulo}
                      </div>
                    </td>
                    <td>
                      <span className={styles.badge}>
                        {CATEGORIAS.find(c => c.id === doc.categoria)?.label || doc.categoria}
                      </span>
                    </td>
                    <td>{new Date(doc.creado_en).toLocaleDateString('es-BO')}</td>
                    <td>
                      <div className={styles.actions}>
                        <a href={doc.archivo_url} target="_blank" rel="noopener noreferrer" className={styles.btnIcon}>
                          Ver
                        </a>
                        <button onClick={() => handleDelete(doc.id)} className={styles.btnIconDanger}>
                          <Trash2 size={16} />
                        </button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>

      {isModalOpen && (
        <div className={styles.modalOverlay}>
          <div className={styles.modal}>
            <div className={styles.modalHeader}>
              <h2>Subir Nuevo Documento</h2>
              <button className={styles.closeBtn} onClick={() => setIsModalOpen(false)}>✕</button>
            </div>
            <form onSubmit={handleSubmit} className={styles.modalBody}>
              
              <div className={styles.formGroup}>
                <label>Categoría</label>
                <select 
                  value={formData.categoria}
                  onChange={e => setFormData({...formData, categoria: e.target.value})}
                  required
                >
                  {CATEGORIAS.map(cat => (
                    <option key={cat.id} value={cat.id}>{cat.label}</option>
                  ))}
                </select>
              </div>

              <div className={styles.formGroup}>
                <label>Título del Documento</label>
                <input 
                  type="text" 
                  value={formData.titulo}
                  onChange={e => setFormData({...formData, titulo: e.target.value})}
                  placeholder="Ej: Informe Financiero Anual 2026"
                  required
                />
              </div>

              <div className={styles.formGroup}>
                <label>Descripción (Opcional)</label>
                <textarea 
                  value={formData.descripcion}
                  onChange={e => setFormData({...formData, descripcion: e.target.value})}
                  rows="3"
                  placeholder="Breve descripción del archivo..."
                />
              </div>

              <div className={styles.formGroup}>
                <label>Archivo PDF</label>
                <FileUpload
                  onFileSelect={setArchivoFile}
                  accept="application/pdf"
                  label="Seleccionar PDF"
                  icon="📄"
                  maxSizeMB={10}
                />
                {archivoFile && (
                  <p className={styles.uploadSuccess}>✓ {archivoFile.name}</p>
                )}
              </div>

              <div className={styles.modalFooter}>
                <button type="button" className={styles.btnSecondary} onClick={() => setIsModalOpen(false)}>
                  Cancelar
                </button>
                <button type="submit" className={styles.btnPrimary} disabled={isSubmitting || !archivoFile}>
                  {isSubmitting ? 'Guardando...' : 'Guardar Documento'}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}
    </>
  );
}

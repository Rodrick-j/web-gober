'use client';
import { useState, useEffect } from 'react';
import { createClient } from '@/lib/supabase/client';
import FileUpload from '@/components/admin/FileUpload/FileUpload';
import styles from './InstitucionDocumentos.module.css';
import { Plus, Trash2, FileText, Search } from 'lucide-react';

const CATEGORIAS = [
  { id: 'informacion-financiera', label: 'Información Financiera' },
  { id: 'recursos-humanos', label: 'Recursos Humanos' },
  { id: 'desarrollo-organizacional', label: 'Desarrollo Organizacional' },
  { id: 'contrataciones', label: 'Contrataciones' },
  { id: 'licitacion-publica', label: 'Licitación Pública' },
];

export default function InstitucionDocumentosAdmin() {
  const [documentos, setDocumentos] = useState([]);
  const [loading, setLoading] = useState(true);
  const [filtroCategoria, setFiltroCategoria] = useState('todas');
  
  // Modal state
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [formData, setFormData] = useState({
    titulo: '',
    descripcion: '',
    categoria: 'informacion-financiera',
    archivo_url: ''
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

  const handleFileUpload = (url) => {
    setFormData({ ...formData, archivo_url: url });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!formData.titulo || !formData.archivo_url) {
      alert('El título y el archivo PDF son obligatorios.');
      return;
    }
    
    setIsSubmitting(true);
    
    const { data: userData } = await supabase.auth.getUser();
    
    const { error } = await supabase
      .from('institucion_documentos')
      .insert([
        {
          titulo: formData.titulo,
          descripcion: formData.descripcion,
          categoria: formData.categoria,
          archivo_url: formData.archivo_url,
          creado_por: userData?.user?.id
        }
      ]);
      
    if (error) {
      alert('Error al guardar documento: ' + error.message);
    } else {
      setIsModalOpen(false);
      setFormData({ titulo: '', descripcion: '', categoria: 'informacion-financiera', archivo_url: '' });
      fetchDocumentos();
    }
    setIsSubmitting(false);
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
                  bucket="institucion_pdfs"
                  onUploadComplete={handleFileUpload}
                  accept="application/pdf"
                />
                {formData.archivo_url && (
                  <p className={styles.uploadSuccess}>✓ Archivo cargado correctamente</p>
                )}
              </div>

              <div className={styles.modalFooter}>
                <button type="button" className={styles.btnSecondary} onClick={() => setIsModalOpen(false)}>
                  Cancelar
                </button>
                <button type="submit" className={styles.btnPrimary} disabled={isSubmitting || !formData.archivo_url}>
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

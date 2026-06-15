'use client';
import { useMemo } from 'react';
import dynamic from 'next/dynamic';
import 'react-quill-new/dist/quill.snow.css'; // Estilos base del editor
import styles from './RichTextEditor.module.css';

// React Quill no soporta SSR (Server Side Rendering), así que lo cargamos dinámicamente
const ReactQuill = dynamic(() => import('react-quill-new'), { ssr: false, loading: () => <div className={styles.loading}>Cargando editor...</div> });

export default function RichTextEditor({ value, onChange, placeholder = 'Escribe aquí...' }) {
  // Configuración de la barra de herramientas (colores, negrita, listas, etc.)
  const modules = useMemo(() => ({
    toolbar: [
      [{ 'header': [1, 2, 3, false] }],
      ['bold', 'italic', 'underline', 'strike'],        // Estilos de texto
      [{ 'color': [] }, { 'background': [] }],          // Colores
      [{ 'list': 'ordered'}, { 'list': 'bullet' }],     // Listas
      [{ 'align': [] }],                                // Alineación
      ['link', 'clean']                                 // Enlaces y limpiar formato
    ]
  }), []);

  return (
    <div className={styles.editorContainer}>
      <ReactQuill 
        theme="snow"
        value={value}
        onChange={onChange}
        modules={modules}
        placeholder={placeholder}
        className={styles.quillEditor}
      />
    </div>
  );
}

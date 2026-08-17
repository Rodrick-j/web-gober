'use client';
import { useState } from 'react';

const LIMIT = 80;

export default function TituloCell({ titulo }) {
  const [expanded, setExpanded] = useState(false);
  const isLong = titulo && titulo.length > LIMIT;

  return (
    <div style={{ maxWidth: '280px' }}>
      <span style={{ fontSize: '0.85rem', lineHeight: '1.5' }}>
        {isLong && !expanded ? titulo.slice(0, LIMIT) + '...' : titulo}
      </span>
      {isLong && (
        <button
          onClick={() => setExpanded(p => !p)}
          style={{
            display: 'block',
            background: 'none',
            border: 'none',
            cursor: 'pointer',
            color: 'var(--color-primary)',
            fontSize: '0.72rem',
            fontWeight: 600,
            padding: '2px 0 0',
            textDecoration: 'underline',
          }}
        >
          {expanded ? 'Ver menos' : 'Ver mas...'}
        </button>
      )}
    </div>
  );
}

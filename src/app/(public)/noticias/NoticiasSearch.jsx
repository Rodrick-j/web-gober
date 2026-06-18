'use client';
import { useState } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import styles from './noticias.module.css';

export default function NoticiasSearch({ initialQuery = '' }) {
  const router = useRouter();
  const searchParams = useSearchParams();
  const [query, setQuery] = useState(initialQuery);

  const handleSearch = (e) => {
    e.preventDefault();
    const params = new URLSearchParams(searchParams);
    if (query) {
      params.set('q', query);
    } else {
      params.delete('q');
    }
    router.push(`/noticias?${params.toString()}`);
  };

  return (
    <form onSubmit={handleSearch} className={styles.searchForm}>
      <input
        type="text"
        placeholder="Buscar noticias..."
        value={query}
        onChange={(e) => setQuery(e.target.value)}
        className={styles.searchInput}
      />
      <button type="submit" className={styles.searchButton} aria-label="Buscar">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
          <circle cx="11" cy="11" r="8"></circle>
          <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
        </svg>
      </button>
    </form>
  );
}

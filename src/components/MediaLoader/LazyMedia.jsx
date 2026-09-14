'use client';

import { useEffect, useRef, useState } from 'react';
import MediaLoader from './MediaLoader';

function useNearViewport(eager, rootMargin) {
  const targetRef = useRef(null);
  const [nearViewport, setNearViewport] = useState(eager);

  useEffect(() => {
    if (eager || nearViewport) return undefined;
    const target = targetRef.current;
    if (!target || !('IntersectionObserver' in window)) {
      setNearViewport(true);
      return undefined;
    }

    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setNearViewport(true);
          observer.disconnect();
        }
      },
      { rootMargin }
    );

    observer.observe(target);
    return () => observer.disconnect();
  }, [eager, nearViewport, rootMargin]);

  return [targetRef, nearViewport];
}

export function LazyEmbed({
  src,
  title,
  eager = false,
  rootMargin = '240px',
  loaderLabel,
  onLoad,
  ...iframeProps
}) {
  const [frameRef, shouldLoad] = useNearViewport(eager, rootMargin);
  const [loadedSource, setLoadedSource] = useState(null);

  return (
    <>
      <MediaLoader active={loadedSource !== src} kind="embed" label={loaderLabel} />
      <iframe
        {...iframeProps}
        ref={frameRef}
        src={shouldLoad ? src : undefined}
        title={title}
        loading="lazy"
        onLoad={(event) => {
          if (!shouldLoad) return;
          setLoadedSource(src);
          onLoad?.(event);
        }}
      />
    </>
  );
}

export function LazyVideo({
  src,
  eager = false,
  rootMargin = '240px',
  loaderLabel,
  onCanPlay,
  onError,
  ...videoProps
}) {
  const [videoRef, shouldLoad] = useNearViewport(eager, rootMargin);
  const [loadedSource, setLoadedSource] = useState(null);

  return (
    <>
      <MediaLoader active={loadedSource !== src} kind="video" label={loaderLabel} />
      <video
        {...videoProps}
        ref={videoRef}
        src={shouldLoad ? src : undefined}
        preload={shouldLoad ? 'metadata' : 'none'}
        onCanPlay={(event) => {
          setLoadedSource(src);
          onCanPlay?.(event);
        }}
        onError={(event) => {
          setLoadedSource(src);
          onError?.(event);
        }}
      />
    </>
  );
}

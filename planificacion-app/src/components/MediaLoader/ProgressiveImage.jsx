'use client';

import { useState } from 'react';
import Image from 'next/image';
import MediaLoader from './MediaLoader';

export default function ProgressiveImage({
  src,
  alt,
  loaderLabel,
  loaderClassName,
  showLoaderLabel = true,
  onLoad,
  onError,
  ...imageProps
}) {
  const [loadedSource, setLoadedSource] = useState(null);

  return (
    <>
      <MediaLoader
        active={loadedSource !== src}
        kind="image"
        label={loaderLabel}
        className={loaderClassName}
        showLabel={showLoaderLabel}
      />
      <Image
        {...imageProps}
        src={src}
        alt={alt}
        onLoad={(event) => {
          setLoadedSource(src);
          onLoad?.(event);
        }}
        onError={(event) => {
          setLoadedSource(src);
          onError?.(event);
        }}
      />
    </>
  );
}

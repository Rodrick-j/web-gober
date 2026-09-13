import styles from './ArticleSocialEmbeds.module.css';

const NETWORK_HOSTS = {
  facebook: ['facebook.com', 'fb.watch'],
  tiktok: ['tiktok.com'],
};

function decodeMarkupValue(value) {
  return value
    .replaceAll('&amp;', '&')
    .replaceAll('&quot;', '"')
    .replaceAll('&#39;', "'")
    .trim();
}

function isAllowedHost(hostname, network) {
  return NETWORK_HOSTS[network].some(
    (host) => hostname === host || hostname.endsWith(`.${host}`),
  );
}

function normalizeNetworkUrl(candidate, network) {
  if (!candidate) return null;

  try {
    const url = new URL(decodeMarkupValue(candidate));

    if (
      network === 'facebook' &&
      isAllowedHost(url.hostname, network) &&
      url.pathname.startsWith('/plugins/')
    ) {
      return normalizeNetworkUrl(url.searchParams.get('href'), network);
    }

    if (!['http:', 'https:'].includes(url.protocol)) return null;
    if (!isAllowedHost(url.hostname, network)) return null;

    return url.toString();
  } catch {
    return null;
  }
}

function extractNetworkUrl(value, network) {
  if (!value || typeof value !== 'string') return null;

  const decodedValue = decodeMarkupValue(value);
  const candidates = [decodedValue];
  const attributePattern = /(?:cite|data-href|href|src)\s*=\s*["']([^"']+)["']/gi;
  const urlPattern = /https?:\/\/[^\s"'<>]+/gi;

  for (const match of decodedValue.matchAll(attributePattern)) {
    candidates.push(match[1]);
  }

  for (const match of decodedValue.matchAll(urlPattern)) {
    candidates.push(match[0]);
  }

  for (const candidate of candidates) {
    const normalized = normalizeNetworkUrl(candidate, network);
    if (normalized) return normalized;
  }

  return null;
}

function extractTikTokVideoId(...values) {
  for (const value of values) {
    if (!value || typeof value !== 'string') continue;

    const videoId = value.match(/(?:data-video-id\s*=\s*["']|\/video\/)(\d+)/i)?.[1];
    if (videoId) return videoId;
  }

  return null;
}

function FacebookIcon() {
  return (
    <svg aria-hidden="true" viewBox="0 0 24 24" fill="currentColor">
      <path d="M24 12.07C24 5.4 18.63 0 12 0S0 5.4 0 12.07c0 6.03 4.39 11.03 10.13 11.93v-8.42H7.08v-3.51h3.05V9.4c0-3.03 1.79-4.7 4.53-4.7 1.31 0 2.69.24 2.69.24v2.97h-1.52c-1.49 0-1.96.93-1.96 1.88v2.28h3.33l-.53 3.51h-2.8V24C19.61 23.1 24 18.1 24 12.07Z" />
    </svg>
  );
}

function TikTokIcon() {
  return (
    <svg aria-hidden="true" viewBox="0 0 24 24" fill="currentColor">
      <path d="M12.53.02c1.31-.02 2.61-.01 3.91-.04.08 1.53.63 3.09 1.75 4.17 1.12 1.11 2.7 1.62 4.24 1.79v4.03a10.72 10.72 0 0 1-5.82-1.9c-.01 2.92.01 5.84-.02 8.75a7.19 7.19 0 0 1-7.26 7.15 7.16 7.16 0 0 1-7.74-6.23 7.15 7.15 0 0 1 8.73-6.68c.02 1.48-.04 2.96-.04 4.44-.99-.32-2.15-.23-3.02.37a3.41 3.41 0 0 0-1.5 3.36c.24 1.64 1.82 3.02 3.5 2.87a3.51 3.51 0 0 0 3.18-3.28c.1-1.79.06-3.57.07-5.36.01-4.03-.01-8.05.02-12.07Z" />
    </svg>
  );
}

function ArrowIcon() {
  return (
    <svg aria-hidden="true" viewBox="0 0 20 20" fill="none">
      <path d="M4.17 10h11.66M11.67 5.83 15.83 10l-4.16 4.17" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round" />
    </svg>
  );
}

function NetworkCard({ network, name, url, children }) {
  const isFacebook = network === 'facebook';

  return (
    <article className={`${styles.networkCard} ${styles[network]}`}>
      <div className={styles.cardHeader}>
        <span className={styles.networkIcon}>
          {isFacebook ? <FacebookIcon /> : <TikTokIcon />}
        </span>
        <div>
          <h3>{name}</h3>
          <span>Publicación oficial</span>
        </div>
      </div>

      <div className={styles.embedViewport}>{children}</div>

      {url && (
        <a
          className={styles.networkLink}
          href={url}
          target="_blank"
          rel="noopener noreferrer"
          aria-label={`Abrir la publicación original en ${name}`}
        >
          Ver publicación en {name}
          <ArrowIcon />
        </a>
      )}
    </article>
  );
}

export default function ArticleSocialEmbeds({
  facebookCode,
  facebookUrl,
  tiktokCode,
  tiktokUrl,
}) {
  const resolvedFacebookUrl =
    extractNetworkUrl(facebookCode, 'facebook') || extractNetworkUrl(facebookUrl, 'facebook');
  const resolvedTikTokUrl =
    extractNetworkUrl(tiktokCode, 'tiktok') || extractNetworkUrl(tiktokUrl, 'tiktok');
  const tiktokVideoId = extractTikTokVideoId(tiktokCode, resolvedTikTokUrl, tiktokUrl);

  if (!resolvedFacebookUrl && !tiktokVideoId && !resolvedTikTokUrl) return null;

  const facebookPlugin = /\/(?:videos?|watch|reels?)\//i.test(resolvedFacebookUrl || '')
    ? 'video.php'
    : 'post.php';
  const facebookEmbedUrl = resolvedFacebookUrl
    ? `https://www.facebook.com/plugins/${facebookPlugin}?href=${encodeURIComponent(resolvedFacebookUrl)}&show_text=true&width=360`
    : null;
  const tiktokEmbedUrl = tiktokVideoId
    ? `https://www.tiktok.com/player/v1/${tiktokVideoId}?controls=1&music_info=1&description=1&autoplay=0`
    : null;

  return (
    <section className={styles.socialSection} aria-labelledby="social-publications-title">
      <div className={styles.sectionHeading}>
        <span className={styles.eyebrow}>Conecta con la Gobernación</span>
        <h2 id="social-publications-title">Publicaciones en redes sociales</h2>
        <p>Consulta el contenido oficial relacionado con esta noticia.</p>
      </div>

      <div className={styles.socialGrid}>
        {facebookEmbedUrl && (
          <NetworkCard
            network="facebook"
            name="Facebook"
            url={resolvedFacebookUrl}
          >
            <iframe
              className={styles.facebookFrame}
              src={facebookEmbedUrl}
              title="Publicación oficial en Facebook"
              width="360"
              height="620"
              loading="lazy"
              allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"
              allowFullScreen
            />
          </NetworkCard>
        )}

        {(tiktokEmbedUrl || resolvedTikTokUrl) && (
          <NetworkCard
            network="tiktok"
            name="TikTok"
            url={resolvedTikTokUrl}
          >
            {tiktokEmbedUrl ? (
              <div className={styles.tiktokFrameShell}>
                <iframe
                  className={styles.tiktokFrame}
                  src={tiktokEmbedUrl}
                  title="Publicación oficial en TikTok"
                  loading="lazy"
                  allow="fullscreen; autoplay; encrypted-media; picture-in-picture"
                  allowFullScreen
                />
              </div>
            ) : (
              <div className={styles.embedFallback}>
                <TikTokIcon />
                <p>Esta publicación se abre directamente en TikTok.</p>
              </div>
            )}
          </NetworkCard>
        )}
      </div>
    </section>
  );
}

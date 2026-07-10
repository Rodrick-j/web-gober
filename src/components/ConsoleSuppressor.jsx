'use client';

if (typeof window !== 'undefined' && !window.__consoleSuppressed) {
  window.__consoleSuppressed = true;
  
  var originalConsoleError = console.error;
  console.error = function() {
    if (
      arguments[0] &&
      typeof arguments[0] === 'string' &&
      (arguments[0].includes('ErrorUtils caught an error') || arguments[0].includes('TikTok'))
    ) {
      return;
    }
    originalConsoleError.apply(console, arguments);
  };
  
  var originalConsoleLog = console.log;
  console.log = function() {
    if (
      arguments[0] &&
      typeof arguments[0] === 'string' &&
      arguments[0].includes('[TikTok]')
    ) {
      return;
    }
    originalConsoleLog.apply(console, arguments);
  };
}

export default function ConsoleSuppressor() {
  return null;
}

import sanitizeHtml from 'sanitize-html';

export function sanitizeRichText(value) {
  return sanitizeHtml(typeof value === 'string' ? value : '', {
    allowedTags: [
      'p', 'br', 'div', 'span',
      'h1', 'h2', 'h3', 'h4', 'h5', 'h6',
      'strong', 'b', 'em', 'i', 'u', 's', 'strike',
      'blockquote', 'pre', 'code',
      'ul', 'ol', 'li', 'a',
      'table', 'thead', 'tbody', 'tr', 'th', 'td',
    ],
    allowedAttributes: {
      a: ['href', 'title'],
      li: [{
        name: 'data-list',
        values: ['ordered', 'bullet'],
      }],
      '*': ['class'],
    },
    allowedClasses: {
      '*': [
        'ql-align-center',
        'ql-align-right',
        'ql-align-justify',
        'ql-direction-rtl',
        /^ql-indent-[1-8]$/,
      ],
    },
    allowedSchemes: ['http', 'https', 'mailto', 'tel'],
    allowProtocolRelative: false,
  });
}

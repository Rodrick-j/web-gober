import re

path = r'c:\Users\stard\web-gober\src\components\Navbar\Navbar.jsx'
with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

old_func = '''function getAcronym(nombre) {
  if(!nombre) return '';
  const ignoredWords = ['de', 'del', 'y', 'e', 'la', 'las', 'el', 'los', 'en', 'al', 'a', 'por', 'para'];
  const words = nombre.split(' ').filter(w => !ignoredWords.includes(w.toLowerCase()));
  return words.map(w => w[0].toUpperCase()).join('');
}'''

new_func = '''function getAcronym(nombre) {
  if(!nombre) return '';
  const ignoredWords = ['de', 'del', 'e', 'la', 'las', 'el', 'los', 'en', 'al', 'a', 'por', 'para'];
  const words = nombre.split(' ').filter(w => w.trim() !== '');
  let acr = '';
  for(let i=0; i<words.length; i++) {
    const w = words[i].toLowerCase();
    if (ignoredWords.includes(w)) continue;
    if (w === 'y') {
       acr += 'y ';
    } else {
       acr += words[i][0].toUpperCase() + '.';
    }
  }
  return acr.trim();
}'''

# Normalize newlines
content = content.replace('\r\n', '\n')
old_func = old_func.replace('\r\n', '\n')

content = content.replace(old_func, new_func)

with open(path, 'w', encoding='utf-8', newline='\r\n') as f:
    f.write(content)
print('Done!')

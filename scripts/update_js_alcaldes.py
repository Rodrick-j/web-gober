import pandas as pd
import re

df = pd.read_excel('D:\\Descargas\\ALCALDES_DEPARTAMENTO DE ORURO.xlsx')

alcaldes = {}
for index, row in df.iterrows():
    mun = str(row.get('Unnamed: 4', '')).strip()
    auth = str(row.get('Unnamed: 5', '')).strip()
    
    if 'Santiago Lopez Lazaro' in auth:
        alcaldes['Uru Chipaya'] = 'Santiago Lopez Lazaro'
    elif auth.startswith('Alc.'):
        name = auth.replace('Alc.', '').strip()
        mun_clean = mun.split('(')[0].strip()
        if "Huari" in mun_clean:
            mun_clean = "Huari"
        elif "Andamarca" in mun_clean and not "Bel" in mun_clean:
            mun_clean = "Andamarca"
        
        # mapping some names that might differ slightly
        if mun_clean == 'Paria - Soracachi': mun_clean = 'Soracachi'
        elif 'Quillacas' in mun_clean: mun_clean = 'Santuario de Quillacas'
        
        alcaldes[mun_clean.lower()] = name

filepath = 'c:\\Users\\HP\\web-gober\\src\\app\\(public)\\institucion\\historia\\municipiosData.js'

with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace alcalde names
for mun_name, alcalde_name in alcaldes.items():
    # Regex to find the block for the municipality and replace its alcalde
    # Since we don't parse JS perfectly, we can do a simple string replace if we know the exact names,
    # or just use regex to match the `nombre: 'MunName',` and then the subsequent `alcalde: '...',`
    
    # We will search for a block containing `nombre: 'mun_name'` case-insensitive
    # and replace `alcalde: '...'` inside that block.
    
    # Actually, simpler: let's match each object individually.
    pass

# A robust way using regex to replace 'partido: "..."' entirely and update 'alcalde' based on 'nombre'.
import re

# Split by objects assuming `// ───` separates them or just split by `{ slug: `
parts = content.split('slug: ')
new_content = parts[0]

for i in range(1, len(parts)):
    part = 'slug: ' + parts[i]
    
    # extract nombre
    nombre_match = re.search(r"nombre:\s*'([^']+)'", part)
    if nombre_match:
        nombre = nombre_match.group(1)
        nombre_lower = nombre.lower()
        
        if nombre_lower in alcaldes:
            new_alcalde = alcaldes[nombre_lower]
            part = re.sub(r"alcalde:\s*'[^']+'", f"alcalde: '{new_alcalde}'", part)
        
        # Check some hardcoded fallbacks
        if nombre_lower == 'oruro' and 'oruro' in alcaldes:
            part = re.sub(r"alcalde:\s*'[^']+'", f"alcalde: '{alcaldes['oruro']}'", part)
            
    # Delete partido: '...'
    part = re.sub(r"\s*partido:\s*(?:'[^']*'|\"[^\"]*\"),?", "", part)
    
    new_content += part

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(new_content)

print("Updated municipiosData.js successfully!")

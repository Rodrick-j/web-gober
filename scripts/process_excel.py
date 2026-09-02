import pandas as pd
import json

df = pd.read_excel('D:\\Descargas\\ALCALDES_DEPARTAMENTO DE ORURO.xlsx')

sql = "-- Actualización masiva de Alcaldes (desde Excel)\n\n"

# En el excel:
# Unnamed: 1 => Provincia
# Unnamed: 4 => Municipio (en algunos casos)
# Pero las filas están estructuradas de forma extraña.
# Vamos a extraer todas las celdas que contengan nombres de autoridades
# Para simplificar, recorremos todas las filas y columnas y buscamos 'Alc.'

for index, row in df.iterrows():
    # El municipio parece estar en la columna 'Unnamed: 4'
    mun = str(row.get('Unnamed: 4', '')).strip()
    auth = str(row.get('Unnamed: 5', '')).strip()
    
    # Si auth no empieza con Alc, probamos a ver si es la fila especial de Chipaya
    if 'Santiago Lopez Lazaro' in auth:
        mun = 'Uru Chipaya'
        name = auth
        sql += f"UPDATE municipios SET alcalde = '{name}' WHERE nombre ILIKE '%{mun}%';\n"
    elif auth.startswith('Alc.'):
        name = auth.replace('Alc.', '').strip()
        name = name.replace("'", "''") # escape para SQL
        mun_clean = mun.split('(')[0].strip()
        mun_clean = mun_clean.replace("'", "''")
        
        # Casos especiales de nombres en la DB vs Excel
        if "Huari" in mun_clean:
            mun_clean = "Huari"
        elif "Andamarca" in mun_clean and not "Bel" in mun_clean:
            mun_clean = "Andamarca"
            
        sql += f"UPDATE municipios SET alcalde = '{name}' WHERE nombre ILIKE '%{mun_clean}%';\n"

with open('c:\\Users\\HP\\web-gober\\sql\\23_update_alcaldes.sql', 'w', encoding='utf-8') as f:
    f.write(sql)
print("SQL file generated at 23_update_alcaldes.sql")

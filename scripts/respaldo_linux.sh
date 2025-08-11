#!/bin/bash
# Script de respaldo automático desde cliente Linux hacia servidor Samba en Docker

# === CONFIGURACIÓN ===
ORIGEN="/home/respaldo_origen"           # Carpeta local con archivos a respaldar
DESTINO="//respaldo-server/Respaldo"     # Nombre del servicio Samba (Docker Compose)
USUARIO="respaldo"                       # Usuario Samba
PASSWORD="1234"                          # Contraseña Samba
PORT=445                                 # Puerto Samba (445 estándar)

# Crear carpeta origen si no existe
mkdir -p "$ORIGEN"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Iniciando respaldo..." 

# Recorrer todos los archivos de la carpeta de origen
for archivo in "$ORIGEN"/*; do
    if [ -f "$archivo" ]; then
        nombre_archivo=$(basename "$archivo")   # Solo el nombre, sin ruta
        echo "Subiendo: $nombre_archivo"
        smbclient "$DESTINO" -p $PORT -U "$USUARIO%$PASSWORD" \
            -c "put \"$archivo\" \"$nombre_archivo\"" 2>&1
    fi
done

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Respaldo finalizado."

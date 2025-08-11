#!/bin/bash
# Script de respaldo automático desde cliente Linux hacia servidor Samba en Docker

ORIGEN="/home/respaldo_origen"
DESTINO="//respaldo-server/Respaldo"
USUARIO="respaldo"
PASSWORD="1234"
PORT=445

SMBCLIENT=$(which smbclient)

mkdir -p "$ORIGEN"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Iniciando respaldo..." 

for archivo in "$ORIGEN"/*; do
    if [ -f "$archivo" ]; then
        nombre_archivo=$(basename "$archivo")
        echo "Subiendo: $nombre_archivo"
        $SMBCLIENT "$DESTINO" -p $PORT -U "$USUARIO%$PASSWORD" \
            -c "put \"$archivo\" \"$nombre_archivo\"" 2>&1
    fi
done

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Respaldo finalizado."

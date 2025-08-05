#!/bin/bash

# Ruta local a respaldar
ORIGEN="/home/$(whoami)/Documentos"

# Ruta remota del servidor de respaldo
DESTINO="//localhost/Respaldo"

# Usuario de Samba
USUARIO="guest"
PASSWORD=""

# Montaje temporal
MOUNT_POINT="/mnt/respaldo"

# Crear punto de montaje si no existe
mkdir -p "$MOUNT_POINT"

# Montar carpeta Samba con credenciales
sudo mount -t cifs "$DESTINO" "$MOUNT_POINT" -o username=$USUARIO,password=$PASSWORD,port=1445,vers=3.0

# Sincronizar usando rsync
rsync -av --delete "$ORIGEN"/ "$MOUNT_POINT"/linux_$(whoami)/

# Desmontar
sudo umount "$MOUNT_POINT"

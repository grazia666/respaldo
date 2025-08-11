FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Instalar cron, cliente Samba y zona horaria
RUN apt-get update && \
    apt-get install -y cron smbclient tzdata && \
    mkdir -p /scripts

# Configurar zona horaria a Ecuador
RUN ln -sf /usr/share/zoneinfo/America/Guayaquil /etc/localtime && \
    echo "America/Guayaquil" > /etc/timezone

# Copiar script de respaldo desde carpeta scripts del proyecto
COPY scripts/respaldo_linux.sh /scripts/respaldo_linux.sh

# Dar permisos de ejecución al script
RUN chmod +x /scripts/respaldo_linux.sh

# Copiar configuración de cron a /etc/cron.d/
COPY cliente-linux/crontab.txt /etc/cron.d/respaldo-cron
RUN chmod 0644 /etc/cron.d/respaldo-cron

# Mantener cron en foreground
CMD ["cron", "-f"]

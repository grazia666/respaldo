FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias
RUN apt-get update &&     apt-get install -y cron smbclient tzdata &&     mkdir -p /scripts /home/respaldo_origen &&     touch /var/log/respaldo.log

# Configurar zona horaria a Ecuador
RUN ln -sf /usr/share/zoneinfo/America/Guayaquil /etc/localtime &&     echo "America/Guayaquil" > /etc/timezone

# Copiar script de respaldo
COPY scripts/respaldo_linux.sh /scripts/respaldo_linux.sh
RUN chmod +x /scripts/respaldo_linux.sh

# Copiar cronjob al formato correcto de /etc/cron.d/
COPY cliente-linux/crontab.txt /etc/cron.d/respaldo-cron
RUN chmod 0644 /etc/cron.d/respaldo-cron

# Mantener cron en foreground
CMD ["cron", "-f"]
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Instalar Samba
RUN apt-get update && \
    apt-get install -y samba && \
    mkdir -p /srv/respaldo && \
    chmod -R 777 /srv/respaldo

# Copiar configuración personalizada de Samba
COPY samba.conf /etc/samba/smb.conf

# Variables de usuario Samba
ENV SAMBA_USER=respaldo
ENV SAMBA_PASS=1234

# Crear usuario Samba y asignar permisos
RUN useradd -M -s /sbin/nologin ${SAMBA_USER} && \
    (echo "${SAMBA_PASS}"; echo "${SAMBA_PASS}") | smbpasswd -s -a ${SAMBA_USER} && \
    chown -R ${SAMBA_USER}:${SAMBA_USER} /srv/respaldo

EXPOSE 139 445

CMD ["smbd", "-F", "--no-process-group"]

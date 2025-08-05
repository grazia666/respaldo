FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y samba && \
    mkdir -p /srv/respaldo && \
    chmod -R 777 /srv/respaldo

COPY samba.conf /etc/samba/smb.conf

EXPOSE 139 445

CMD ["smbd", "-F", "--no-process-group"]

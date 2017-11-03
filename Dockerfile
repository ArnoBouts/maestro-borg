FROM debian

RUN apt-get update && apt-get install --yes --no-install-recommends curl ca-certificates sshfs

RUN curl -L -o /usr/local/bin/borg https://github.com/borgbackup/borg/releases/download/1.1.1/borg-linux64

RUN chmod +x /usr/local/bin/borg

RUN mkdir -p /mnt/sshfs

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["info"]

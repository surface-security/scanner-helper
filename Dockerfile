FROM debian:buster-slim
# move to alpine once journalctl reading is done some other way (debian GOne)

RUN apt update && \
    apt install -y --no-install-recommends systemd && \
    rm -rf /var/lib/apt/lists/*

COPY cmds/ /usr/local/bin/

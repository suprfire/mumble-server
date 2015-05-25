FROM ubuntu:14.04

MAINTAINER Adam Durham <amdnative@gmail.com>

RUN apt-get update
RUN apt-get install -y mumble-server

# Default port for mumble
EXPOSE 64738

RUN mkdir /data && \
    chown mumble-server:mumble-server /data && \
    chmod +x /start

VOLUME ["/data"]
USER mumble-server
ENTRYPOINT ["/usr/sbin/murmurd", "-fg", "-ini", "/etc/mumble-server.ini"]

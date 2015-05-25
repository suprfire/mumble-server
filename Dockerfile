FROM ubuntu:14.04

MAINTAINER Adam Durham <amdnative@gmail.com>

RUN apt-get update
RUN apt-get install -y mumble-server

# Default port for mumble
EXPOSE 64738

ADD ./mumble/mumble-server.ini /etc/mumble-server.ini
ADD ./init/murmur.init /etc/init/murmur.init
ADD ./scripts/start /start
RUN mkdir /data && \
    chown mumble-server:mumble-server /data && \
    chmod +x /start

VOLUME ["/data"]
USER mumble-server
CMD ["/start"]

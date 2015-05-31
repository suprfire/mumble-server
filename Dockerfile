FROM ubuntu:14.04

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -y install \
    	mumble-server \
    	pwgen \
    && rm -rf /var/lib/apt/lists/*

# Default port for mumble
EXPOSE 64738
ADD ./init/murmur.init /etc/init/murmur.init
ADD ./scripts/start /start
RUN mkdir /data && \
	chown mumble-server:mumble-server /data && \
	chmod +x /start
	
RUN rm -f /etc/mumble-server.ini && \
	ln -s /data/mumble-server.ini /etc/mumble-server.ini

VOLUME ["/data"]
USER mumble-server
CMD ["/start"]

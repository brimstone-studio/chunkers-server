# syntax=docker/dockerfile:1
FROM cm2network/steamcmd:latest

# The steamcmd image starts off logged in as the `steam` user

# Install Chunkers server app
RUN /home/steam/steamcmd/steamcmd.sh +force_install_dir /home/steam/chunkers +login anonymous +app_update 1865350 +quit

# Link `steamclient.so`
RUN mkdir /home/steam/.steam/sdk64
RUN ln -s /home/steam/steamcmd/linux64/steamclient.so /home/steam/.steam/sdk64/steamclient.so

# Change directory so it can find maps
WORKDIR /home/steam/chunkers

# Can't change the CHUNKERS_PORT env variable while running in docker
RUN export CHUNKERS_PORT=8086

# Start the server
CMD ["bash","/home/steam/chunkers/update_and_start.sh"]

EXPOSE 27015/tcp \
	 27015/udp \
	 8086/udp \
	 8086/tcp
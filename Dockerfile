FROM ubuntu:22.04

# Installer SteamCMD et dépendances de base
RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get install -y \
    software-properties-common \
    lib32gcc-s1 lib32stdc++6 \
    ca-certificates \
    curl unzip wget \
    libcurl4-gnutls-dev:i386 \
    libsdl2-2.0-0:i386 \
    libtcmalloc-minimal4 \
    && rm -rf /var/lib/apt/lists/*

# Création d'un utilisateur non-root
RUN useradd -m -d /home/valor -s /bin/bash valor
USER valor
WORKDIR /home/valor

# Installer SteamCMD
RUN mkdir -p /home/valor/steamcmd && \
    cd /home/valor/steamcmd && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -xvzf steamcmd_linux.tar.gz

# Copier le script d’entrée
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 27015/udp
ENTRYPOINT ["/entrypoint.sh"]

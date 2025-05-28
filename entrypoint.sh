#!/bin/bash

echo "Lancement du serveur Heroes of Valor (placeholder)..."

# Exemple de ligne à adapter quand l'ID Steam sera connu
/home/valor/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/valor/server +app_update 232250 validate +quit

# Lancer le serveur (à adapter)
# cd /home/valor/server && ./start_server.sh

exec sleep infinity

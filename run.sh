#!/usr/bin/env bash
config_file=${1:-/srv/tdsm/server.config}
rm -f $config_file
cat > $config_file <<CONFEND
# BASIC ===============================
world=Worlds/${TERRA_WORLD:-world}.wld
autocreate=${TERRA_AUTOCREATE:-1}
worldname=${TERRA_WORLDNAME:-Terraria}
difficulty=${TERRA_DIFFICULTY:-1}
maxplayer=${TERRA_MAXPLAYER:-8}
password=${TERRA_PASSWORD}
port=${TERRA_PORT:-7777}
motd=${TERRA_MOTD:-Welcome to a TDSM Rebind Server!}
worldpath=${TERRA_WORLDPATH:-Worlds/}
banlist=${TERRA_BANLIST:-banlist.txt}
secure=${TERRA_SECURE:-1}
lang=${TERRA_LANG:-1}
npcstream=${TERRA_NPCSTREAM:-60}
priority=${TERRA_PRIORITY:-1}

# TDSM ADDON =========================
whitelist=${TERRA_WHITELIST:-false}
heartbeat=${TERRA_HEARTBEAT:-true}
cheat-detection=${TERRA_CHEAT_DETECTION:-true}
server-side-characters=${TERRA_SVR_CHAR:-AUTH}
ssc-allow-guest-info=${TERRA_SVR_GUEST:-false}
server-list=${TERRA_SVR_LIST:-true}
server-list-name=${TERRA_SVR_NAME:-TDSM Server}
server-list-desc=${TERRA_SVR_DESC}
server-list-domain=${TERRA_SVR_DOMAIN}

# RCON ===============================
rcon-bind-address=${TERRA_RCON_ADDR:-127.0.0.1:7023}
rcon-hash-nonce=${TERRA_RCON_HASH}

# RAWS ===============================
web-server-bind-address=${TERRA_RAWS_ADDR:-http://localhost:8448}
web-server-serve-files=${TERRA_RAWS_FILE:-true}
web-server-provider=${TERRA_RAWS_PROVIDER:-TDSM Rebind Server Host}

# DATA ===============================
#sqlite=${TERRA_DATA_SQLITE:-Data Source=database.sqlite;Version=3}
CONFEND
if [[ ${TERRA_FTP_ENABLE} ]]; then
  cat > /tmp/ftp_pass.dat <<PAEND
Worlds:${TERRA_FTP_PASS}
Data:${TERRA_FTP_PASS}
PAEND
  (python /server.py) &
fi

mono tdsm.exe -config $config_file 

This is a fork of [parkervcp/tdsm](https://github.com/parkervcp/dockerfiles/blob/master/alpine/tdsm/tdsm-b4-Dockerfile).

You can setup tdsm via environment variables. There is a python twisted powered simple ftp for backup/sync Worlds/Data, you can set password via environment variables too.

${ENV VARS:-and default value}
============

```
${TERRA_WORLD:-world}
${TERRA_AUTOCREATE:-1}
${TERRA_WORLDNAME:-Terraria}
${TERRA_DIFFICULTY:-1}
${TERRA_MAXPLAYER:-8}
${TERRA_PASSWORD}
${TERRA_PORT:-7777}
${TERRA_MOTD:-Welcome to a TDSM Rebind Server!}
${TERRA_WORLDPATH:-Worlds/}
${TERRA_BANLIST:-banlist.txt}
${TERRA_SECURE:-1}
${TERRA_LANG:-1}
${TERRA_NPCSTREAM:-60}
${TERRA_PRIORITY:-1}

# TDSM ADDON =========================
${TERRA_WHITELIST:-false}
${TERRA_HEARTBEAT:-true}
${TERRA_CHEAT_DETECTION:-true}
${TERRA_SVR_CHAR:-AUTH}
${TERRA_SVR_GUEST:-false}
${TERRA_SVR_LIST:-true}
${TERRA_SVR_NAME:-TDSM Server}
${TERRA_SVR_DESC}
${TERRA_SVR_DOMAIN}

# RCON ===============================
${TERRA_RCON_ADDR:-127.0.0.1:7023}
${TERRA_RCON_HASH}

# RAWS ===============================
${TERRA_RAWS_ADDR:-http://localhost:8448}
${TERRA_RAWS_FILE:-true}
${TERRA_RAWS_PROVIDER:-TDSM Rebind Server Host}

# DATA ===============================
${TERRA_DATA_SQLITE:-Data Source=database.sqlite;Version=3}

# FTP ================================
${TERRA_FTP_ENABLE}
${TERRA_FTP_PASS}
```


# Hetzner Server (ssh hetzner)

- Hosts Coolify at https://coolify.justusdeitert.de. Connect via `ssh hetzner`.
- Coolify install: /data/coolify/source, start with `docker compose --env-file .env -f docker-compose.yml -f docker-compose.prod.yml up -d`
- Daily auto-upgrade cron can fail silently (upgrade log reports success even when compose up fails) - check `docker ps` for the 4 core containers: coolify, coolify-db, coolify-redis, coolify-realtime
- Upgrade logs: /data/coolify/source/upgrade-*.log
- 502 from coolify-proxy (traefik) = core containers down; proxy itself stays up

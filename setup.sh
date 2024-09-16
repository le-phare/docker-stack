#!/usr/bin/env bash

docker compose up -d 2>/dev/null

docker compose exec proxy wget -q -O- --post-data='"0.0.0.0:2019"' --header='Content-Type:application/json' 'http://127.0.0.1:2019/config/admin/listen'

docker compose cp proxy:/usr/bin/caddy /tmp/caddy 2>/dev/null

/tmp/caddy trust

# ArchLinux and derivatives, see https://wiki.archlinux.org/title/Transport_Layer_Security#Add_a_certificate_to_a_trust_store
if command -v trust &> /dev/null; then
  sudo trust anchor /usr/local/share/ca-certificates/*.crt
  sudo update-ca-trust
fi

rm -f /tmp/caddy

# Copy the certificate to a stable location (to simplify mounting on all Docker platforms)
sudo docker compose cp proxy:/data/caddy/pki/authorities/local/root.crt /etc/ssl/certs/Caddy.crt 2>/dev/null

echo "Certificats Caddy installés avec succès !"
echo "Vous pouvez désormais monter le fichier /etc/ssl/certs/Caddy.crt sur vos projets Docker."

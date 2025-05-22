#!/usr/bin/env sh

set -e

docker compose up -d 2>/dev/null

CERTIFICATES_STORAGE_DIRECTORY=/usr/local/share/ca-certificates
CADDY_ROOT_CERTIFICATE_FILE=$CERTIFICATES_STORAGE_DIRECTORY/Le_Phare_Docker_stack_Caddy_root.crt

if [ -e $CADDY_ROOT_CERTIFICATE_FILE ]; then
  echo "Le certificat Caddy existe déjà ($CADDY_ROOT_CERTIFICATE_FILE)."
  echo "Si vous souhaitez le remplacer par un nouveau : supprimez-le puis relancez cette commande."
  echo "Sinon, vous n'avez rien à faire."

  exit
fi

sudo mkdir -p $CERTIFICATES_STORAGE_DIRECTORY

sudo docker compose cp proxy:/data/caddy/pki/authorities/local/root.crt /usr/local/share/ca-certificates/ 2>/dev/null

if [ "$(uname -s)" != "Darwin" ]; then
  docker compose exec proxy wget -qO- --post-data='"0.0.0.0:2019"' --header='Content-Type:application/json' 'http://127.0.0.1:2019/config/admin/listen'

  sudo docker compose cp proxy:/usr/bin/caddy /tmp/caddy 2>/dev/null

  /tmp/caddy trust
else
  sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain /usr/local/share/ca-certificates/Le_Phare_Docker_stack_Caddy_root.crt
fi

echo "Certificats Caddy installés avec succès !"
echo "En cas de problèmes de certificats HTTPS non reconnus (dans votre navigateur par ex.), importez le fichier suivant dans les certificats du logiciel : /usr/local/share/ca-certificates/Le_Phare_Docker_stack_Caddy_root.crt"

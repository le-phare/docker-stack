#!/usr/bin/env bash

set -eo errexit

docker-run-php () {
    docker run \
        --rm \
        --user $UID \
        --volume $(pwd):/var/www/symfony \
        --volume $HOME/.composer:/var/tmp/composer \
        --network dev_database \
        --env SF_APP_HOST=${PROJECT_NAME}.${DOCKER_HOST_SUFFIX} \
        --env SF_DATABASE_NAME=${PROJECT_NAME} \
        lephare/php:7.0 \
        "$@"
}

EDITION=$1
PROJECT_NAME=$2

if [ -d $PROJECT_NAME ]; then
    echo "Le projet ${PROJECT_NAME} existe déjà !"
    exit 1
fi

echo "Création du projet ${PROJECT_NAME}"
composer create-project \
    --repository=https://toran.lephare-systeme.com/repo/private \
    --no-install \
    --no-progress \
    -q \
    $EDITION \
    $PROJECT_NAME

cd $PROJECT_NAME

echo "Téléchargement des dépendances (ceci peut prendre quelques minutes)"
docker-run-php composer install -n -q
npm install --loglevel silent > /dev/null

echo "Configuration du projet"
docker-run-php php bin/console faros:install:entities --no-interaction -f -q SiteBundle > /dev/null
docker-run-php php bin/console cache:clear --no-warmup -q
docker-run-php php bin/console doctrine:database:create -q || true
docker-run-php php bin/console doctrine:schema:create -q
docker-run-php php bin/console fixtures:load --no-truncate -q SiteBundle
docker-run-php php bin/console cache:warmup -q

cat <<- EOF > /tmp/${PROJECT_NAME}.conf
[program:${PROJECT_NAME}]
directory=/home/crea/www/${PROJECT_NAME}
command=/bin/sh -c 'npm run build:watch'
numprocs=1
user=crea
redirect_stderr=true
autostart=false
autorestart=unexpected
EOF

sudo mv /tmp/${PROJECT_NAME}.conf /etc/supervisor/conf.d/${PROJECT_NAME}.conf
sudo supervisorctl update ${PROJECT_NAME} > /dev/null
sudo supervisorctl start ${PROJECT_NAME} > /dev/null

npm run build
sed -i  '/composer.lock/d' .gitignore
git init
git add .
git commit -m 'Installation sandbox'

echo "Démarrage du projet"
docker-compose up -d --force-recreate

echo "Le projet est accessible à l'adresse : http://${PROJECT_NAME}.${DOCKER_HOST_SUFFIX}/_dev/fr/"
echo "Le guide d'utilisation de la sandbox ! http://readme.sandbox/utilisation"

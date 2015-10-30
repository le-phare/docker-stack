# Infrastructure Proxy

Ce projet contient les sources de la gestion du proxy sur srvproxy.

## Description

Il s'agit d'un ensemble de containers [docker](https://docker.io) qui construisent un proxy de services
permettant l'utilisation d'applicatifs qui nécessiteraient habituellement l'utilisation ou la mise en place 
de fichiers de configurations complexes.

Il se compose de trois couches logiciels : 

1. [consul](https://www.consul.io/) un gestionnaire de service
2. [gliderlabs/registrator](https://github.com/gliderlabs/registrator) un listener de container
3. [nginx](http://nginx.com/) un load balancer

## Utilisation 

```
git clone git@bitbucket.org:lephare/infrastructure-proxy.git 
cd infrastructure-proxy
cp docker-compose.yml.dist docker-compose.yml
docker-compose build
docker-compose up -d
```

## Hooks 

Pour les utilisateurs de git > 2.3, il est possible d'utiliser le hook fournis pour automatiser le redémarrage des services lors d'un git push 
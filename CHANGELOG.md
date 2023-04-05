# Changelog

## 1.0.0 (2023-04-05)


### Features

* add optional gitlab-runner service ([6164986](https://github.com/le-phare/docker-stack/commit/6164986b8bf91470ae26d7f6cf59f94d8bb809a9))
* always restart stack container ([6c0031b](https://github.com/le-phare/docker-stack/commit/6c0031b7de12d9747e8bfc6274c5f217c974afa4))
* cleanup stacks to keep only development stack ([d6ba444](https://github.com/le-phare/docker-stack/commit/d6ba444b652bed8709a83c3fc119b283612b630f))
* **dev:** add pgsql_13.yml ([13a4fbe](https://github.com/le-phare/docker-stack/commit/13a4fbe810c4a1e3ce10ee4cd86c1e0b5831cc9c))
* **networks:** update networks to use only two ([6a30b73](https://github.com/le-phare/docker-stack/commit/6a30b73cc3d024bca2e6ebe6af296e564b0b2786))
* **pgsql:** add postgresql 12 ([edaff3f](https://github.com/le-phare/docker-stack/commit/edaff3f5760c2335a27558a85190b20d4c9dae4a))
* **proxy:** bump caddy version to 2.5.2 ([4de5ce5](https://github.com/le-phare/docker-stack/commit/4de5ce5f3ff4a890fcda7bf09785f706536f82d9))
* remove watchtower service ([c721cf0](https://github.com/le-phare/docker-stack/commit/c721cf0466926e0e98de911dd59e88660bad631c))
* switch to official adminer image ([bd5a0fd](https://github.com/le-phare/docker-stack/commit/bd5a0fded3cdc1710ef1dd5d61d1e1e530bb819d))


### Bug Fixes

* adminer healtcheck ([51d56db](https://github.com/le-phare/docker-stack/commit/51d56dbbef52074c0e767348e20b128618c2fe1c))
* **pgsql:** add a default password to postgresql ([eec6a0a](https://github.com/le-phare/docker-stack/commit/eec6a0a6da3354b26787077cb4cae6fc639ea305))
* **proxy:** caddy-docker-proxy new go module name, double dash for caddyfile-path parameter ([#4](https://github.com/le-phare/docker-stack/issues/4)) ([60b0dd9](https://github.com/le-phare/docker-stack/commit/60b0dd9eaae714c67120bfd6d0aebdd236d3b355))
* rename mariadb file to be coherent with other database versions ([2c3cd7c](https://github.com/le-phare/docker-stack/commit/2c3cd7caeb2da1825819ce3fa2b150414a980d23))
* update shebang for setup ([a64d95e](https://github.com/le-phare/docker-stack/commit/a64d95e22836b89c9336c7258db23ae41ef64e83))

## 2019-04-05

### Nouveautés

- Génération des certificats SSL/TLS pour l'ensemble de la stack `dev`
- Support des requêtes SQL avec `OUTFILE` de mysql vers `/var/lib/mysql`

### Modifications

- Suppression de la configuration Imaprotect ([configuration pour le réseau du phare])
- Suppression du container de documentation
- Suppression des stacks inutilisés
- Renommage de la stack `lephare-systeme` en `production`


## 2017-06-09

 - Passage au format 3.2 (nécessite docker 1.13 ou plus)
 - Séparation des containers de stockage (bd, elastic, ...) pour une stack plus modulable
 - Ajout d'un container de documentation (http://doc.eri.lph)
 - Ajout d'une configuration Imaprotect
 - Ajout d'un readme pour installer et configurer la stack
 - Suppression des adresses *.docker


[configuration pour le réseau du phare]: https://help.lephare.io/t/guide-parametrer-docker-pour-le-reseau-du-phare/486?u=aegypius

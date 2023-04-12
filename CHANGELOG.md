# Changelog

## [2.2.0](https://github.com/le-phare/docker-stack/compare/v2.1.1...v2.2.0) (2023-04-12)


### Features

* add support for arm64 ([b3b58a8](https://github.com/le-phare/docker-stack/commit/b3b58a8da9127ebce7250ee6521a9f229cb6f756))

## [2.1.1](https://github.com/le-phare/docker-stack/compare/v2.1.0...v2.1.1) (2023-04-05)


### Bug Fixes

* **mysql:** use debian variant of the image ([d402aeb](https://github.com/le-phare/docker-stack/commit/d402aeb0f2d26fa87122dfd7f1240834b2989251))

## 2.1.0 (2023-04-05)


### Features

* add optional gitlab-runner service ([3b33b1d](https://github.com/le-phare/docker-stack/commit/3b33b1df95e7663085fe587090495429365ccb48))
* always restart stack container ([0085608](https://github.com/le-phare/docker-stack/commit/00856087e3c7c90aca33a14ec3816092087c368d))
* cleanup stacks to keep only development stack ([5af897d](https://github.com/le-phare/docker-stack/commit/5af897ddd46f561564f7dbd1a7958f23f9c0f25c))
* **dev:** add pgsql_13.yml ([a8bd2e4](https://github.com/le-phare/docker-stack/commit/a8bd2e4afc8baa183eaf840da166064d9e9b5b17))
* **networks:** update networks to use only two ([2a95bac](https://github.com/le-phare/docker-stack/commit/2a95bacfad45bc0512d2d3a67006379c99a2eced))
* **pgsql:** add postgresql 12 ([f30566e](https://github.com/le-phare/docker-stack/commit/f30566eed79ba844ed1d0808f15d4b895d51b1fb))
* **proxy:** bump caddy version to 2.5.2 ([5daa218](https://github.com/le-phare/docker-stack/commit/5daa2181acd16f0dc3bc83f9a3e96ce777dc171d))
* remove watchtower service ([2abf6cd](https://github.com/le-phare/docker-stack/commit/2abf6cdb5db8fb810fe1ef964a0641b7e53d0864))
* switch to official adminer image ([0c1a52e](https://github.com/le-phare/docker-stack/commit/0c1a52e80f40e0a197edbb26874a10faca3fef4c))


### Bug Fixes

* adminer healtcheck ([87dc9aa](https://github.com/le-phare/docker-stack/commit/87dc9aa7f778d08e1d02b845e502d58a7f2bfeda))
* **pgsql:** add a default password to postgresql ([5efc95f](https://github.com/le-phare/docker-stack/commit/5efc95fe62c646c4dcb5ae201748e70254529fae))
* **proxy:** caddy-docker-proxy new go module name, double dash for caddyfile-path parameter ([#4](https://github.com/le-phare/docker-stack/issues/4)) ([ca76378](https://github.com/le-phare/docker-stack/commit/ca76378e6a5c93a374fa86567a1660090c9e0d70))
* rename mariadb file to be coherent with other database versions ([44d8d78](https://github.com/le-phare/docker-stack/commit/44d8d78e59835c0225a753c18d72e234dd4fb6c5))
* update shebang for setup ([73ec56e](https://github.com/le-phare/docker-stack/commit/73ec56e82bc225c781b5c617831f8de5fc0bd25b))


### Miscellaneous Chores

* prepare 2.1.0 release ([b99fcdf](https://github.com/le-phare/docker-stack/commit/b99fcdf18cc8517950f8a81a5ed82edc8231f32d))

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

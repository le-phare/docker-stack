# Changelog

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

---
layout: default
title: git
---
# Comment utiliser GIT ?

### Choisir la bonne branche de travail

Pour voir la branche courante

    $ git branch

Pour se mettre sur la branche de **production**

	$ git checkout master

Pour se mettre sur la branche de **preprod**

	$ git checkout develop

Pour créer une nouvelle branche à partir d'une autre

	$ git checkout -b <nouvelle-branche> <branche-origine>

Exemple

	$ git checkout -b recettage-integration develop


### Récupérer les modifications des développeurs

    $ git up

### Visualiser vos modifications

    $ git status

### Ajouter les fichiers que vous voulez commiter

    $ git add src/SiteBundle/mon-fichier

### Vérifier ce qui va être commité

    $ git status

### Commiter les modifications

    $ git commit -m "Message de commit"

### Pousser les modifications

    $ git push

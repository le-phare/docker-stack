---
layout: default
title: Utilisation sandbox
---
# Comment utiliser la sandbox ?

## Templates

Les templates sont stockés dans `src/SiteBundle/Resources/views`.

Pour visualiser le rendu HTML d'un template le format d'url est le suivant : `/_dev/{lang}/{dossier}/{template}`.

Par exemple le template `src/SiteBundle/Resources/views/News/list.html.twig` se visualise a l'adresse `/_dev/fr/News/list`.

## Emails

Les templates d'emails sont stockés dans `src/SiteBundle/Resources/views/Email/{lang}/`.

Pour visualiser le rendu d'un email, vous pouvez utiliser [maildev.sandbox](http://maildev.sandbox).

Par exemple le template d'email `src/SiteBundle/Resources/views/Email/fr/contact.html.twig` s'envoie via l'adresse `/_dev/fr/Email/contact`.

**ATTENTION** Les images dans les emails doivent utiliser des chemins absolus pour qu'ils s'affichent correctement.

~~~twig
{% verbatim -%}
<img src="{{ absolute_url(asset('/bundles/site/img/logo.png')) }}">
{%- endverbatim %}
~~~

## PDF

Les templates de PDF doivent se terminer par `.pdf.twig` au lieu de `.html.twig`. Le template `src/SiteBundle/Resources/views/Product/show.pdf.twig` peut se consulter dans deux formats.

 * en html à l'adresse `/_dev/fr/Product/show.html`
 * en pdf à l'adresse `/_dev/fr/Product/show.pdf`

**ATTENTION** Les images dans les pdf doivent utiliser des chemins absolus pour qu'ils s'affichent correctement.

~~~twig
{% verbatim -%}
<img src="{{ absolute_url(asset('/bundles/site/img/logo.png')) }}">
{%- endverbatim %}
~~~

## Traduction

Les templates sont stockées dans `src/SiteBundle/Resources/translations/messages.{lang}.yml`.

Pour afficher une traduction il faut utiliser la syntaxe suivante.

~~~twig
{% verbatim %}{{ 'home.baseline'|trans }}{% endverbatim %}
~~~

## Assets (JS, LESS, CSS, images et fonts)

### Compilation Gulp

Les css et js sont compilés par l'outil [gulp](). Le fichier de configuration est `gulpfile.js`. Les fichiers compilés sont stockés dans `web/compiled`.

La sandbox est préconfigurée avec 4 resources compilées.

 * `compiled/css/vendor.css` contient les dépendances CSS du projet (bootstrap, font-awesome, ...)
 * `compiled/css/front.css` contient les CSS écrit spécifiquement pour le projet
 * `compiled/js/vendor.js` contient les dépendances JS du projet (bootstrap, jquery, ...)
 * `compiled/js/front.js` contient le JS écrit spécifiquement pour le projet

Ces fichiers sont générés automatiquement et ne doivent **jamais** être modifiés sous peine de perdre ses modifications.

### Less/CSS

Les styles sont stockés dans `src/SiteBundle/Resources/assets/less`.

 * `vendor.less` se charge d'importer les dépendances (Bootstrap, font-awesome, etc)
 * `fonts.less` permet de déclarer les `@font-face`
 * `variables.less` permet de surcharger les variables de bootstrap et d'en créer de nouvelles
 * `front.less` sert pour les styles du front

### JS

Dans la mesure du possible les outils JS tiers doivent être déclarés comme dépendances dans le fichier `package.json` et ajouté à la compilation gulp.

La seule exception concerne les outils qui ne serait pas open-source et/ou non distribuée de manière publique. C'est le cas de la plupart des outils payant comme masterslider, royalslider, etc.
Dans ce cas, ces outils doivent être stockés dans `src/SiteBundle/Resource/assets/libs` et ajoutés à la compilation gulp.

L'inclusion et le paramétrage des outils se fait directement dans les templates pour être repris par un développeur. Il faut utiliser le bloc twig `javascripts` pour ajouter du JS à votre page.

~~~twig
{% verbatim -%}
{% block javascripts %}
<script>
    $('.carousel').carousel({
        /*...config...*/
    });
</script>
{% endblock javascripts %}
{%- endverbatim %}
~~~

### Fonts

Les fonts spécifiques du projets vont dans `src/SiteBundle/Resources/public/fonts` et leurs définition dans `src/SiteBundle/Resources/assets/less/fonts.less`.

Le chemin d'accès à utiliser dans le fichier less est `/bundles/site/fonts/ma-police.ttf`.

### Images

Les images vont dans `src/SiteBundle/Resources/public/img`. Le chemin d'accès à utiliser dans les less ou les balises `<img>` est `/bundles/site/img/logo.png`.

Les chemins vers les images dans les balises `<img>` doivent utiliser la fonction `asset()` de twig.

~~~twig
{% verbatim -%}
<img src="{{ asset('/bundles/site/img/logo.png') }}">
{%- endverbatim %}
~~~

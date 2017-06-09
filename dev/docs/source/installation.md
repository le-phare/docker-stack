---
layout: default
title: Installation sandbox
---
# Comment installer une nouvelle sandbox ?

Se connecter sur le serveur de sandbox (mot de passe *crea*)

    $ ssh crea@srvsandbox
    $ cd www

<div class="row">
    <div class="col-sm-6">
        Pour un projet <strong>lead</strong>
<pre><code>$ curl -sS http://readme.docker/install.sh | bash -s -- lephare/faros-lead-edition &lt;mon-projet&gt; </code></pre>
    </div>
    <div class="col-sm-6">
        Pour un projet <strong>ecommerce</strong>
<pre><code>$ curl -sS http://readme.docker/install.sh | bash -s -- lephare/faros-ecommerce-edition &lt;mon-projet&gt;</code></pre>
    </div>
</div>

Configurer l'intégrateur du projet

    $ git config user.email '<votre-email>'
    $ git config user.name '<prenom-nom>'

Le projet est disponible sur `http://<mon-projet>.sandbox/_dev/fr/`.

Consultez le [guide d'utilisation](/utilisation) de la sandbox pour continuer.


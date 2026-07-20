<?php

/**
 * Pre-login to Le Phare database servers.
 */
class LePharePluginPreLoginToDatabases
{
  const array MYSQL_HOSTS = ['mysql-5', 'mariadb-10'];
  const array POSTGRESQL_HOSTS = ['pgsql-9', 'pgsql-10', 'pgsql-11', 'pgsql-12', 'pgsql-13', 'pgsql-14', 'pgsql-15', 'pgsql-16', 'pgsql-17', 'pgsql-18'];

  function __construct()
  {
    foreach (self::MYSQL_HOSTS as $MYSQL_HOST) {
      \Adminer\set_password('server', $MYSQL_HOST, 'root', 'root');
      $_SESSION['db']['server'][$MYSQL_HOST]['root'][''] = true;
    }

    foreach (self::POSTGRESQL_HOSTS as $POSTGRESQL_HOST) {
      \Adminer\set_password('pgsql', $POSTGRESQL_HOST, 'postgres', 'root');
      $_SESSION['db']['pgsql'][$POSTGRESQL_HOST]['postgres'][''] = true;
    }
  }
}

<?php

/**
 * Pre-login to Le Phare database servers.
 */
class LePharePluginPreLoginToDatabases
{
  const array MYSQL_HOSTS = ['mysql_5', 'mariadb_10'];
  const array POSTGRESQL_HOSTS = ['pgsql_9', 'pgsql_10', 'pgsql_11', 'pgsql_12', 'pgsql_13', 'pgsql_14', 'pgsql_15', 'pgsql_16', 'pgsql_17'];

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

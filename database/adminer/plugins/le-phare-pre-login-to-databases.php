<?php
use function Adminer\set_password;

/** Pre-login to Le Phare database servers */
class LePharePluginPreLoginToDatabases
{
  function __construct()
  {
    set_password('server', 'mysql_5', 'root', 'root');

    set_password('server', 'mariadb_10', 'root', 'root');

    set_password('pgsql', 'pgsql_9', 'postgres', 'root');
    set_password('pgsql', 'pgsql_10', 'postgres', 'root');
    set_password('pgsql', 'pgsql_11', 'postgres', 'root');
    set_password('pgsql', 'pgsql_12', 'postgres', 'root');
    set_password('pgsql', 'pgsql_13', 'postgres', 'root');
    set_password('pgsql', 'pgsql_14', 'postgres', 'root');
    set_password('pgsql', 'pgsql_15', 'postgres', 'root');
    set_password('pgsql', 'pgsql_16', 'postgres', 'root');
    set_password('pgsql', 'pgsql_17', 'postgres', 'root');
  }
}

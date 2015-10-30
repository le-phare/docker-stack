FROM lephare/apache:2.2

RUN a2enmod vhost_alias \
  && mkdir /var/www/cgi-bin

ENTRYPOINT ["dockerize", "--stderr", "/var/log/apache2/error.log"]

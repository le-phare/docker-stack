retry = "10s"
log_level = "debug"

template {
  source = "/etc/consul-template/templates/nginx.conf.gotpl"
  destination = "/etc/nginx/nginx.conf"
  command = "cat /etc/nginx/nginx.conf && nginx -c /etc/nginx/nginx.conf -t && (nginx -c /etc/nginx/nginx.conf -s stop || true) &&  nginx -c /etc/nginx/nginx.conf"
}

template {
  source = "/etc/consul-template/templates/index.html.gotpl"
  destination = "/var/www/localhost/htdocs/index.html"
}

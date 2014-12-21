class logs {
  if ! file_exists('/phpmyadmin/ssl/certs/vhost.crt') {
    require phpmyadmin::httpd::ssl
  }
}

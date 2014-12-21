class logs {
  if ! file_exists('/logs/ssl/certs/vhost.crt') {
    require logs::httpd::ssl
  }
}

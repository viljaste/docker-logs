class logs::httpd::ssl {
  exec { 'openssl genrsa -out /logs/ssl/private/logsCA.key 4096':
    timeout => 0,
    path => ['/usr/bin']
  }

  exec { "openssl req -x509 -new -nodes -key /logs/ssl/private/logsCA.key -days 365 -subj /C=/ST=/L=/O=/CN=logs -out /logs/ssl/certs/logsCA.crt":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /logs/ssl/private/logsCA.key 4096']
  }

  exec { 'openssl genrsa -out /logs/ssl/private/logs.key 4096':
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -x509 -new -nodes -key /logs/ssl/private/logsCA.key -days 365 -subj /C=/ST=/L=/O=/CN=logs -out /logs/ssl/certs/logsCA.crt"]
  }

  $subj = "/C=/ST=/L=/O=/CN=$server_name"

  exec { "openssl req -sha256 -new -key /logs/ssl/private/logs.key -subj $subj -out /logs/ssl/certs/logs.csr":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /logs/ssl/private/logs.key 4096']
  }

  exec { "openssl x509 -req -in /logs/ssl/certs/logs.csr -CA /logs/ssl/certs/logsCA.crt -CAkey /logs/ssl/private/logsCA.key -CAcreateserial -out /logs/ssl/certs/logs.crt -days 365":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -sha256 -new -key /logs/ssl/private/logs.key -subj $subj -out /logs/ssl/certs/logs.csr"]
  }
}

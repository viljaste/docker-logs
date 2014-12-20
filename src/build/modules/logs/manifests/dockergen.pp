class logs::dockergen {
  require logs::dockergen::supervisor

  file { '/tmp/docker-gen-linux-amd64-0.3.6.tar.gz':
    ensure => present,
    source => 'puppet:///modules/logs/tmp/docker-gen-linux-amd64-0.3.6.tar.gz'
  }

  exec { 'tar -xvzf docker-gen-linux-amd64-0.3.6.tar.gz -C /usr/local/bin':
    cwd => '/tmp',
    path => ['/bin'],
    require => File['/tmp/docker-gen-linux-amd64-0.3.6.tar.gz']
  }
}

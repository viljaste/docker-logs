class logs::elasticsearch {
  require logs::elasticsearch::supervisor

  file { '/tmp/elasticsearch-1.4.2.tar.gz':
    ensure => present,
    source => 'puppet:///modules/logs/tmp/elasticsearch-1.4.2.tar.gz'
  }

  exec { 'tar xzf elasticsearch-1.4.2.tar.gz':
    cwd => '/tmp',
    path => ['/bin'],
    require => File['/tmp/elasticsearch-1.4.2.tar.gz']
  }

  exec { 'mv elasticsearch-1.4.2 /opt/elasticsearch':
    cwd => '/tmp',
    path => ['/bin'],
    require => Exec['tar xzf elasticsearch-1.4.2.tar.gz']
  }

  file { '/opt/elasticsearch/config/elasticsearch.yml':
    ensure => present,
    source => 'puppet:///modules/logs/opt/elasticsearch/config/elasticsearch.yml'
  }
}

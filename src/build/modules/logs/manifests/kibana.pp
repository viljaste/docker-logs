class logs::kibana {
  require logs::httpd

  file { '/tmp/kibana-3.1.2.tar.gz':
    ensure => present,
    source => 'puppet:///modules/logs/tmp/kibana-3.1.2.tar.gz'
  }

  exec { 'tar xzf kibana-3.1.2.tar.gz':
    cwd => '/tmp',
    path => ['/bin'],
    require => File['/tmp/kibana-3.1.2.tar.gz']
  }

  exec { 'rsync -avz kibana-3.1.2/ /logs/data':
    cwd => '/tmp',
    path => ['/usr/bin'],
    require => Exec['tar xzf kibana-3.1.2.tar.gz']
  }
}

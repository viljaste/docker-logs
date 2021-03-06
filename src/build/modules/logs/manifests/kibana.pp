class logs::kibana {
  require logs::elasticsearch
  require logs::kibana::supervisor

  file { '/tmp/kibana-4.0.0-beta3.tar.gz':
    ensure => present,
    source => 'puppet:///modules/logs/tmp/kibana-4.0.0-beta3.tar.gz'
  }

  exec { 'tar xzf kibana-4.0.0-beta3.tar.gz':
    cwd => '/tmp',
    path => ['/bin'],
    require => File['/tmp/kibana-4.0.0-beta3.tar.gz']
  }

  exec { 'mv kibana-4.0.0-beta3 /opt/kibana':
    cwd => '/tmp',
    path => ['/bin'],
    require => Exec['tar xzf kibana-4.0.0-beta3.tar.gz']
  }

  file { '/opt/kibana/config/kibana.yml':
    ensure => present,
    source => 'puppet:///modules/logs/opt/kibana/config/kibana.yml',
    require => Exec['mv kibana-4.0.0-beta3 /opt/kibana']
  }
}

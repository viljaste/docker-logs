class logs::httpd {
  require logs::httpd::packages
  require logs::httpd::supervisor

  exec { 'mkdir -p /logs/data':
    path => ['/bin']
  }

  exec { 'usermod -d /logs/data www-data':
    path => ['/usr/sbin']
  }

  file { '/etc/apache2/sites-enabled/000-default':
    ensure => absent
  }

  file { '/etc/apache2/sites-available/default':
    ensure => present,
    source => 'puppet:///modules/logs/etc/apache2/sites-available/default',
    mode => 644
  }

  file { '/etc/apache2/sites-enabled/default':
    ensure => link,
    target => '/etc/apache2/sites-available/default',
    require => File['/etc/apache2/sites-available/default']
  }

  file { '/etc/apache2/sites-available/default-ssl':
    ensure => present,
    source => 'puppet:///modules/logs/etc/apache2/sites-available/default-ssl',
    mode => 644
  }

  file { '/etc/apache2/sites-enabled/default-ssl':
    ensure => link,
    target => '/etc/apache2/sites-available/default-ssl',
    require => File['/etc/apache2/sites-available/default-ssl']
  }

  file { '/etc/apache2/apache2.conf':
    ensure => present,
    source => 'puppet:///modules/logs/etc/apache2/apache2.conf',
    mode => 644
  }
}

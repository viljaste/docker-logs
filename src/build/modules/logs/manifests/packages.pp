class logs::packages {
  file { '/etc/apt/sources.list.d/webupd8team-java.list':
    ensure => present,
    source => 'puppet:///modules/logs/etc/apt/sources.list.d/webupd8team-java.list',
    mode => 644
  }

  exec { '/bin/su - root -c "apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886"':
    timeout => 0,
    require => File['/etc/apt/sources.list.d/webupd8team-java.list']
  }

  exec { 'apt-get update':
    path => ['/usr/bin'],
    require => Exec['/bin/su - root -c "apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886"']
  }

  exec { '/bin/su - root -c "echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections"':
    path => ['/usr/bin'],
    require => Exec['apt-get update']
  }

  package {[
      'oracle-java8-set-default'
    ]:
    ensure => present,
    require => Exec['/bin/su - root -c "echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections"']
  }
}

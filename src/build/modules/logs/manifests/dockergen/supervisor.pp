class logs::dockergen::supervisor {
  file { '/etc/supervisor/conf.d/dockergen.conf':
    ensure => present,
    source => 'puppet:///modules/logs/etc/supervisor/conf.d/dockergen.conf',
    mode => 644
  }
}

class logs::kibana::supervisor {
  file { '/etc/supervisor/conf.d/kibana.conf':
    ensure => present,
    source => 'puppet:///modules/logs/etc/supervisor/conf.d/kibana.conf',
    mode => 644
  }
}

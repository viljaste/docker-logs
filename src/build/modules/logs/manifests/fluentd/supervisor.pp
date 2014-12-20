class logs::fluentd::supervisor {
  file { '/etc/supervisor/conf.d/fluentd.conf':
    ensure => present,
    source => 'puppet:///modules/logs/etc/supervisor/conf.d/fluentd.conf',
    mode => 644
  }
}

class logs::elasticsearch::supervisor {
  file { '/etc/supervisor/conf.d/elasticsearch.conf':
    ensure => present,
    source => 'puppet:///modules/logs/etc/supervisor/conf.d/elasticsearch.conf',
    mode => 644
  }
}

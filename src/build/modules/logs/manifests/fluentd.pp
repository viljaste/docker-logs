class logs::fluentd {
  require logs::fluentd::packages
  require logs::fluentd::supervisor

  file { '/root/fluentd.conf.tmpl':
    ensure => present,
    source => 'puppet:///modules/logs/root/fluentd.conf.tmpl'
  }
}

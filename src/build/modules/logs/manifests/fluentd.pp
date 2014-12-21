class logs::fluentd {
  require logs::fluentd::packages
  require logs::fluentd::supervisor

  exec { 'td-agent-gem install fluent-plugin-elasticsearch':
    timeout => 0,
    path => ['/usr/sbin']
  }

  file { '/root/fluentd.conf.tmpl':
    ensure => present,
    source => 'puppet:///modules/logs/root/fluentd.conf.tmpl'
  }
}

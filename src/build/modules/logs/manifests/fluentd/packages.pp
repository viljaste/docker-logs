class logs::fluentd::packages {
  exec { '/bin/su - root -c "curl -L http://toolbelt.treasuredata.com/sh/install-debian-wheezy-td-agent2.sh | sh"': }

  package {[
      'sudo',
      'libcurl4-gnutls-dev'
    ]:
    ensure => present,
    before => Exec['/bin/su - root -c "curl -L http://toolbelt.treasuredata.com/sh/install-debian-wheezy-td-agent2.sh | sh"']
  }
}

# Class: quota
#
#
class quota inherits quota::params{
  $packages = $::quota::params::packages

  package { $packages:
    ensure => installed,
    notify => Exec['enable_quota']
  }

  exec {'enable_quota':
    command     => '/usr/bin/quotaon -a',
    refreshonly => true,
  }
}

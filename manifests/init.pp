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
    command     => 'quotaon -a',
    path        => '/usr/bin:/usr/sbin',
    refreshonly => true,
  }
}

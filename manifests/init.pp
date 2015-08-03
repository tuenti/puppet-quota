# Class: quota
#
#
class quota {
  $packages = [
    'quota',
    'quotatool',
  ]
  package { $packages:
    ensure => installed,
  }
}

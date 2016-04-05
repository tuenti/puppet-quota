class quota::params {
  case $::osfamily {
    'Debian': {
      $packages = [ 'quota', 'quotatool' ]
    }
    'RedHat': {
      $packages = 'quota'
    }
    default: {
      $packages = 'quota'
    }
  }
}

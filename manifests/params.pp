class ssh::params {

#  unless $facts['os']['family'] == 'Debian' {
#    $package_name = 'openssh-server'
#    $service_name = 'sshd'    
#  }

#  if $facts['os']['family'] == 'Debian' {
#    $package_name = 'openssh-server'
#    $service_name = 'ssh'
#  }
#  elsif $facts['os']['family'] == 'Redhat' {
#    $package_name = 'openssh-server'
#    $service_name = 'sshd'
#  }
#  else {
#    fail("${facts['operatingsystem']} is not supported!")
#  }


  case $facts['os']['family'] {
    'Debian': {
      $package_name = 'openssh-server'
      $service_name = 'ssh'
    }
    'RedHat': {
      $package_name = 'openssh-server'
      $service_name = 'sshd'
    }
    default: {
      fail("${facts['operatingsystem']} is not supported!")
    }
  }


### This is not working because of 'operatingsystem', error in 'fail("$(facts...!")' 
#  case $facts['operatingsystem'] {
#
#    'Debian','Ubuntu': {
#      $package_name = 'openssh-server'
#      $service_name = 'ssh'
#    }
#
#    /^RedHat|CentOS/: {
#    'RedHat', 'CentOS': {
#      $package_name = 'openssh-server'
#      $service_name = 'sshd'
#      notify { "${0} is our operating system!": }
#    }
#
#    default: {
#      fail("${facts['operatingsystem']} is not supported!")
#    }
#  }


}

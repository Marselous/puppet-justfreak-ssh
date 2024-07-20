## site.pp file for manifests
##
##
##

class ssh(
 # Boolean $permit_root_login = $::ssh::params::permit_root_login,
 # Integer $port              = $::ssh::params::port,
 # String $package_name       = $::ssh::params::package_name,
 # String $service_name       = $::ssh::params::service_name,
#) inherits ::ssh::params {
  String $package_name,
  String $service_name,
  String $ensure,
  String $service_ensure,
  Boolean $service_enable,
  Boolean $permit_root_login = false,
  Integer $port              = 22,
) {
  notify { "module: test top scope var in a module": 
    message => "test top scope ${::test_top_scope}"
  }
## This will not work:
#  notify { "module: test node scope var in a module":
#    message => "test top scope ${::node_scope_var}"
#  }
  class { '::ssh::install': }
  class { '::ssh::config': }
  class { '::ssh::service': }
  
  Class['::ssh::install']
  -> Class['::ssh::config']
  ~> Class['::ssh::service']
  -> Class['ssh']
}

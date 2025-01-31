class ssh::service(
  String $service_name    = $::ssh::service_name,
  String $service_ensure  = $::ssh::service_ensure,
  Boolean $service_enable = $::ssh::service_enable,
) {
  service { 'ssh-service':
   # ensure     => running,
    ensure     => $service_ensure,
    name       => $service_name,
   # enable     => true,
    enable     => $service_enable,
    hasstatus  => true,
    hasrestart => true,
  }
}

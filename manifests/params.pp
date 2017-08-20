class ntp::params{
  $package_name 	= 'ntp'
  $package_ensure 	= 'present'
  $config_file_name 	= 'ntp.conf'
  $config_file_mode 	= '0664'
  $service_ensure 	= 'running'
  $service_enable 	= true
  $service_hasrestart 	= true
  $service_hasstatus	= true

  $service_name = $facts['os']['family'] ? {
    'Debian' => 'ntp',
    default  => 'ntpd',
  }
  
  $servers 	= $facts['os']['family'] ? { 
    'Debian' 	=> ['0.debian.pool.ntp.org', '1.debian.pool.ntp.org', '2.debian.pool.ntp.org', '3.debian.pool.ntp.org'], 
    default     => ['0.centos.pool.ntp.org', '1.centos.pool.ntp.org'],
  }
}


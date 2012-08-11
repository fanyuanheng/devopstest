class tomcat::utils {
  
  file { '/usr/local/bin/check_tomcat':
    ensure => present,
    owner => root,
    group => root,
    mode => 0755,
    source => 'puppet:///modules/tomcat/check_tomcat',
  }
  
  cron { 'check_tomcat':
    command => '/usr/local/bin/check_tomcat',
    user => root,
    hour => '*',
    minute => '*',
    month => '*',
    monthday => '*',
    weekday => '*',
    require => File['/usr/local/bin/check_tomcat'],
  }
  
}
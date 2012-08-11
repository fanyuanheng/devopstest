define tomcat::deployment($path) {
 
  file { "/var/lib/tomcat5/webapps/${name}.war":
    owner => 'root',
    group => 'tomcat',
    source => $path,
    require => Package['tomcat'],
    notify => Service['tomcat'],
  }
  
  file { '/etc/tomcat5/server.xml':
    ensure => present,
    owner => root,
    group => root,
    mode => 0644,
    content => template('tomcat/server.xml.erb'),
    require => Package['tomcat'],
    notify => Service['tomcat'],
  }
 
}
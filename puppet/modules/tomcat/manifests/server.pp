class tomcat::server {
  
  package { 'tomcat':
    ensure => present,
    name => 'tomcat5',
    before => Service['tomcat'],
  }
  
  package { 'tomcat-webapps':
    ensure => present,
    name => 'tomcat5-webapps',
    before => Service['tomcat'],
  }
  
  package { 'tomcat-admin-webapps':
    ensure => present,
    name => 'tomcat5-admin-webapps',
    before => Service['tomcat'],
  }
  
  file { '/etc/sysconfig/tomcat5':
    ensure => present,
    owner => root,
    group => root,
    mode => 0644,
    source => 'puppet:///modules/tomcat/config',
    require => Package['tomcat'],
    notify => Service['tomcat'],
  }
  
  file { '/etc/tomcat5/web.xml':
    ensure => present,
    owner => root,
    group => root,
    mode => 0644,
    source => 'puppet:///modules/tomcat/web.xml',
    require => Package['tomcat'],
    notify => Service['tomcat'],
  }
  
  file { "/var/lib/tomcat5/webapps/ROOT/404.html":
    content => template('tomcat/404.html.erb'),
    owner   => "root",
    group   => "tomcat",
    mode    =>  0644,
    require => Package['tomcat'],
    notify => Service['tomcat'],
  }
  
  service { 'tomcat':
    enable => true,
    name => 'tomcat5',
    ensure => running,
  }
  
}
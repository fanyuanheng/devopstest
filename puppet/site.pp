node 'devops.vagrant.test' {
  include java::openjdk
  include tomcat
  
  tomcat::deployment { 'helloworld':
    path => '/vagrant-share/HelloWorld.war'
  }
}
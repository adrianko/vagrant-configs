Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

exec { 'update':
  command => 'apt-get update --fix-missing';
}

package { ['mongodb', 'npm', 'nodejs']:
  ensure => present,
  require => Exec['update'];
}

service { 'mongodb':
  ensure => running,
  require => Package['mongodb'];
}

exec { 'meanio':
  command => 'npm install -g meanio',
  require => Package['npm'];
}

exec { 'init-app':
  command => 'mean init /home/vagrant/myApp',
  require => Exec['meanio'];
}

exec { 'app-dep':
  command => 'cd /home/vagrant/myApp && npm install',
  require => Exec['init-app'];
}

exec { 'app-module':
  command => 'mean package myModule',
  require => Exec['app-dep'];
}

exec { 'grunt':
  command => 'grunt',
  require => Exec['app-module'];
}

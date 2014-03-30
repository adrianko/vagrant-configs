Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

exec { 'update':
  command => 'apt-get update --fix-missing';
}

package { ['apache2', 'php5', 'mysql-server', 'mysql-client', 'git']:
  ensure => present,
  require => Exec['update'];
}

package { 'libapache2-mod-php5':
  ensure => present,
  require [ Package['apache2', Package['php5'] ];
}

package { 'php5-mysql':
  ensure => present,
  require => [ Package['mysql-server'], Package['php5'] ];
}

service { 'apache2':
  ensure => running,
  require => Package['libapache2-mod-php5'];
}

service {'mysql':
  ensure => running,
  require => Package['php5-mysql'];
}

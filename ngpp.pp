Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

exec { 'update':
  command => 'apt-get update --fix-missing';
}

package { ['nginx', 'gunicorn', 'python', 'postgresql', 'git']:
  ensure => present,
  require => Exec['update'];
}

package { 'python-psycopg2':
  ensure => present,
  require => [ Package['python'], Package['postgresql'] ];
}

service { 'nginx':
  ensure => running,
  require => Package['nginx'];
}

service { 'gunicorn':
  ensure => running,
  require => Package['gunicorn'];
}

service { 'postgres':
  ensure => running,
  require => Package['postgresql'];
}

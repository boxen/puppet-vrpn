# Public: Install VRPN library (and server)
#
# Examples
#
#   include vrpn
#
# or:
#
#   class { 'vrpn':
#     config => "vrpn_3DConnexion_Navigator spacenav\nvrpn_Tracker_NULL Tracker0 2 2.0\n"
#   }
class vrpn ($config = "vrpn_Tracker_NULL Tracker0 2 2.0\n", $defaultPort = false) {
  class { 'vrpn::config':
    defaultPort => $defaultPort
  }
  require homebrew

  file { [
    $vrpn::config::logdir,
    $vrpn::config::configdir
  ]:
    ensure => directory,
  }

  package { 'vrpn':
    ensure          => 'present',
    install_options => [
      '--clients'
    ],
    notify          => Service['vrpn_server']
  }

  file { $vrpn::config::configfile:
    content => $config,
    notify  => Service['vrpn_server']
  }

  file { '/Library/LaunchDaemons/vrpn_server.plist':
    content => template('vrpn/vrpn_server.plist.erb'),
    group   => 'wheel',
    notify  => Service['vrpn_server'],
    owner   => 'root'
  }

  service { 'vrpn_server':
    ensure  => running,
    require => File[$vrpn::config::configfile]
  }
}

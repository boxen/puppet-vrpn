# Public: Install VRPN library (and server)
#
# Examples
#
#   include vrpn
#
# or:
#
#   class { 'vrpn':
#     config => 'vrpn_3DConnexion_Navigator spacenav\nvrpn_Tracker_DTrack DTrack 5000 0.5 3 2 2 3 0 4 1'
#   }
class vrpn ($config = 'vrpn_3DConnexion_Navigator spacenav') {
  require vrpn::config
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

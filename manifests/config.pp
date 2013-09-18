# Internal: Configuration settings for VRPN
#
# Examples:
#
#   include vrpn::config
class vrpn::config ($defaultPort = false) {
  require boxen::config

  $executable  = "${boxen::config::homebrewdir}/bin/vrpn_server"
  $logdir      = "${boxen::config::logdir}/vrpn"
  $configdir   = "${boxen::config::configdir}/vrpn"
  $configfile  = "${configdir}/vrpn.cfg"
  if $defaultPort == true {
    $port      = 3883
  }
  else {
    $port      = 13883
  }
}

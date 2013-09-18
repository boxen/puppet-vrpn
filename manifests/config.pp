# Internal: Configuration settings for VRPN
#
# Examples:
#
#   include vrpn::config
class vrpn::config {
  require boxen::config

  $executable  = "${boxen::config::homebrewdir}/bin/vrpn_server"
  $logdir      = "${boxen::config::logdir}/vrpn"
  $configdir   = "${boxen::config::configdir}/vrpn"
  $configfile  = "${configdir}/vrpn.cfg"
  $port        = 13883
}

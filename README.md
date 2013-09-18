# VRPN Puppet Module for Boxen

This installs [VRPN](http://www.cs.unc.edu/Research/vrpn/) via Homebrew and optionally runs a VRPN server as a daemon.

[![Build Status](https://travis-ci.org/bilke/puppet-vrpn.png?branch=master)](https://travis-ci.org/bilke/puppet-vrpn)

## Usage

```puppet
include vrpn
```

This will install VRPN and setup the vrpn server on port 13883 with the default NULL-tracker device. You can test if the server is running with:

```bash
vrpn_print_devices Tracker0@localhost:13883
```

----

```puppet
class { 'vrpn':
  config      => "vrpn_3DConnexion_Navigator spacenav\nvrpn_Tracker_NULL Tracker0 2 2.0\n",
  defaultPort => true
}
```

Same as above but the content of `config` will be written to a *vrpn.cfg* which is used by the vrpn server and the server will listen on the default port (3883).

## Required Puppet Modules

* `boxen`
* `homebrew`
* `repository`


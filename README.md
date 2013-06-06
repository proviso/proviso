# Proviso
[![Build
Status](https://travis-ci.org/proviso/proviso.png)](https://travis-ci.org/proviso/proviso)

Proviso aims to be an SDK+API to provision platform-independent local
VMs for Drupal development. The project seeks to develop an extensible
framework and ecosystem for developers to achieve parity with multiple
production deployment targets, as well as a one-click installer control
panel that makes advanced local development accessible.

For more information, please check the [Wiki](https://github.com/proviso/proviso/wiki).

Features
--------

- `vagrant-vbguest`: Ensures that [`Virtual Guest
Additions`][vbox-guest-additions] are in sync.

Usage
-----

    git clone https://github.com/proviso/proviso.git && cd proviso
    rake install_plugins
    vagrant up

<!-- Links -->
   [vbox-guest-additions]: http://www.virtualbox.org/manual/ch04.html

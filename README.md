# Proviso
[![Build
Status](https://travis-ci.org/proviso/proviso.png)](https://travis-ci.org/proviso/proviso)

Proviso aims to be an SDK+API to provision platform-independent local
VMs for Drupal development. The project seeks to develop an extensible
framework and ecosystem for developers to achieve parity with multiple
production deployment targets, as well as a one-click installer control
panel that makes advanced local development accessible.

Features
--------

- Package manager (apt) caching between VM destroys via
[`vagrant-cachier`][vagrant-cachier].

Usage
-----

    git clone https://github.com/proviso/proviso.git && cd proviso
    rake install_plugins
    vagrant up

<!-- Links -->
   [vagrant-cachier]: https://github.com/fgrehm/vagrant-cachier#readme

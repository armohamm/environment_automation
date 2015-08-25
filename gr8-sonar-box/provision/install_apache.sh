#!/usr/bin/env bash

# Installing apache
# host ~/vagrant with link to /var/www
apt-get update
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi		

#!/usr/bin/env bash

VERSION=9.1

sudo apt-get install postgresql-$VERSION postgresql-contrib -y

# create SONAR user and data base
sudo -u postgres psql -f /vagrant/provision/sonar/sonar.sql

echo "Configuring postgreSQL $VERSION to listen for remote connections..."
CONF=/etc/postgresql/$VERSION/main/postgresql.conf
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" $CONF

echo "Configuring postgreSQL $VERSION to accept remote connections (from any host)..."
cat >> /etc/postgresql/$VERSION/main/pg_hba.conf <<EOF
# Accept all IPv4 connections - CHANGE THIS!!!
host    all         all         0.0.0.0/0             md5
EOF

echo "restarting postgresql..."
sudo /etc/init.d/postgresql restart
echo "postgresql is running!"

# Enabling remote connections (http://www.thegeekstuff.com/2014/02/enable-remote-postgresql-connection/):
#
# 1) enable client authentication
#    $ vi /etc/postgresql/[version-number]/main/pg_hba.conf and add:
#    host all all 0.0.0.0/0 password
#
#    note: it will allow any client IP range, you also can specify a range like: 192.168.101.20/24.
#          http://www.postgresql.org/docs/9.2/static/auth-pg-hba-conf.html

# 2) allow TCP/IP socket (change the listen address)
#    $ vi /etc/postgresql/[version-number]/main/postgresql.conf and change:
#    from listen_address='localhost' to listen_address='*'

# Managing psql service
# sudo /etc/init.d/postgresql start, stop, restart
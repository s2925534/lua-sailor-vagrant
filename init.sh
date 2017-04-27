#!/bin/bash
apt-get update
apt-get upgrade

apt-get -y install git
apt-get -y install apache2
apt-get -y install lua5.2
apt-get -y install luarocks
apt-get -y install mysql-client
apt-get -y install lua-sql-mysql

#Enable Lua
a2enmod lua

sed -i '/\<Directory \/var\/www.*/{n;n;s/None$/All/;}' /etc/apache2/apache2.conf
service apache2 restart

# Install packages
luarocks install sailor

#Create new sailor project
sailor create 'hello-world' /vagrant/sailor
if ! [ -L /var/www/html ]; then
  rm -rf /var/www/html
  ln -fs /vagrant/sailor/hello-world /var/www/html
fi

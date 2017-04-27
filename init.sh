#!/bin/bash
sudo apt-add-repository ppa:ondrej/apache2
apt-get update
apt-get upgrade

apt-get -y install git
apt-get -y install apache2
#apt-get -y install nginx
apt-get -y install lua5.2
apt-get -y install luarocks
apt-get -y install mysql-client
apt-get -y install lua-sql-mysql

#Enable Lua
a2enmod lua										#For apache2 installation only

sed -i '/\<Directory \/var\/www.*/{n;n;s/None$/All/;}' /etc/apache2/apache2.conf	#For apache2 installation only
service apache2 restart 								#For apache2 installation only

#service nginx restart

#Install packages
luarocks install luasql-mysql
luarocks install luafilesystem
luarocks install valua
luarocks install LuaSocket
luarocks install LuaSec
luarocks install LuaSec OPENSSL_LIBDIR=/usr/lib/x86_64-linux-gnu

luarocks install sailor

#Create new sailor project
sailor create 'hello-world' /vagrant/sailor
if ! [ -L /var/www/html ]; then
  rm -rf /var/www/html
  ln -fs /vagrant/sailor/hello-world /var/www/html
fi

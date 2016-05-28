#!/bin/bash

echo "Memulai provisioning"

echo "Update software source"
apt-get update

echo "Install Git"
apt-get install -y git

echo "Install PHP"
apt-get install -y apache2 libapache2-mod-auth-mysql php5-mysql php5 libapache2-mod-php5 php5-mcrypt

echo "Install Composer"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '92102166af5abdb03f49ce52a40591073a7b859a86e8ff13338cf7db58a19f7844fbc0bb79b2773bf30791e935dbd938') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

echo "Install PHP Phalcon"
apt-get install -y software-properties-common
apt-add-repository ppa:phalcon/stable
apt-get update
apt-get install -y php5-phalcon

echo "Selesai provisioning"
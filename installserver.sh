#!/bin/bash

echo "# Alteracao de Fuso Horario (Date)"
echo "America/Sao_Paulo" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

echo "# Instalacao de EasyEngine"
sudo echo -e "[user]\n\tname = AgiusCloud\n\temail = edison@agiuscloud.com" > ~/.gitconfig
wget -qO ee rt.cx/ee && sudo bash ee

echo "# Instalacao de Serviços"
ee stack install --nginx 
ee stack install --php 
ee stack install --php7 
ee stack install --mysql
ee stack install --phpmyadmin
ee stack install --hhvm
ee stack install --redis

echo "# Instalacao do Composer"
cd /usr/src
curl -sS https://getcomposer.org/installer | sudo php
sudo mv composer.phar /usr/bin/composer

echo "# Limpar caches"
ee clean --all

echo "# Restart servicos"
ee stack restart

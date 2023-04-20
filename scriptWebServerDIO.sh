#!/bin/bash
echo "Inicio da Instalacao WebServer Apache:"
echo
echo "Atualizando e instalando pacotes:"
echo

apt-get update
apt-get upgrade -y
echo
echo "Instalando Apache"
echo
apt install  apache2 -y

echo
echo "Instalando Unzip"
echo 

apt install unzip -y

echo
echo "Adquirindo arquivo e descompactando Main.zip"
echo

cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd /tmp/linux-site-dio-main
echo
echo "Movendo arquivos para a pasta /var/www/html/:"
echo
cp * -r /tmp/linux-site-dio-main /var/www/html/
echo "Limpando arquivos Temporarios"
echo
rm -rf main.zip
rm -rf linux-site-dio-main/
ls -l
echo
echo "Reiniciando Apache Web Server"
systemctl restart apache2.service


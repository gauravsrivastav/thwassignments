#!/bin/bash
sudo dnf module reset php -y
sudo dnf module enable php:7.4 -y
sudo yum -y update
sudo dnf install httpd php php-mysqlnd php-gd php-xml mariadb-server mariadb php-mbstring php-json wget -y
sudo  systemctl enable httpd
sudo service httpd restart
wget https://releases.wikimedia.org/mediawiki/1.35/mediawiki-1.35.2.tar.gz
wget https://releases.wikimedia.org/mediawiki/1.35/mediawiki-1.35.2.tar.gz.sig
gpg --verify mediawiki-1.35.2.tar.gz.sig mediawiki-1.35.2.tar.gz
sudo service httpd restart
cd /var/www/html
sudo  tar -zxf /home/ec2-user/mediawiki-1.35.2.tar.gz
sudo ln -s mediawiki-1.35.2/ mediawiki
sudo  chown -R apache:apache /var/www/html/mediawiki-1.35.2
getenforce
sudo restorecon -FR /var/www/html/mediawiki-1.35.2 && sudo  restorecon -FR /var/www/html/mediawiki
sudo setsebool -P httpd_can_network_connect=1
sudo sed -i 's/index.html/index.html index.html.var index.php/g' /etc/httpd/conf/httpd.conf
sudo service httpd restart

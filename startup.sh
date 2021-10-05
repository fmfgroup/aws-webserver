#!/bin/bash -xe

sudo yum install -y httpd httpd-tools mod_ssl mod_php
sudo systemctl enable httpd 
sudo systemctl start httpd 

sudo yum remove -y php
sudo amazon-linux-extras enable php7.4
sudo yum clean metadata
sudo yum install -y php php-{pear,cgi,common,curl,mbstring,gd,mysqlnd,gettext,bcmath,json,xml,fpm,intl,zip,cli,pdo}
sudo yum install -y php-sodium

sudo yum install -y ruby
sudo yum install -y wget

sudo yum erase codedeploy-agent -y

sudo yum install  -y https://aws-codedeploy-eu-south-1.s3.eu-south-1.amazonaws.com/latest/codedeploy-agent.noarch.rpm
sudo systemctl enable codedeploy-agent
sudo service codedeploy-agent start

sudo mkdir /etc/httpd/sites-enabled

#sudo rm -f /etc/httpd/conf/httpd.conf
#sudo mv /home/aws-webserver/httpd.conf /etc/httpd/conf/httpd.conf
echo 'IncludeOptional /etc/httpd/sites-enabled/*.conf' | sudo tee -a /etc/httpd/conf/httpd.conf

sudo touch /var/www/html/index.php
echo '<?php phpinfo(); ?>' | sudo tee -a /var/www/html/index.php

sudo service httpd restart






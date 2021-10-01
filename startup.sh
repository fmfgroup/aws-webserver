#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

sudo yum install -y httpd httpd-tools mod_ssl 
sudo systemctl enable httpd 
sudo systemctl start httpd 
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum-config-manager --enable remi-php80
sudo yum install -y php80

sudo yum install -y ruby
sudo yum install -y wget

sudo yum erase codedeploy-agent -y

sudo yum install  -y https://aws-codedeploy-eu-south-1.s3.eu-south-1.amazonaws.com/latest/codedeploy-agent.noarch.rpm
sudo systemctl enable codedeploy-agent
sudo service codedeploy-agent start

sudo mkdir /etc/httpd/sites-enabled







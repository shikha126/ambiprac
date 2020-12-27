#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd.service
systemctl enable httpd.service
echo "Hi Friend--- public EC2 by ambi part !!!! : $(hostname -f)" > /var/www/html/index.html
                


                
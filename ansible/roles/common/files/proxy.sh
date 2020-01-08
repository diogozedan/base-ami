#!/bin/bash
sudo su - 

sudo echo HTTPS_PROXY=172.18.XXX.XX:18717 >> /etc/ecs/ecs.config
sudo echo HTTP_PROXY=172.18.XXX.XX:18717 >> /etc/ecs/ecs.config
sudo echo NO_PROXY=localhost,127.0.0.1,169.254.169.254,,/var/run/docker.sock,elb.amazonaws.com >> /etc/ecs/ecs.config

sudo echo env HTTP_PROXY=172.18.XXX.XX:18717 >> /etc/init/ecs.override
sudo echo env HTTPS_PROXY=172.18.XXX.XX:18717 >> /etc/init/ecs.override 
sudo echo env NO_PROXY=localhost,127.0.0.1,169.254.169.254,/var/run/docker.sock,elb.amazonaws.com >> /etc/init/ecs.override

sudo echo export HTTP_PROXY=172.18.XXX.XX:18717 >> /etc/sysconfig/docker
sudo echo export HTTPS_PROXY=172.18.XXX.XX:18717 >> /etc/sysconfig/docker
sudo echo export NO_PROXY=localhost,127.0.0.1,169.254.169.254,/var/run/docker.sock,elb.amazonaws.com >> /etc/sysconfig/docker

sudo echo HTTPS_PROXY=172.18.XXX.XX:18717 > /etc/awslogs/proxy.conf
sudo echo HTTP_PROXY=172.18.XXX.XX:18717 >> /etc/awslogs/proxy.conf
sudo echo NO_PROXY=localhost,127.0.0.1,169.254.169.254,/var/run/docker.sock,elb.amazonaws.com >> /etc/awslogs/proxy.conf

#!/bin/bash

# update
apt-get update

# samba install
apt-get install -y samba
apt-get install -y samba-common-bin

# pip3 install
apt-get install -y python3-pip

# virtualenvwrapper install for python3
pip3 install virtualenvwrapper

# make development folder that will be visible in windows explorer
mkdir /home/vagrant/development
chown vagrant /home/vagrant/development
chgrp vagrant /home/vagrant/development

# configure samba
echo "[dev]" >> /etc/samba/smb.conf
echo "path=/home/vagrant/development" >> /etc/samba/smb.conf
echo "read only = no" >> /etc/samba/smb.conf
echo "writeable = yes" >> /etc/samba/smb.conf
echo "browseable = yes" >> /etc/samba/smb.conf
echo "guest ok = yes" >> /etc/samba/smb.conf
echo "create mask = 0755" >> /etc/samba/smb.conf
echo "directory mask = 0755" >> /etc/samba/smb.conf

# configure virtual env for python3 by adding these lines to .profile
echo "export WORKON_HOME=/home/vagrant/~envs" >> /home/vagrant/.profile
echo "export PROJECT_HOME=/home/vagrant/development" >> /home/vagrant/.profile
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> /home/vagrant/.profile
echo "export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv" >> /home/vagrant/.profile
echo "source /usr/local/bin/virtualenvwrapper.sh" >> /home/vagrant/.profile

# run .profile
source /home/vagrant/.profile





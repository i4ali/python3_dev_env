#!/bin/bash


# enable password authentication
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service ssh restart

# update
apt-get update

# samba install
apt-get install -y samba
apt-get install -y samba-common-bin

# pip3 install
apt-get install -y python3-pip

# virtualenvwrapper install for python3
pip3 install virtualenvwrapper

# # make development folder that will allow host OS to host projects natively
mkdir /vagrant/development


# make a remote virtual env folder to allow guest OS to create run environments natively
mkdir /home/vagrant/~envs
chown vagrant /home/vagrant/~envs
chgrp vagrant /home/vagrant/~envs
chmod 777 /home/vagrant/~envs


# # configure samba
# ## create development folder access to windows
# echo "[dev]" >> /etc/samba/smb.conf
# echo -e "\tpath = /home/vagrant/development" >> /etc/samba/smb.conf
# echo -e "\tread only = no" >> /etc/samba/smb.conf
# echo -e "\twriteable = yes" >> /etc/samba/smb.conf
# echo -e "\tpublic = yes" >> /etc/samba/smb.conf
# echo -e "\tbrowseable = yes" >> /etc/samba/smb.conf
# echo -e "\tguest ok = yes" >> /etc/samba/smb.conf
# echo -e "\tcreate mask = 0755" >> /etc/samba/smb.conf
# echo -e "\tdirectory mask = 0755" >> /etc/samba/smb.conf

# ## create home/vagrant folder access to windows 
#echo "[venv]" >> /etc/samba/smb.conf
#echo -e "\tpath = /home/vagrant/~envs" >> /etc/samba/smb.conf
#echo -e "\tread only = no" >> /etc/samba/smb.conf
#echo -e "\twriteable = yes" >> /etc/samba/smb.conf
#echo -e "\tpublic = yes" >> /etc/samba/smb.conf
#echo -e "\tbrowseable = yes" >> /etc/samba/smb.conf
#echo -e "\tguest ok = yes" >> /etc/samba/smb.conf
#echo -e "\tcreate mask = 0777" >> /etc/samba/smb.conf
#echo -e "\tdirectory mask = 0777" >> /etc/samba/smb.conf

#service smbd restart

# configure virtual env for python3 by adding these lines to .profile
echo "export WORKON_HOME=/home/vagrant/~envs" >> /home/vagrant/.profile
echo "export PROJECT_HOME=/vagrant/development" >> /home/vagrant/.profile
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> /home/vagrant/.profile
echo "export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv" >> /home/vagrant/.profile
echo "source /usr/local/bin/virtualenvwrapper.sh" >> /home/vagrant/.profile

# run .profile
source /home/vagrant/.profile






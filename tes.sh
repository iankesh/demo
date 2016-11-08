#!/bin/bash
echo "Welcome"
echo "Installing python-pip"
apt-get install -y python-pip
echo "installing pip aws-cli"
pip install awscli
sudo apt-get -y update && sudo apt-get -y upgrade
apt-get install -y unzip
echo "downloading awscli bundle"
wget https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
echo "unzipping"
unzip awscli-bundle.zip
echo "set path"
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
echo "configuring aws"
aws configure
echo "Creating key pair"
aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > /root/MyKeyPair.pem
echo "giving permission to my key"
chmod 400 /root/MyKeyPair.pem
echo "installing virtualbox"
sudo apt-get update && sudo apt-get install -y dkms virtualbox virtualbox-guest-additions-iso
echo "downloading and installing vagrant"
wget https://releases.hashicorp.com/vagrant/1.8.6/vagrant_1.8.6_x86_64.deb
dpkg -i vagrant_1.8.6_x86_64.deb
echo "installing vagrant plugins"
vagrant plugin install vagrant-aws
vagrant plugin install vagrant-share
vagrant plugin install vagrant-vbguest
echo "installing git"
apt-get install -y git
echo "adding boxes"
vagrant box add dummy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box

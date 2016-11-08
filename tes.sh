#!/bin/bash
echo "Welcome"
echo "Installing python-pip"
apt-get install -y python-pip
echo "installing pip aws-cli"
pip install -y awscli
sudo apt-get -y update && sudo apt-get -y upgrade
apt-get install -y unzip
echo "downloading awscli bundle"
wget https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
echo "unzipping"
unzip awscli-bundle.zip
echo "set path"
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
echo "Creating key pair"
aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem
echo "giving permission to my key"
chmod 400 MyKeyPair.pem

#!/bin/bash

set -e

echo "Running initial upgrade"
sudo apt-get update
sudo apt-get -y dist-upgrade
echo "Finished initial upgrade"
echo "Installing pip"
sudo apt-get install -y -qq build-essential curl git libssl-dev libffi-dev python-dev
curl -s https://bootstrap.pypa.io/get-pip.py | sudo python
echo "Finished installing pip"
echo "Installing Ansible"
sudo pip -q install ansible
echo "Finished installing Ansible"
sudo mkdir /vagrant/ansible
echo "Running provisioning"
ansible-pull -U https://github.com/mcktr/ansible-icinga2.git -d /vagrant/ansible -C dev/development
echo "Finished provisioning"

#!/bin/bash

echo "
 ██████╗ ██████╗ ███╗   ███╗██████╗ ██████╗  ██████╗ 
██╔════╝██╔═══██╗████╗ ████║██╔══██╗██╔══██╗██╔═══██╗
██║     ██║   ██║██╔████╔██║██████╔╝██████╔╝██║   ██║
██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██╔══██╗██║   ██║
╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ██║  ██║╚██████╔╝
 ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝ 
"

# Greet the user
read -sn 1 -p "Welcome! This script will install and set up many open source programs that will be useful in developing Drupal projects. Press any key to continue..."
echo

# Update sources
echo "Updating apt sources..."
sudo apt-get update

# Set virtualbox
echo "Downloading and install Virtualbox..."
sudo apt-get install virtualbox -y

# Setup Vagrant
echo "Downloading and installing Vagrant..."
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3_x86_64.deb
sudo dpkg -i vagrant_1.6.3_x86_64.deb
rm vagrant_1.6.3_x86_64.deb

# Setup web browsers
echo "Downloading and installing web browsers..."
sudo apt-get install chromium-browser -y
# Ask if user wants to install IE9
read -p "Would you like to install IE9 in a virtual machine (large download)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo apt-get install curl unar
  curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | env IEVMS_VERSIONS="9" bash
fi

# Setup Netbeans
sudo apt-get install openjdk-7-jre -y
wget http://download.netbeans.org/netbeans/8.0/final/bundles/netbeans-8.0-php-linux.sh
chmod +x netbeans-8.0-php-linux.sh
read -sn 1 -p "Press any key to continue installing Netbeans, follow the on screen prompts."
bash netbeans-8.0-php-linux.sh

# Setup misc programs
sudo apt-get install gimp inkscape -y



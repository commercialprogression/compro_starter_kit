#!/bin/bash

while :
do

# Clear dat screen
clear

# I want a blank line at the top
echo

# How about some extended ACSII art?
cat<<EOF
  ██████╗ ██████╗ ███╗   ███╗██████╗ ██████╗  ██████╗
 ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██╔══██╗██╔═══██╗
 ██║     ██║   ██║██╔████╔██║██████╔╝██████╔╝██║   ██║
 ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██╔══██╗██║   ██║
 ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ██║  ██║╚██████╔╝
  ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝
EOF

# Spacing!
echo

# Welcome text
cat<<EOF
 Welcome to the compro starter kit. You should probably run these from top to bottom.
EOF

# Spacing!
echo

# My main menu
cat<<EOF
 ==============================
 Options
 ------------------------------
 Please enter your choice:

 Install LAMP Stack (1)
 Install Virtualbox (2)
 Install Chromium   (3)
 Install IE         (4)
 Install Netbeans   (5)
 Install GIMP       (6)
 Install Inkscape   (7)
                    (Q)uit
 ------------------------------
EOF

read -n1 -s
case "$REPLY" in

"1")
echo "Installing LAMP Stack..."

# Update apt
sudo apt-get update

# Install lamp stack packages
sudo apt-get install mysql-server mysql-client apache2 php5 php5-mysql libapache2-mod-php5 php5-gd php-pear php5-dev php5-xdebug make git phpmyadmin -y
sudo sh -c "echo 'xdebug.remote_enable=1' >> /etc/php5/conf.d/xdebug.ini"
sudo sh -c "echo 'xdebug.remote_handler=dbgp' >> /etc/php5/conf.d/xdebug.ini"
sudo sh -c "echo 'xdebug.remote_mode=req' >> /etc/php5/conf.d/xdebug.ini"
sudo sh -c "echo 'xdebug.remote_host=127.0.0.1' >> /etc/php5/conf.d/xdebug.ini"
sudo sh -c "echo 'xdebug.remote_port=9000' >> /etc/php5/conf.d/xdebug.ini"

# Install composer globally
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Drush
composer global require drush/drush:6.*

# Enable rewrite
sudo a2enmod rewrite

# Setup git information
echo -n "Enter your name for git commits: "
read GIT_NAME
echo -n "Enter your email for git commits: "
read GIT_EMAIL
git config --global user.name "'"$GIT_NAME"'"
git config --global user.email $GIT_EMAIL

# Create ssh key
ssh-keygen

# Create repos and htdocs directory.
mkdir $HOME/repos
mkdir $HOME/htdocs

# Set up compro_utils
cd $HOME/repos
git clone https://bitbucket.org/alexfisher/compro_utils.git
cd $HOME/repos/compro_utils
rm -rf .git
cp .compro $HOME/.compro

# Set up compro_config
cd $HOME/repos
git clone https://bitbucket.org/alexfisher/compro_config.git
cd $HOME/repos/compro_config
rm -rf .git
echo "[include]" >> $HOME/.gitconfig
echo "    path = $HOME/repos/compro_config/.gitignore" >> $HOME/.gitconfig
git config --global core.excludesfile $HOME/repos/compro_config/gitignore_global

# Set path
echo "export PATH=\"$HOME/repos/compro_utils/bin:$HOME/.composer/vendor/bin:$PATH\"" >> $HOME/.bashrc

# Restart apache
sudo service apache2 restart

read -sn 1 -p "LAMP Stack successfully installed. Press any key to return to the menu."
;;

"2")
echo "Installing the Virtualboxes..."
sudo apt-get update
sudo apt-get install virtualbox -y
echo
read -sn 1 -p "Virtualbox successfully installed. Press any key to return to the menu."
;;

"3")
echo "Installing Chromium..."
sudo apt-get update
sudo apt-get install chromium-browser -y
echo
read -sn 1 -p "Chromium successfully installed. Press any key to return to the menu."
;;

# IE installation
"4")
while :
do
cat<<EOF
 ==============================
 IE virtual machines
 ------------------------------
 Please select a version to install:

 IE 6       (1)
 IE 7       (2)
 IE 8       (3)
 IE 9       (4)
 IE 10      (5)
 IE 11      (6)
 All of 'em (7)
            (B)ack
 ------------------------------
EOF

read -n1 -s
case "$REPLY" in

"1")
echo "Installing IE6..."
sudo apt-get update
sudo apt-get install curl unar -y
curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | env IEVMS_VERSIONS="6" bash
echo
read -sn 1 -p "IE6 successfully installed. Press any key to return to the menu."
;;

"2")
echo "Installing IE7..."
sudo apt-get update
sudo apt-get install curl unar -y
curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | env IEVMS_VERSIONS="7" bash
echo
read -sn 1 -p "IE7 successfully installed. Press any key to return to the menu."
;;

"3")
echo "Installing IE8..."
sudo apt-get update
sudo apt-get install curl unar -y
curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | env IEVMS_VERSIONS="8" bash
echo
read -sn 1 -p "IE8 successfully installed. Press any key to return to the menu."
;;

"4")
echo "Installing IE9..."
sudo apt-get update
sudo apt-get install curl unar -y
curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | env IEVMS_VERSIONS="9" bash
echo
read -sn 1 -p "IE9 successfully installed. Press any key to return to the menu."
;;

"5")
echo "Installing IE10..."
sudo apt-get update
sudo apt-get install curl unar -y
curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | env IEVMS_VERSIONS="10" bash
echo
read -sn 1 -p "IE10 successfully installed. Press any key to return to the menu."
;;

"6")
echo "Installing IE11..."
sudo apt-get update
sudo apt-get install curl unar -y
curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | env IEVMS_VERSIONS="11" bash
echo
read -sn 1 -p "IE11 successfully installed. Press any key to return to the menu."
;;

"7")
echo "Installing all the things..."
sudo apt-get update
sudo apt-get install curl unar -y
curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | bash
echo
read -sn 1 -p "All the things successfully installed. Press any key to return to the menu."
;;

"B")
break
;;

"b")
break
;;

*)
echo "Don't mess with me."
;;

esac
sleep 1

done
;;

"5")
echo "Installing Netbeans..."
sudo apt-get update
sudo apt-get install openjdk-7-jre -y
wget http://download.netbeans.org/netbeans/8.0.2/final/bundles/netbeans-8.0.2-php-linux.sh
chmod +x netbeans-8.0.2-php-linux.sh
read -sn 1 -p "Press any key to continue installing Netbeans, follow the on screen prompts."
bash netbeans-8.0-php-linux.sh
echo
read -sn 1 -p "Netbeans successfully installed. Press any key to return to the menu."
;;

"6")
echo "Installing GIMP..."
sudo apt-get install gimp -y
echo
read -sn 1 -p "GIMP successfully installed. Press any key to return to the menu."
;;

"7")
echo "Installing Inkscape..."
sudo apt-get install inkscape -y
echo
read -sn 1 -p "Inkscape successfully installed. Press any key to return to the menu."
;;

"Q")
exec bash
;;
"q")
exec bash
;;

* )  echo "Don't mess with me." ;;

esac

sleep 1

done

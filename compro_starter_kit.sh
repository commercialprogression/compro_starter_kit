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
 Welcome to the compro starter kit. Pick yer poison to continue. You should probably run these from top to bottom.  You've been warned. No crying.
EOF

# Spacing!
echo

# My main menu
cat<<EOF
 ==============================
 Options
 ------------------------------
 Please enter your choice:

 Install Virtualbox (1)
 Install Vagrant    (2)
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
echo "Installing the Virtualboxes..."
sudo apt-get update
sudo apt-get install virtualbox -y
echo
read -sn 1 -p "Virtualbox successfully installed. Press any key to return to the menu."
;;

"2")  
echo "Installing Vagrant..."
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3_x86_64.deb
sudo dpkg -i vagrant_1.6.3_x86_64.deb
rm vagrant_1.6.3_x86_64.deb
echo
read -sn 1 -p "Vagrant successfully installed. Press any key to return to the menu."
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
wget http://download.netbeans.org/netbeans/8.0/final/bundles/netbeans-8.0-php-linux.sh
chmod +x netbeans-8.0-php-linux.sh
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

"Q")  exit ;;
"q")  exit ;; 
 * )  echo "Don't mess with me." ;;

esac

sleep 1

done


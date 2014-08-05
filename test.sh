#!/bin/bash

while :
do

# Clear dat screen
clear

# I want a blank line at the top
echo

# How about some ACSII art?
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
                    (Q)uit
 ------------------------------
EOF
  read -n1 -s
  case "$REPLY" in
  "1")  
    echo "Installing the Virtualboxes..."
    sudo apt-get update
    sudo apt-get install virtualbox
  ;;

  "2")  
    echo "Installing Vagrant..." 
    wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3_x86_64.deb
    sudo dpkg -i vagrant_1.6.3_x86_64.deb
    rm vagrant_1.6.3_x86_64.deb
  ;;

  "3")  
    echo "Installing Chromium..."
    sudo apt-get update
    sudo apt-get install chromium-browser 
  ;;

  "Q")  exit                      ;;
  "q")  echo "Case sensitive!!"   ;; 
   * )  echo "Don't mess with me."     ;;
  esac
  sleep 1
done


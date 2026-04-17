#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   	echo "Pon sudo subnormal..." 
   	exit 1
else
#instalando todo

    sudo dnf update
    sudo dnf upgrade
    sudo dnf install fedora-workstation-repositories -y
    sudo dnf config-manager --set-enabled google-chrome -y
    sudo dnf config-manager --set-enabled flathub -y
    sudo dnf install google-chrome-stable -y
    #esto es brave.
    curl -fsS https://dl.brave.com/install.sh | sh
    #esto otro es el Node.Js junto a Homebrew
    curl -o- https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
    brew install node@24
sleep 10
print "eso es todo"


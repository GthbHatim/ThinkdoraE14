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
    brew install node@24 -y
    #arreglando el problema de cpus intel con el throttle
    sudo dnf remove thermald -y
    sudo dnf copr enable abn/throttled
    sudo dnf install -y throttled
    sudo systemctl enable --now throttled
    #lenovo vantage
    sudo dnf install zenity xinput NetworkManager pipewire-pulseaudio
    git clone https://github.com/niizam/vantage.git
    cd vantage
    sudo make install 
    #otras cosas misc.
    sudo dnf install libfftw3-dev libasound2-dev libncursesw5-dev libpulse-dev libtool automake libiniparser-dev libsdl2-2.0-0 libsdl2-dev -y


sleep 10
print "eso es todo"


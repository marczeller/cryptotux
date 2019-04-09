## Clean and simplify 
sudo apt purge apparmor ufw
sudo apt purge cups-daemon whoopsie pulseaudio-utils
sudo apt purge ubuntu-release-upgrader-gtk update-manager update-notifier synaptic leafpad pavucontrol
sudo apt purge fonts-noto-cjk abiword abiword-common gnumeric audacious bluez
sudo apt purge xfburn guvcview sylpheed pidgin simple-scan xpad gnome mpv
sudo apt purge hunspell* pidgin-data humanity-icon-theme gnumeric-common qttranslations5-l10n  libsane1 hplib-data
sudo apt purge apt-transport-https audacious-plugins audacious-plugins-data ffmpegthumbnailer galculator gnome-icon-theme gstreamer1.0-nice gstreamer1.0-plugins-bad gstreamer1.0-plugins-good libabiword-3.0 libmplex2-2.1-0 libfarstream-0.2-5 fcitx-data fcitx-modules
sudo apt purge adwaita-icon-theme cups cups-bsd cups-client cups-common cups-ppdc fonts-noto-color-emoji fonts-tibetan-machine gconf2-common geoclue-2.0 geoip-database gsfonts gucharmap iio-sensor-proxy libgoffice-0.10-10 libgoffice-0.10-10-common libpresage-data libpresage1v5 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-render-util0 lubuntu-gtk-core lxlauncher printer-driver-gutenprint printer-driver-hpcups printer-driver-splix  xfce4-power-manager xfce4-power-manager-data xfce4-power-manager-plugins pulseaudio
sudo apt purge samba-libs

## Install development tools
sudo apt install git python3

## Visual code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code

## Node.js + installing packages locally
sudo apt install curl
curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install -y nodejs
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo "export PATH=~/.npm-global/bin:$PATH" >> ~/.bashrc
rm nodesource_setup.sh
source .bashrc

## Install bitcoin development related tools
sudo add-apt-repository ppa:bitcoin/bitcoin
sudo apt install bitcoind bitcoin-qt
mkdir .bitcoin
cd .bitcoin 
wget https://raw.githubusercontent.com/bitcoin-studio/Bitcoin-Programming-with-BitcoinJS/master/code/bitcoin.conf

# Install Ethereum development nodes
bash <(curl https://get.parity.io -L)
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum
npm install -g ganache-cli

## Install Go environment (tendermint...)
sudo apt-get install -y golang-go
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=$PATH:$GOPATH/bin" >> ~/.bashrc
source ~/.bashrc

# Config choice
echo 'alias update-pkg="sudo apt update && sudo apt upgrade -y "
alias udpate-clean="sudo deborphan -n --find-config | xargs sudo apt-get -y --purge autoremove;	sudo apt-get -y autoclean; sudo apt-get -y clean; rm ~/.bash_history"
alias update-other="bash <(curl https://get.parity.io -L); npm update -g npm"

alias update-all="update-pkg && update-other && update-clean;"' >> .bashrc
npm install -g tldr
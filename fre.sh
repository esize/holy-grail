#!/usr/bin/env bash
wget -qO - 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1> /dev/null
echo "deb [arch=all,$(dpkg --print-architecture) signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list
sudo apt update
sudo apt install just -y
sudo apt install pipx -y
pipx ensurepath
sudo pipx ensurepath --global
PIPX_BIN_DIR = /home/evan/.local/bin
pipx install --include-deps ansible

cd /home/evan/
git clone https://github.com/esize/holy-grail.git /home/evan/holy-grail
cd /home/evan/holy-grail
just install

echo "Now copy the .vault-password file into ~/holy-grail/ansible"


#!/bin/sh

sudo mv -vf  /etc/apt/sources.list /etc/apt/sources.list~
sudo ln -vfs ${PWD}/apt/sources.list /etc/apt/sources.list

sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install `cat paclist` --force-yes

PREV=$PWD
cd ~/
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cd $PREV

for package in ${PWD}/deb/*; do
    sudo dpkg -i ${package}
done

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

for package in ${PWD}/debs/*; do
    sudo dpkg -i ${package}
done

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

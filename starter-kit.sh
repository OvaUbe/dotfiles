#!/bin/sh

sudo mv -vf  /etc/apt/sources.list /etc/apt/sources.list~
sudo ln -vfs ${PWD}/global-configs/etc/apt/sources.list /etc/apt/sources.list
for list in ${PWD}/global-configs/etc/apt/sources.list.d/*; do
    ln -vfs "$list" /etc/apt/sources.list.d/${list##*/}
done

sudo apt-get -y update
sudo apt-get -y dist-upgrade
DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration
sudo apt-get -y install `cat paclist` --force-yes

PREV=$PWD
cd ~/
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -) && exit"
cd $PREV

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

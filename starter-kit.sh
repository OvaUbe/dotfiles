#!/bin/sh

sudo mv -vf  /etc/apt/sources.list /etc/apt/sources.list~
sudo ln -vfs ${PWD}/apt/sources.list /etc/apt/sources.list
for list in ${PWD}/apt/sources.list.d/*; do
    sudo ln -vfs "$list" /etc/apt/sources.list.d/${list##*/}
done

wget http://84.201.137.33/debian/key -O- | sudo apt-key add -
wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | sudo apt-key add -

sudo apt-get -y update
sudo apt-get -y dist-upgrade
DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration
sudo apt-get -y install `cat paclist` --force-yes

PREV=$PWD
cd ~/
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cd $PREV

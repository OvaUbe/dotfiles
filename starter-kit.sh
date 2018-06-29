#!/bin/sh

sudo apt-get install `cat paclist` --force-yes

PREV=$PWD
cd ~/
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cd $PREV

for package in ${PWD}/debs/*; do
    sudo dpkg -i ${package}
done

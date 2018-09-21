#!/bin/sh

mkdir -pv ~/usr/bin
mkdir -pv ~/usr/lib
mkdir -pv ~/usr/share

ln    -vfs ${PWD}/shell/.zshrc              ~/.zshrc
ln    -vfs ${PWD}/shell/.zsh-custom         ~/

ln    -vfs ${PWD}/shell/.profile            ~/.profile

ln    -vfs ${PWD}/tmux/.tmux.conf           ~/.tmux.conf

# Todo: Also add root config
mkdir -pv ~/.vim
ln    -vfs ${PWD}/vim/.vimrc                ~/.vimrc
ln    -vfs ${PWD}/vim/colors                ~/.vim/
ln    -vfs ${PWD}/vim/ftdetect              ~/.vim/
ln    -vfs ${PWD}/vim/ftplugin              ~/.vim/
ln    -vfs ${PWD}/vim/plugin                ~/.vim/
ln    -vfs ${PWD}/vim/syntax                ~/.vim/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -v   ~/.config/

chmod +x   ${PWD}/scripts/*
for script in ${PWD}/scripts/*; do
    sudo ln -vfs "$script" ~/usr/bin/${script##*/}
    sudo chown -v `whoami` ~/usr/bin/${script##*/}
done

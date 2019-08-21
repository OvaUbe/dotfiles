#!/bin/sh

# Initial setup
install_packages=false
help="This is a custom deploy script for initial debian setup.\n"
help="$help Options:\n"
help="$help -i: install packages (disabled by default)\n"
help="$help -s: change shell to \$arg (disabled by default)\n"

# Parse params
OPTIND=1
while getopts ":h?is:" opt; do
	case $opt in
		h)
			echo -e $help
			exit 1
			;;
		i)
			install_packages=true
			;;
		s)
			shell=$OPTARG
			;;
		\?)
			echo "Invalid option: -$OPTARG"
			echo -e $help
			exit 1
			;;
	esac
done

# Action!
if $install_packages; then
	chmod +x ${PWD}/starter-kit.sh
	${PWD}/starter-kit.sh
fi

if ! [ -z ${shell+x} ]; then
	which_shell=`which $shell`
	[ -z $which_shell ] && echo "No such shell: $shell" || chsh -s $which_shell
fi

ln    -vfs ${PWD}/shell/.zshrc              ~/.zshrc

ln    -vfs ${PWD}/shell/.profile            ~/.profile

# Todo: Also add root config
ln    -vfs ${PWD}/vim/.vimrc                ~/.vimrc
ln    -vfs ${PWD}/vim/colors                ~/.vim/
ln    -vfs ${PWD}/vim/ftdetect              ~/.vim/
ln    -vfs ${PWD}/vim/ftplugin              ~/.vim/
ln    -vfs ${PWD}/vim/plugin                ~/.vim/
ln    -vfs ${PWD}/vim/syntax                ~/.vim/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln    -vfs ${PWD}/xmobar/.xmobarrc          ~/.xmobarrc
mkdir -v ~/.xmobar
chmod +x   ${PWD}/xmobar/status-*.sh
for script in ${PWD}/xmobar/status-*.sh; do
    ln -vfs "$script" ~/.xmobar/${script##*/}
done

mkdir -v   ~/.config/

ln    -vfs ${PWD}/bspwm                     ~/.config/
ln    -vfs ${PWD}/sxhkd                     ~/.config/

chmod +x ${PWD}/multihead/*
ln    -vfs ${PWD}/multihead                 ~/.config/

ln    -vfs ${PWD}/look/.icons               ~/.icons
ln    -vfs ${PWD}/look/.themes              ~/.themes
ln    -vfs ${PWD}/look/.gtkrc-2.0           ~/.gtkrc-2.0
ln    -vfs ${PWD}/look/.Xdefaults           ~/.Xdefaults

chmod +x   ${PWD}/scripts/*
for script in ${PWD}/scripts/*; do
    sudo ln -vfs "$script" /bin/${script##*/}
    sudo chown -v `whoami` /bin/${script##*/}
done

mkdir -v ~/scrots

sudo mkdir -pv  /etc/X11/xorg.conf.d
sudo ln    -vfs ${PWD}/X11/*                /etc/X11/xorg.conf.d/
sudo ln    -vfs ${PWD}/X11/.xinitrc         ~/.xinitrc

sudo ln    -vfs ${PWD}/apt/apt.conf.d/*     /etc/apt/apt.conf.d/

sudo ln    -vfs ${PWD}/udev/rules.d/*       /etc/udev/rules.d/
sudo udevadm control --reload-rules

sudo cp -vf ${PWD}/systemd/system/* /lib/systemd/system/
sudo systemctl enable backlight-workaround
sudo systemctl enable NetworkManager

mkdir -pv  ~/.config/systemd/user
sudo ln    -vfs ${PWD}/systemd/* ~/.config/systemd/user/
mkdir -pv  ~/.rdm

mkdir -v ~/.global-state

wget https://farm2.staticflickr.com/1891/29435493827_e1b89552dc_o_d.jpg -O ~/dotfiles/look/wallpaper

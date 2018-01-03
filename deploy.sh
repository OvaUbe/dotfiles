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

mkdir -vp  ~/.vim/colors/
ln    -vfs ${PWD}/vim/.vimrc                ~/.vimrc
ln    -vfs ${PWD}/vim/colors/*              ~/.vim/colors/

sudo mkdir -vp  /root/.vim/colors
sudo ln    -vfs ${PWD}/vim/.vimrc           /root/.vimrc
sudo ln    -vfs ${PWD}/vim/colors/*         /root/.vim/colors/

ln    -vfs ${PWD}/xmonad/.xmobarrc          ~/.xmobarrc

mkdir -v   ~/.config/

ln    -vfs ${PWD}/bspwm                     ~/.config/
ln    -vfs ${PWD}/sxhkd                     ~/.config/

ln    -vfs ${PWD}/look/.icons               ~/.icons
ln    -vfs ${PWD}/look/.themes              ~/.themes
ln    -vfs ${PWD}/look/.gtkrc-2.0           ~/.gtkrc-2.0
ln    -vfs ${PWD}/look/.Xdefaults           ~/.Xdefaults

ln    -vfs ${PWD}/look/Trolltech.conf       ~/.config/Trolltech.conf

chmod +x   ${PWD}/scripts/*
for script in ${PWD}/scripts/*; do
    sudo ln -vfs "$script" /bin/${script##*/}
    sudo chown -v `whoami` /bin/${script##*/}
done

sudo mkdir -pv  /usr/share/sddm/themes
sudo ln    -vfs ${PWD}/sddm/sddm.conf       /etc/sddm.conf
sudo cp    -rfv ${PWD}/sddm/themes/*        /usr/share/sddm/themes/

mkdir -v ~/scrots

sudo mkdir -pv  /etc/X11/xorg.conf.d
sudo ln    -vfs ${PWD}/X11/*                /etc/X11/xorg.conf.d/

sudo ln    -vfs ${PWD}/apt/apt.conf.d/*     /etc/apt/apt.conf.d/

sudo ln    -vfs ${PWD}/udev/rules.d/*       /etc/udev/rules.d/
sudo udevadm control --reload-rules

sudo cp -vf ${PWD}/systemd/system/* /lib/systemd/system/
sudo systemctl enable backlight-workaround
sudo systemctl enable NetworkManager
# Ad-hoc for broken debian sddm service
sudo ln -vfs /lib/systemd/system/sddm.service /etc/systemd/system/

mkdir -v ~/.global-state

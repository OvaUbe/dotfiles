#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

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

stow --verbose --restow local-configs

mkdir -v ~/.global-state
mkdir -v ~/.rdm
mkdir -v ~/scrots

wget https://farm2.staticflickr.com/1891/29435493827_e1b89552dc_o_d.jpg -O ${DIR}/wallpaper

sudo stow --verbose --restow --target / global-configs

sudo systemctl enable backlight-workaround
sudo systemctl enable NetworkManager

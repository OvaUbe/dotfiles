what=${1}
[ -z ${2+x} ] && where=/mnt/usb || where=${2}

sudo mount ${what} ${where} -o umask=000

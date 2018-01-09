#!/bin/bash

esp="/boot"
image_prefix="vmlinuz-"
initrd_prefix="initrd.img-"
boot_options="root=/dev/sda8 resume=/dev/sda6 loglevel=3 rw"

make_entry() {
    version=${1}
    title="linux-${version}"
    file="${esp}/loader/entries/${title}.conf"

    echo "title ${title}" > ${file}
    echo "linux /${image_prefix}${version}" >> ${file}
    echo "initrd /${initrd_prefix}${version}" >> ${file}
    echo "options ${boot_options}" >> ${file}
}

mkdir -vp ${esp}/loader/entries

for image_path in ${esp}/${image_prefix}*; do
    image_file=${image_path##*/}
    version=${image_file#${image_prefix}}
    initrd_file="${initrd_prefix}${version}"
    initrd_path="${esp}/${initrd_file}"

    if [ -e ${initrd_path} ]; then
        echo "Generating for version ${version}"
    else
        echo "Skipping version ${version}: initrd not found"
        continue
    fi

    make_entry ${version}
done

bootctl --path=${esp} update

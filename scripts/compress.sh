#!/bin/bash

exit_failure() {
    echo "${1}"
    exit 1
}

do_compress() {
    ${compressor} ${compress_options} "${1}"
    ${cleanup} "${1}"
}

compress_dir_impl() {
    for entry in "${1}"/*."${extension}"; do
        [[ -f "${entry}" ]] && do_compress "${entry}"
    done
}

recursive_compress_dir_impl() {
    compress_dir_impl "${1}"
    for entry in "${1}"/*; do
        [[ -d "${entry}" ]] && recursive_compress_dir_impl "${entry}"
    done
}

compress() {
    [[ -f "${entry}" ]] && do_compress "${entry}"
    [[ -d "${entry}" ]] && ${compress_dir} "${entry}"
}

cleanup_impl() {
    rm -vf "${1}"
}

dummy_cleanup_impl() {
    true
}


extension=flac
compress_dir=compress_dir_impl
cleanup=dummy_cleanup_impl
compressor=lame
compress_options="-V0 -b320"


OPTIND=1
while getopts "f:r:ce:" opt; do
    case ${opt} in
    f)
        entry="${OPTARG}"
        ;;
    r)
        compress_dir=recursive_compress_dir_impl
        entry="${OPTARG}"
        ;;
    c)
        cleanup=cleanup_impl
        ;;
    e)
        extension="${OPTARG}"
        ;;
    esac
done

[[ -z "${entry}" ]] && exit_failure "Please supply entry"

compress "${entry}"


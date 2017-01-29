#!/bin/bash

exit_failure() {
    echo "${1}"
    exit 1
}

do_compress() {
    ${compressor} ${compress_options} "${1}"
    ${cleanup} "${1}"
}

compress_dir() {
    for entry in "${1}"/*."${extension}"; do
        [[ -f "${entry}" ]] && do_compress "${entry}"
    done
}

simple_compress() {
    [[ -f "${entry}" ]] && do_compress "${entry}"
    [[ -d "${entry}" ]] && compress_dir "${entry}"
}

compress_dir_r() {
    compress_dir "${1}"
    for entry in "${1}"/*; do
        [[ -d "${entry}" ]] && compress_dir_r "${entry}"
    done
}

recursive_compress() {
    [[ -f "${entry}" ]] && do_compress "${entry}"
    [[ -d "${entry}" ]] && compress_dir_r "${entry}"
}

dummy_cleanup() {
    true
}

soft_cleanup() {
    rm -vf "${1}"
}


extension=flac
compress=simple_compress
cleanup=dummy_cleanup
compressor=lame
compress_options="-V0 -b320"


OPTIND=1
while getopts "f:r:ce:" opt; do
    case ${opt} in
    f)
        entry="${OPTARG}"
        ;;
    r)
        compress=recursive_compress
        entry="${OPTARG}"
        ;;
    c)
        cleanup=soft_cleanup
        ;;
    e)
        extension="${OPTARG}"
        ;;
    esac
done

[[ -z "${entry}" ]] && exit_failure "Please supply entry"

${compress} "${entry}"


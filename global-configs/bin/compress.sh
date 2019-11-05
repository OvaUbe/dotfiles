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
    for iter in "${1}"/*."${extension}"; do
        [[ -f "${iter}" ]] && do_compress "${iter}"
    done
}

recursive_compress_dir_impl() {
    compress_dir_impl "${1}"
    for iter in "${1}"/*; do
        [[ -d "${iter}" ]] && recursive_compress_dir_impl "${iter}"
    done
}

compress() {
    [[ -f "${entry}" ]] && do_compress "${entry}"
    [[ -d "${entry}" ]] && ${compress_dir} "${entry}"
    ${purge} "${entry}"
}

cleanup_impl() {
    rm -vf "${1}"
}

dummy_cleanup_impl() {
    true
}

purge_impl() {
    find "${1}" -type f ! -name "*.${artifact_extension}" -delete -print
}

dummy_purge_impl() {
    true
}


extension=flac
artifact_extension=mp3
compress_dir=compress_dir_impl
cleanup=dummy_cleanup_impl
purge=dummy_purge_impl
compressor=lame
compress_options="-V0 -b320"


OPTIND=1
while getopts "f:r:cpe:" opt; do
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
    p)
        purge=purge_impl
        ;;
    e)
        extension="${OPTARG}"
        ;;
    esac
done

[[ -z "${entry}" ]] && exit_failure "Please supply entry"

compress "${entry}"


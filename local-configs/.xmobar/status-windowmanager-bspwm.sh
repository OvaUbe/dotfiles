#! /bin/bash

while read -r line ; do
    wm_infos=""
    IFS=':'
    set -- ${line#?}
    while [ $# -gt 0 ] ; do
        item=$1
        name=${item#?}
        case $item in
            O*)
                # focused occupied desktop
                wm_infos="${wm_infos} <fc=#429942>[${name}]</fc>"
                ;;
            F*)
                # focused free desktop
                wm_infos="${wm_infos} <fc=#429942>${name}</fc>"
                ;;
            U*)
                # focused urgent desktop
                wm_infos="${wm_infos} <fc=#FFFF40><${name}></fc>"
                ;;
            o*)
                # occupied desktop
                wm_infos="${wm_infos} <fc=#37648C>[${name}]</fc>"
                ;;
            f*)
                # free desktop
                wm_infos="${wm_infos} <fc=#A3A3A3>${name}</fc>"
                ;;
            u*)
                # urgent desktop
                wm_infos="${wm_infos} <fc=#FFFFAF><${name}></fc>"
                ;;
        esac
        shift
    done
    printf "%s\n" "$wm_infos"
done

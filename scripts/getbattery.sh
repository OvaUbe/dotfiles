#!/bin/bash

OPTIND=1
while getopts "r:g:b:e:" opt; do
    case $opt in
    r) red=$OPTARG ;;
    g) green=$OPTARG ;;
    b) blue=$OPTARG ;;
    e) end=$OPTARG ;;
    esac
done

choose_battery() {
    acpi --battery | tail -n 1
}

get_charge() {
    charge=`choose_battery | awk '{print $4}' | sed 's/%,\?$//'`
    if [ $charge -ge 15 ]; then
        echo "${green}${charge}%${end}"
    else
        echo "${red}${charge}%${end}"
    fi
}

get_status() {
   charging=`choose_battery | awk '{print $3}' | sed 's/,$//'`
   case $charging in
       "Charging") echo "${green}↑${end}" ;;
       "Full") echo "${green}F${end}" ;;
       "Discharging") echo "${red}↓${end}" ;;
       *) echo "?" ;;
   esac
}

echo -e "${blue}{${end} $(get_charge) $(get_status) ${blue}]${end}"

#!/bin/bash

OPTIND=1
while getopts "b:a:" opt; do
    case $opt in
    b) base=$OPTARG ;;
    a) add=$OPTARG ;;
    esac
done

prefix='/sys/class/backlight'
[ -z $base ] && base=`ls $prefix | head -n1`
prefix=$prefix/$base

min=0
max=`cat $prefix/max_brightness`
cur=`cat $prefix/brightness`

result=$(( ($cur * 100 + $add * $max) / 100 ))
result=$(( $result < $max ? $result : $max ))
result=$(( $result > $min ? $result : $min ))

echo $result > $prefix/brightness

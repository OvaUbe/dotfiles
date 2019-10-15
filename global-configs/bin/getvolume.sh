#!/bin/sh

vol=`amixer sget -D default Master | grep -o -m 1 '[[:digit:]]*%' | tr -d '%'`
level=`expr $vol / 10`

case $level in
  0)  echo '[----------]' ;;
  1)  echo '[|---------]' ;;
  2)  echo '[||--------]' ;;
  3)  echo '[|||-------]' ;;
  4)  echo '[||||------]' ;;
  5)  echo '[|||||-----]' ;;
  6)  echo '[||||||----]' ;;
  7)  echo '[|||||||---]' ;;
  8)  echo '[||||||||--]' ;;
  9)  echo '[|||||||||-]' ;;
  10) echo '[||||||||||]' ;;
  *)  echo '[----!!----]' ;;
esac


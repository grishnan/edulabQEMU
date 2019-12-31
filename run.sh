#!/bin/bash
# Author: grishnan https://github.com/grishnan
# E-mail: grishnan@gmail.com
# License: GNU GENERAL PUBLIC LICENSE Version 3

function check_root_privileges {
  if [ $EUID -ne 0 ]; then
    echo "You must have root privileges"
    echo
    return 1 # non root privileges
  fi
  return 0 # root privileges
}

function print_help {
  echo
  echo "Help:"
  echo
  echo "  1   "
  echo "  h   print this help"
  echo "  q   quit"
  echo 
}

clear
echo "Welcome to edulabQEMU."
while [ 1 ]
do
  echo -e "\033[1mPlease, choose one of the listed options\033[0m:"
  echo
  echo "1. PVB.SCC.DDD.[1W1L][1L][1L]"
  echo "2. Second configuration."
  echo "3. Third configuration."
  echo
  read -p "Your option (h for help): " option

  case $option in
    h) print_help ;;
    1) if check_root_privileges ; then ./startlab; fi ;;
    q) exit 0 ;;
    *) echo -e "\e[31m$option: uknown option\033[0m"; echo ;;
  esac

done


#!/bin/bash
# Author: grishnan https://github.com/grishnan
# E-mail: grishnan@gmail.com
# License: GNU GENERAL PUBLIC LICENSE Version 3

CA=6 # configurations amount

function check_root_privileges {
  if [ $EUID -ne 0 ]; then
    echo -e "\e[31mYou must have root privileges\033[0m"
    echo
    return 1 # non root privileges
  fi
  return 0 # root privileges
}

function print_scheme () {
  case $1 in
    1|3|5) 
      echo
      echo -e "\033[1mCLI-C\033[0m"
      echo -e "     \\"
      echo -e "      br0 — \033[1mSRV\033[0m — WAN"
      echo -e "     /"
      echo -e "\033[1mCLI-P\033[0m"
      echo ;;
    2|4|6)
      echo
      echo -e "\033[1mCLI-C\033[0m — br0 — \033[1mSRV\033[0m — WAN"
      echo ;;
  esac
}

function print_help {
  echo
  echo "Help:"
  echo
  echo "  n   run configuration №n (n - number) "
  echo "  h   print this help"
  echo "  q   quit"
  echo 
}

function startlab {
  read -p "Run this configuration? (y/n): " answer
  case $answer in
    y|Y) ./startlab $1; exit 0 ;;
    *) echo ;;
  esac
}

clear # screen

echo "Welcome to edulabQEMU."
while [ 1 ]
do
  echo -e "\033[1mPlease, choose one of the listed options\033[0m:"
  echo
  echo "1. Private virtual bridge. Only debian. Access to WAN via server. Two clients."
  echo "2. Private virtual bridge. Only debian. Access to WAN via server. One client."
  echo "3. Private virtual bridge. Only windows. Access to WAN via server (GUI). Two clients."
  echo "4. Private virtual bridge. Only windows. Access to WAN via server (GUI). One client."
  echo "5. Private virtual bridge. Only windows. Access to WAN via server (Core). Two clients."
  echo "6. Private virtual bridge. Only windows. Access to WAN via server (Core). One client."
  echo
  read -p "Your option (h for help): " option

  if [[ $(seq $CA) =~ (^|[[:space:]])$option($|[[:space:]]) ]]; then
    if check_root_privileges; then print_scheme $option; startlab $option; fi
  else
    case $option in
      h) print_help ;;
      q) exit 0 ;;
      *) echo -e "\e[31m$option: unknown option\033[0m"; echo ;;
    esac
  fi
done

#!/bin/bash
# Author: grishnan https://github.com/grishnan
# E-mail: grishnan@gmail.com
# License: GNU GENERAL PUBLIC LICENSE Version 3

mdir=.machines # machines directory
CA=9           # configurations amount

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
    1|3|5|7|9) 
      echo
      echo -e "\033[1mCLI-C\033[0m"
      echo -e "     \\"
      echo -e "\033[1mSRV\033[0m — br0 — \033[1mRTR\033[0m — WAN"
      echo -e "     /"
      echo -e "\033[1mCLI-P\033[0m"
      echo ;;
    2|4|6|8)
      echo
      echo -e "  \033[1mSRV\033[0m"
      echo -e "     \\"
      echo -e "      br0 — \033[1mRTR\033[0m — WAN"
      echo -e "     /"
      echo -e "  \033[1mCLI-C\033[0m"
      echo ;;
  esac
}

function print_help {
  echo
  echo "Help:"
  echo
  echo "  n   run configuration №n (n - number) "
  echo "  h   print this help"
  echo "  c   clear configuration"
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

function do_clearing {
  rm -f ./$mdir/$1/*.qcow2
  echo -e "\e[34mclearing configuration №$1 completed successfully\033[0m"
  echo
}

function clear_configuration {
  read -p "What configuration do you wanna clear? (type number): " number
  if [[ $(seq $CA) =~ (^|[[:space:]])$number($|[[:space:]]) ]]; then
    read -p "Are you sure? (yes/no): " answer
    case $answer in
      yes) do_clearing $number;;
      y|Y) echo -e "\e[31mPlease, type 'yes'\033[0m"; echo ;;
      *) echo ;;
    esac
  else
    echo -e "\e[31m$option: unknown configuration\033[0m"; echo
  fi
}

clear # screen

echo "Welcome to edulabQEMU."
while [ 1 ]
do
  echo -e "\033[1mPlease, choose one of the listed options\033[0m:"
  echo
  echo "1. Linux: RTR, SRV, CLI-C, CLI-P"
  echo "2. Linux: RTR, SRV, CLI-C"
  echo "3. Linux: RTR; Windows server 2019 GUI: SRV; Windows 10: CLI-C, CLI-P"
  echo "4. Linux: RTR; Windows server 2019 GUI: SRV; Windows 10: CLI-C"
  echo "5. Linux: RTR; Windows server 2019 no GUI: SRV; Windows 10: CLI-C, CLI-P"
  echo "6. Linux: RTR; Windows server 2019 no GUI: SRV; Windows 10: CLI-C"
  echo "7. Linux: RTR, SRV, CLI-C; Windows 7: CLI-P"
  echo "8. Linux: RTR; Windows server 2019 GUI: SRV; Windows 7: CLI-C"
  echo "9. Linux: RTR; Windows server 2012 R2 GUI: SRV; Windows 7: CLI-C, CLI-P"
  echo
  read -p "Your option (h for help): " option

  if [[ $(seq $CA) =~ (^|[[:space:]])$option($|[[:space:]]) ]]; then
    if check_root_privileges; then print_scheme $option; startlab $option; fi
  else
    case $option in
      h) print_help ;;
      q) exit 0 ;;
      c) clear_configuration ;;
      *) echo -e "\e[31m$option: unknown option\033[0m"; echo ;;
    esac
  fi
done

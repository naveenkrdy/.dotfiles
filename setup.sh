#!/usr/bin/env bash
# dot-files
# naveenkrdy (28/12/19)

source ./misc.sh

cd $(dirname "${0}") && echo "Switching to $PWD"

#START
printf '\033[8;60;200t' && clear && sleep 2
press_key

sudo -v
while true; do
    sudo -n true
    sleep 10000
    kill -0 ${$} || exit
done 2>/dev/null &

caffeinate -id &
sleep=${!}

install brew
install git
install vim
install zsh
install macos

kill ${sleep} &>/dev/null

echo "Finished !"
press_key

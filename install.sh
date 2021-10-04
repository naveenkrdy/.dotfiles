#!/usr/bin/env bash
# dotFiles
# naveenkrdy (28/12/19)

cd $(dirname "${0}")

#Start
printf '\033[8;60;200t' && clear
sleep 2
read -p "Press [Enter] to start..." -n 1 -r
echo

sudo -v
while true; do
    sudo -n true
    sleep 10000
    kill -0 ${$} || exit
done 2>/dev/null &

caffeinate -id &
sleep_pid=${!}

source ${PWD}/brew/_setup.sh 'install'
source ${PWD}/git/_setup.sh
source ${PWD}/vim/_setup.sh
source ${PWD}/zsh/_setup.sh
source ${PWD}/macos/_setup.sh

kill ${sleep_pid} &>/dev/null

echo
echo "Finished !"
read dummy

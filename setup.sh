#!/usr/bin/env bash
# dotFiles
# naveenkrdy (28/12/19)

export MAIN_DIR="$(dirname "${0}")"
export WALLPAPER="Mountain"
export TERMINAL="Broadcast"
export SCREENSAVER=""

italic="\x1b[3m"
normal="\033[0;0;39m"

function kill_them() {
    for app in "Activity Monitor" \
        "cfprefsd" \
        "Safari" \
        "Disk Utility" \
        "Dock" \
        "Finder" \
        "TextEdit" \
        "System Prefrences" \
        "SystemUIServer"; do
        killall ${app} &>/dev/null
    done
}

#Start
[[ "$(uname)" != "Darwin" ]] && echo "Unsupported OS" && exit 1

printf '\033[8;60;200t' && clear
echo
echo -e "${italic} .dotFiles ${normal}"
echo -e "${italic} $(date -R) ${normal}"
echo
sleep 2
read -p "Press [Enter] to continue..." -n 1 -r
echo

sudo -v
while true; do
    sudo -n true
    sleep 10000
    kill -0 ${$} || exit
done 2>/dev/null &

caffeinate -id &
sleep_pid=${!}

source ${MAIN_DIR}/brew/_setup.sh
source ${MAIN_DIR}/git/_setup.sh
source ${MAIN_DIR}/vim/_setup.sh
source ${MAIN_DIR}/zsh/_setup.sh
source ${MAIN_DIR}/macos/_setup.sh

kill ${sleep_pid} &>/dev/null

echo "Finished !"

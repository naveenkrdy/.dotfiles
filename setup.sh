#!/usr/bin/env bash
# dotFiles
# naveenkrdy (28/12/19)

cd $(dirname "${0}")

TXT_ITL="\x1b[3m"
TXT_NRM="\033[0;0;39m"

function check() {
    if [[ "$(uname)" != "Darwin" ]]; then
        print_error "Unsupported OS"
    fi
}
function kill_all() {
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
printf '\033[8;60;200t' && clear
echo
echo -e "${TXT_ITL} .dotFiles ${TXT_NRM}"
echo -e "${TXT_ITL} $(date -R) ${TXT_NRM}"
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

source ${PWD}/brew/_setup.sh
source ${PWD}/git/_setup.sh
source ${PWD}/vim/_setup.sh
source ${PWD}/zsh/_setup.sh
source ${PWD}/macos/_setup.sh

kill ${sleep_pid} &>/dev/null

echo "Finished !"

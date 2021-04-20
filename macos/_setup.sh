#!/usr/bin/env bash

cd $(dirname "${0}")
echo $PWD

export WALLPAPER="Mountain"
export TERMINAL="Broadcast"
export SCREENSAVER=""

# Kill processes
kill_all

# System Prefrences
source ${PWD}/system_prefs/_general.sh
source ${PWD}/system_prefs/_desktop_and_screensaver.sh
source ${PWD}/system_prefs/_dock.sh
source ${PWD}/system_prefs/_mission_control.sh
source ${PWD}/system_prefs/_siri.sh
source ${PWD}/system_prefs/_spotlight.sh
source ${PWD}/system_prefs/_language_and_region.sh
source ${PWD}/system_prefs/_user_and_groups.sh
source ${PWD}/system_prefs/_accessibility.sh
source ${PWD}/system_prefs/_security_and_privacy.sh
source ${PWD}/system_prefs/_bluetooth.sh
source ${PWD}/system_prefs/_keyboard.sh
source ${PWD}/system_prefs/_mouse.sh
source ${PWD}/system_prefs/_energy_saver.sh
source ${PWD}/system_prefs/_date_and_time.sh
source ${PWD}/system_prefs/_sharing.sh
source ${PWD}/system_prefs/_time_machine.sh
source ${PWD}/system_prefs/_miscellaneous.sh
# Apps Prefrences
source ${PWD}/app_prefs/_finder.sh
source ${PWD}/app_prefs/_terminal.sh
source ${PWD}/app_prefs/_textedit.sh
source ${PWD}/app_prefs/_activity_monitor.sh
source ${PWD}/app_prefs/_safari.sh

# kill processes again to apply
kill_all

#!/usr/bin/env bash

cd $(dirname "${0}")
echo "Switching to $PWD"

function kill_prs() {
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

system_prefs_list=(
    general
    desktop_and_screensaver
    dock
    mission_control
    siri
    spotlight
    language_and_region
    user_and_groups
    accessibility
    security_and_privacy
    bluetooth
    keyboard
    mouse
    energy_saver
    date_and_time
    sharing
    time_machine
    miscellaneous
)
app_prefs_list=(
    finder
    terminal
    textedit
    activity_monitor
    safari
)

kill_prs
for pref in "${system_prefs_list[@]}"; do
    source ${PWD}/system_prefs/_${pref}.sh
done

for pref in "${app_prefs_list[@]}"; do
    source ${PWD}/app_prefs/_${pref}.sh
done
kill_prs

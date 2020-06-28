# Kill processes
kill_them

# System Prefrences
source ${MAIN_DIR}/macos/system_prefs/_general.sh
source ${MAIN_DIR}/macos/system_prefs/_desktop_and_screensaver.sh
source ${MAIN_DIR}/macos/system_prefs/_dock.sh
source ${MAIN_DIR}/macos/system_prefs/_mission_control.sh
source ${MAIN_DIR}/macos/system_prefs/_siri.sh
source ${MAIN_DIR}/macos/system_prefs/_spotlight.sh
source ${MAIN_DIR}/macos/system_prefs/_language_and_region.sh
source ${MAIN_DIR}/macos/system_prefs/_user_and_groups.sh
source ${MAIN_DIR}/macos/system_prefs/_accessibility.sh
source ${MAIN_DIR}/macos/system_prefs/_security_and_privacy.sh
source ${MAIN_DIR}/macos/system_prefs/_bluetooth.sh
source ${MAIN_DIR}/macos/system_prefs/_keyboard.sh
source ${MAIN_DIR}/macos/system_prefs/_mouse.sh
source ${MAIN_DIR}/macos/system_prefs/_energy_saver.sh
source ${MAIN_DIR}/macos/system_prefs/_date_and_time.sh
source ${MAIN_DIR}/macos/system_prefs/_sharing.sh
source ${MAIN_DIR}/macos/system_prefs/_time_machine.sh
source ${MAIN_DIR}/macos/system_prefs/_miscellaneous.sh
# Apps Prefrences
source ${MAIN_DIR}/macos/app_prefs/_finder.sh
source ${MAIN_DIR}/macos/app_prefs/_terminal.sh
source ${MAIN_DIR}/macos/app_prefs/_textedit.sh
source ${MAIN_DIR}/macos/app_prefs/_activity_monitor.sh
source ${MAIN_DIR}/macos/app_prefs/_safari.sh

# kill processes again to apply
kill_them

# Set custom wallpaper for all desktop screens
WALLPAPER="Clouds.jpeg"
WALLPAPER="${PWD}/files/wallpapers/{$WALLPAPER}"
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"${WALLPAPER}\"" &>/dev/null
# osascript -e "tell application \"System Events\" to tell desktop 1 to set picture to \"${WALLPAPER1}\"" &>/dev/null
# osascript -e "tell application \"System Events\" to tell desktop 2 to set picture to \"${WALLPAPER2}\"" &>/dev/null

# Set custom Screen Saver
# SCREENSAVER="Hellos.saver"
# cp -Rf ${PWD}/files/screensavers/{SCREENSAVER} ${HOME}/Library/Screen\ Savers/
# defaults -currentHost write com.apple.screensaver moduleDict "
#   <dict>
#     <key>moduleName</key><string>Shell</string>
#     <key>path</key><string>"${HOME}"/Library/Screen Savers/${SCREENSAVER}.saver</string>
#     <key>type</key><integer>1</integer>
#   </dict>
# "

# Start screensaver after 30 Minutes
# defaults -currentHost write com.apple.screensaver idleTime -int 1800

# Disable show with clock in screensaver (default is on)
# defaults -currentHost write com.apple.screensaver showClock -bool false

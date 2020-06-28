# Set date and time automatically
sudo systemsetup -setusingnetworktime on >/dev/null

# Set time server (Apple Asia)
sudo systemsetup -setnetworktimeserver "time.asia.apple.com" >/dev/null

# Set the timezone; see `systemsetup -listtimezones` for other values
# sudo systemsetup -settimezone "Asia/Seoul" > /dev/null

# Set time zome automatically using current location
sudo defaults write /Library/Preferences/com.apple.timezone.auto.plist Active -bool true

# Set clock to show in weekday, day and hour format
# 24h (HH:mm) or (HH:mm:ss)
# 12h (h:mm a) or (h:mm:ss a)
# custom: d EEE h:mm a
defaults write com.apple.menuextra.clock DateFormat -string "d EEE h:mm a"

# Enable flash of time separators
# defaults write com.apple.menuextra.clock FlashDateSeparators -bool true

# Show clock as digital instead of analog
defaults write com.apple.menuextra.clock IsAnalog -bool false

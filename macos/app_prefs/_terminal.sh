# Supress login prompt upon launch
touch ${HOME}/.hushlogin

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Disable the annoying line marks in terminal
defaults write com.apple.Terminal ShowLineMarks -int 0

# Hide scroll bar in terminal and only show when scrolling
defaults write com.apple.Terminal AppleShowScrollBars -string WhenScrolling

# Enable focus follows mouse for Terminal
# defaults write com.apple.Terminal FocusFollowsMouse -string YES

# Set terminal theme to custom theme `Smyck`
TERMINAL="Tomorrow_Night_Modded.terminal"
cp -vRf ${PWD}/files/terminalcolors${TERMINAL} /tmp/custom.terminal
osascript <<EOD
tell application "Terminal"
	local allOpenedWindows
	local initialOpenedWindows
	local windowID
	set themeName to "custom"
	(* Store the IDs of all the open terminal windows. *)
	set initialOpenedWindows to id of every window
	(* Open the custom theme so that it gets added to the list
	   of available terminal themes (note: this will open two
	   additional terminal windows). *)
	do shell script "open '/tmp/" & themeName & ".terminal'"
	(* Wait a little bit to ensure that the custom theme is added. *)
	delay 1
	(* Set the custom theme as the default terminal theme. *)
	set default settings to settings set themeName
	(* Get the IDs of all the currently opened terminal windows. *)
	set allOpenedWindows to id of every window
	repeat with windowID in allOpenedWindows
		(* Close the additional windows that were opened in order
		   to add the custom theme to the list of terminal themes. *)
		close (every window whose id is windowID)
		exit
	end repeat
end tell
EOD

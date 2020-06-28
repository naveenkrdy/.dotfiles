if [[ ! -d /Library/Developer/CommandLineTools ]]; then
	# Install Xcode cmd tools
	xcode-select --install &>/dev/null
	sleep 2
	osascript &>/dev/null <<EOD
		  tell application "System Events"
	   		 tell process "Install Command Line Developer Tools"
	      		keystroke return
	     	 	click button "Agree" of window "License Agreement"
	    	end tell
	 	 end tell
EOD
	# Wait till installation finishes
	until [[ -d /Library/Developer/CommandLineTools ]]; do
		sleep 1
	done
fi

if [[ ! -x $(command -v brew) ]]; then
	# Install homebrew
	CI=1 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Turn off brew analytics
brew analytics off

# Install using brew file
brew bundle --file="${MAIN_DIR}/brew/brewfile"

# Accept xcode license
sudo xcodebuild -license accept

brew update
brew upgrade
brew cleanup

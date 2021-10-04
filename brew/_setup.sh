#!/usr/bin/env bash

cd $(dirname "${0}")
echo "Switching to $PWD"

if [[ $1 == "install" ]]; then
    if [[ ! -d /Library/Developer/CommandLineTools ]]; then
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
        # Wait till install finishes
        until [[ -d /Library/Developer/CommandLineTools ]]; do
            sleep 1
        done
    fi
    # Install Homebrew
    if [[ ! -x $(command -v brew) ]]; then
        CI=1 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    # Disable homebrew analytics
    brew analytics off
    # Install using brew file
    ln -sFv ${PWD}/brewfile ${HOME}/brewfile
	chflags -H hidden ${HOME}/brewfile
    brew bundle
    # Accept xcode license
    sudo xcodebuild -license accept
    # Cleanup
    brew autoremove
    brew cleanup
else
    ln -sFv ${PWD}/brewfile ${HOME}/brewfile
	chflags -H hidden ${HOME}/brewfile
fi

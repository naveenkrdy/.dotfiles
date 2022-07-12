check_internet() {
    # Check for internet connection
    ping -c 1 "8.8.8.8" >/dev/null && return 0 || echo "Internet connection...failed" && return 1
}

setup_xcmd_tools() {
    local cmd_dir='/Library/Developer/CommandLineTools'
    if [[ ! -d $cmd_dir ]]; then
        check_internet || return 1
        echo "Installing xcode cmd tools."
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
        until [[ -d $cmd_dir ]]; do
            sleep 1
        done
    fi
}

setup_homebrew() {
    setup_xcmd_tools
    if [[ ! -x $(command -v brew) ]]; then
        check_internet || return 1
        echo "Installing homebrew."
        CI=1 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
}

install_brew_pkg() {
    local pkg=$1
    setup_homebrew
    check_internet || return 1
    brew list $pkg || brew install $pkg
}

setup_zsh() {
    local brew_zsh="/usr/local/opt/zsh"
    if [[ $SHELL != $brew_zsh ]]; then
        echo "Setting up zsh."
        install_brew_pkg zsh
        # Add to shells list
        grep -Fxq "$brew_zsh" /private/etc/shells || echo $brew_zsh | sudo tee -a /private/etc/shells
        # Change default shell
        chsh -s $brew_zsh
    fi
}

install() {
    local target=$1
    source ${PWD}/${target}/_setup.sh
}

link() {
    local src=$1 dst=$2
    ln -sFv $src $dst
}

press_key() {
    echo
    read -p "Press [Enter] to continue." -n 1 -r
    echo
}

kill_procs() {
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

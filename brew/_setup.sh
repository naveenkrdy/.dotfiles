#!/usr/bin/env bash

source ../misc.sh

cd $(dirname "${0}") && echo "Switching to $PWD"

setup_homebrew

# Disable brew analytics
brew analytics off

# Install from brewfile
link "${PWD}/brewfile" "${HOME}/brewfile"
chflags -H hidden ${HOME}/brewfile
brew bundle

# Accept xcode license
sudo xcodebuild -license accept

# Cleanup
brew autoremove
brew cleanup --prune=all

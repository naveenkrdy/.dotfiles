# Make ~/Library folder visible
chflags nohidden ${HOME}/Library && xattr -d com.apple.FinderInfo ${HOME}/Library

# Enable show path bar in finder
defaults write com.apple.finder ShowPathbar -bool true

# Enable show status bar in finder
defaults write com.apple.finder ShowStatusBar -bool true

# Enable show all filename extensions in finder
# defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disabling the warning when changing a file extension in finder
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Enable keep folders on top when sorting by name in finder
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Enable when performing a search, search the current folder by default in finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable Use tabs always
# defaults write NSGlobalDomain AppleWindowTabbingMode -string "always"

# Changing default Finder Location to Home Folder
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Don't show recent tags
defaults write com.apple.finder ShowRecentTags -bool false

# Enable show icons for hard drives, servers, and removable media on the desktop
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Enable automatically open a new Finder window when a volume is mounted
# defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
# defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Enable use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Use full POSIX path as window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Disable all animations
# defaults write com.apple.finder DisableAllAnimations -bool true

# Expand the following File Info panes: 'General', 'Open with', and 'Sharing & Permissions' by default
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

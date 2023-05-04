# ====================
#
# Base
#
# ====================

# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Avoid generating .DS_Store
defaults write com.apple.desktopservices DSDontWriteNetworkStores -boolean true
defaults write com.apple.desktopservices DSDontWriteUSBStores -boolean true

# ====================
#
# Dock
#
# ====================

# Disable animation at application launch
defaults write com.apple.dock launchanim -bool false

# ====================
#
# Finder
#
# ====================

# Disable animation
defaults write com.apple.finder DisableAllAnimations -bool true

# Show full path in Finder title bar
defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show files with all extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display the status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Display the path bar
defaults write com.apple.finder ShowPathbar -bool true

# ====================
#
# SystemUIServer
#
# ====================

# Display date, day, and time in the menu bar
defaults write com.apple.menuextra.clock DateFormat -string 'EEE d MMM HH:mm'

# Display battery level in the menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Set screenshot save format to PNG
defaults write com.apple.screencapture type -string "png"

# change screenshot save location
if [[ ! -d "~/ScreenShots" ]]; then
    mkdir -p "~/ScreenShots"
fi
defaults write com.apple.screencapture location -string "~/ScreenShots"

for app in "Dock" \
	"Finder" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done
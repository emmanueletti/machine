#!/bin/bash

# Set up host machine
echo "🚀 Setting up host machine"

# Install Xcode Command Line Tools
echo "🛠 Installing Xcode Command Line Tools"
xcode-select --install

# Set zsh as the default shell
echo "🐚 Setting zsh as the default shell"
chsh -s $(which zsh)

# Move dotfiles to home directory
echo "📂 Moving dotfiles to home directory"
cp ./dotfiles/.* ~/

# Install Homebrew
echo "🍺 Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update

# Install Homebrew packages
echo "🍺 Installing Homebrew packages"
brew install trash
brew install tldr
brew install fzf
yes | $(brew --prefix)/opt/fzf/install
brew install hashicorp/tap/hashicorp-vagrant
brew install powerlevel10k
brew install zsh-syntax-highlighting

# Install Homebrew Cask
echo "🍺 Installing Homebrew casks"
# dev tools
brew install --cask iterm2
brew install --cask virtualbox
brew install --cask visual-studio-code
brew install --cask brave-browser
brew install --cask bruno
brew install --cask tableplus
brew install --cask dash
brew install --cask devutils
# personal tools
brew install --cask raycast
brew install --cask dropbox
brew install --cask loom
brew install --cask whatsapp
brew install --cask 1password
brew install --cask obsidian
brew install --cask slack
brew install --cask spotify
brew install --cask zoom
brew install --cask hyperkey
brew install --cask ogdesign-eagle
brew install --cask meetingbar
brew install --cask clocker
brew install --cask caffeine
brew install --cask appcleaner
brew install --cask bartender
brew install --cask discord
brew install --cask logi-options-plus
brew install --cask logitune
brew install --cask malwarebytes
brew install --cask monitorcontrol
brew install --cask raindropio
brew install --cask protonvpn
brew install --cask vlc

# Install Homebrew fonts
echo "🍺 Installing Homebrew fonts"
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-fira-code-nerd-font
brew install --cask font-jetbrains-mono
brew install --cask font-jetbrains-mono-nerd-font

# Set Mac settings
# https://macos-defaults.com/
# https://github.com/mathiasbynens/dotfiles/blob/main/.macos
# https://github.com/mathiasbynens/dotfiles/blob/main/.macos
echo "🖥 Setting Mac settings"

HOSTNAME="emmanueletti"

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'
# GENERAL
# Set computer name to $HOSTNAME (as done via System Preferences → Sharing)
sudo scutil --set ComputerName $HOSTNAME
sudo scutil --set HostName $HOSTNAME
sudo scutil --set LocalHostName $HOSTNAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $HOSTNAME
# Show IP address, hostname, OS version when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "
# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true"
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM h:mm a\""
defaults write com.apple.finder WarnOnEmptyTrash -bool true
# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
echo " Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# TRACKPAD
# Enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# Enable secondary click
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# DOCK
defaults write com.apple.dock "autohide" -bool "true" && killall Dock
defaults write com.apple.dock "orientation" -string "left" && killall Dock

# FINDER
defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder
defaults write com.apple.finder ShowStatusBar -bool true
# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Set Home as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false
# Bottom left screen hot corner → Put display to sleep
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0

echo "✨ Setup completed successfully"
echo "Restart shell or run 'exec $SHELL' to see changes"
echo "May have to run 'p10k configure' if prompt does not change automatically"
echo "Manually install:"
echo "- Ruby on Mac (if wanted)"
echo "- Hemingway Editor 3"
echo "- JPEGmini"
echo "- Spotica Menu"
echo "✨ Restart computer to see all changes"

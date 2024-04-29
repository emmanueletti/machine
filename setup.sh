#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Set up host machine
echo "🚀 Setting up host machine"

# Install Xcode Command Line Tools
echo "🛠 Installing Xcode Command Line Tools"
xcode-select --install

# Set zsh as the default shell
echo "🐚 Setting zsh as the default shell"
chsh -s $(which zsh)

# Move dotfiles to home directory
echo "📂 Copying dotfiles to home directory"
find ./dotfiles -name ".*" | xargs -I {} cp -f {} ~/

# Setup git completion
echo "🐙 Setting up git completion"
mkdir -p ~/.zsh
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.zsh/git-completion.bash

# Create project directory
echo "📁 Creating project directory"
mkdir -p ~/projects

# Install Homebrew
echo "🍺 Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update

# Install Homebrew packages
echo "🍺 Installing Homebrew packages"
brew install coreutils curl git
brew install fzf
$(brew --prefix)/opt/fzf/install --all
brew install gh
brew install hashicorp/tap/hashicorp-vagrant
vagrant plugin install vagrant-vbguest
brew install powerlevel10k
brew install tldr
brew install trash
brew install zsh-syntax-highlighting
brew install sqlite
brew install tmux
brew install entr
brew install jq
brew install wget
brew install tree
brew install overmind
brew install bearer/tap/bearer

# Install Homebrew Cask
echo "🍺 Installing Homebrew casks"
# dev tools
brew install --cask google-chrome
brew install --cask bruno
brew install --cask iterm2
brew install --cask tableplus
brew install --cask virtualbox
brew install --cask visual-studio-code
brew install --cask docker
# personal tools
brew install --cask 1password
brew install --cask bartender
brew install --cask caffeine
brew install --cask clocker
brew install --cask discord
brew install --cask dropbox
brew install --cask freedom
brew install --cask hyperkey
brew install --cask logi-options-plus
brew install --cask logitune
brew install --cask malwarebytes
brew install --cask meetingbar
brew install --cask monitorcontrol
brew install --cask obsidian
brew install --cask ogdesign-eagle
brew install --cask protonvpn
brew install --cask raindropio
brew install --cask raycast
brew install --cask slack
brew install --cask spotify
brew install --cask vlc
brew install --cask calibre
brew install --cask adobe-digital-editions
brew install --cask tripmode
brew install --cask notion-calendar
brew install --cask utm

# Install Homebrew fonts
echo "🍺 Installing Homebrew fonts"
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-fira-code-nerd-font
brew install --cask font-jetbrains-mono
brew install --cask font-jetbrains-mono-nerd-font

echo "💻 Setting up web dev env"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf global ruby latest

gem install standardrb
gem install solargraph
gem install rails

# Set Mac settings
# https://macos-defaults.com/
# https://github.com/mathiasbynens/dotfiles/blob/main/.macos

if [[ "$*" == *"--include-mac-settings"* ]]; then
  echo "🖥 Setting Mac settings"

  # Close any open System Preferences panes, to prevent them from overriding
  # settings we’re about to change

  osascript -e 'tell application "System Preferences" to quit'

  # GENERAL

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
  # Disable transparency in the menu bar and elsewhere
  defaults write com.apple.universalaccess reduceTransparency -bool true

  # KEYBOARD
  # Disable press-and-hold for keys in favor of key repeat
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

  # Set a blazingly fast keyboard repeat rate
  defaults write NSGlobalDomain KeyRepeat -int 1
  defaults write NSGlobalDomain InitialKeyRepeat -int 10

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
else
  echo "❌ 🖥 Skipping Mac settings"
  echo "pass '--include-mac-settings' flag if want macos defaults set"
fi

exec $SHELL

echo "✨ Setup completed successfully"
echo "Update iTerm config for changes to font, color, and icons"
echo "Manually install:"
echo "- Hemingway Editor 3"
echo "- JPEGmini"
echo "Settings for Hyperkey app"
echo "- Remap physical key to hyper key: RIGHT OPTION"
echo "- Include shift in hyper key: FALSE"
echo "- Launch on login: TRUE"
echo "Important mac settings to set up"
echo "- Turn off spotlight keyboard shortcut so raycast can do its work"
echo "✨ Restart computer for mac settings to take effect if updated"

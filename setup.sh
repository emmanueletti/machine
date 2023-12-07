#!/bin/bash

# Set up host machine
echo "🚀 Setting up host machine"

# Install Xcode Command Line Tools
echo "🛠 Installing Xcode Command Line Tools"
xcode-select --install

# Set zsh as the default shell
echo "🐚 Setting zsh as the default shell"
chsh -s $(which zsh)

# Install Homebrew
echo "🍺 Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update

# Install Homebrew packages
echo "🍺 Installing Homebrew packages"
brew install trash
brew install tldr
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
echo "🖥 Setting Mac settings"
defaults write com.apple.dock "autohide" -bool "true" && killall Dock
defaults write com.apple.dock "orientation" -string "left" && killall Dock
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "true"
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM h:mm a\""
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"
defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder

# Move dotfiles to home directory
echo "📂 Moving dotfiles to home directory"
cp ./dotfiles/.* ~/

echo "✨ Setup completed successfully"
echo "Restart shell or run 'exec $SHELL' to see changes"
echo "May have to run 'p10k configure' if prompt does not change automatically"
echo "Manually install:"
echo "- Ruby on Mac (if wanted)"
echo "- Hemingway Editor 3"
echo "- JPEGmini"
echo "- Spotica Menu"

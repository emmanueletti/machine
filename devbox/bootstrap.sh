#!/bin/bash

sudo apt-get update
sudo apt-get -y install build-essential

# Install core dev tools
sudo apt-get -y install zsh
sudo apt-get -y zsh-syntax-highlighting
sudo apt-get -y install git
sudo apt-get -y install tmux
sudo apt-get -y install vim
sudo apt-get -y install curl
sudo apt-get -y install jq
sudo apt-get -y entr
sudo apt-get -y gh
sudo apt-get -y sqlite3
sudo apt-get -y rsync

# gh cli
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# Set up a basic web dev env in guest - most projects will be dockerized
# Install dependencies needed to build Ruby
sudo apt-get -y install autoconf
sudo apt-get -y install patch
sudo apt-get -y install build-essential
sudo apt-get -y install rustc
sudo apt-get -y install libssl-dev
sudo apt-get -y install libyaml-dev
sudo apt-get -y install libreadline6-dev
sudo apt-get -y install zlib1g-dev
sudo apt-get -y install libgmp-dev
sudo apt-get -y install libncurses5-dev
sudo apt-get -y install libffi-dev
sudo apt-get -y install libgdbm6
sudo apt-get -y install libgdbm-dev
sudo apt-get -y install libdb-dev
sudo apt-get -y install uuid-dev

# Install NodeJS (Required for Rails)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
source ~/.nvm/nvm.sh
nvm install --lts

# Install chruby
wget https://github.com/postmodern/chruby/releases/download/v0.3.9/chruby-0.3.9.tar.gz
tar -xzvf chruby-0.3.9.tar.gz
cd chruby-0.3.9/
sudo make install

# Install ruby-install
wget https://github.com/postmodern/ruby-install/releases/download/v0.9.3/ruby-install-0.9.3.tar.gz
tar -xzvf ruby-install-0.9.3.tar.gz
cd ruby-install-0.9.3/
sudo make install

ruby-install ruby 3.2.2 --verbose

# Install global tools for web development
gem install bundler
gem install solargraph
gem install standardrb


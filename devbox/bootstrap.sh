#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get -y install build-essential

# Core dev tools

## linux tools
sudo apt-get -y install curl
sudo apt-get -y install entr
sudo apt-get -y install fzf
sudo apt-get -y install git
sudo apt-get -y install jq
sudo apt-get -y install libpq-dev
sudo apt-get -y install rsync
sudo apt-get -y install sqlite3
sudo apt-get -y install tmux
sudo apt-get -y install vim
sudo apt-get -y install wget
sudo apt-get -y install zsh
sudo apt-get -y install zsh-syntax-highlighting

## gh cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt-get -y install gh

## powerlevel10k prompt
if [ ! -d "/home/vagrant/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/vagrant/powerlevel10k
fi

## overmind
if [ ! -f "/usr/local/bin/overmind" ]; then
  curl -Lo overmind-v2.4.0-linux-amd64.gz https://github.com/DarthSim/overmind/releases/download/v2.4.0/overmind-v2.4.0-linux-amd64.gz
  gunzip overmind-v2.4.0-linux-amd64.gzv
  chmod +x overmind-v2.4.0-linux-amd64
  sudo mv overmind-v2.4.0-linux-amd64 /usr/local/bin/overmind
fi

# Set up a minimal web dev env in guest (most projects will be dockerized)

## chruby
if [ ! -d "/home/vagrant/chruby-0.3.9" ]; then
  wget https://github.com/postmodern/chruby/releases/download/v0.3.9/chruby-0.3.9.tar.gz
  tar -xzvf chruby-0.3.9.tar.gz
  cd chruby-0.3.9/
  sudo make install
  cd .. && rm -rf chruby-0.3.9.tar.gz
fi

## ruby-install
if [ ! -d "/home/vagrant/ruby-install-0.9.3" ]; then
  wget https://github.com/postmodern/ruby-install/releases/download/v0.9.3/ruby-install-0.9.3.tar.gz
  tar -xzvf ruby-install-0.9.3.tar.gz
  cd ruby-install-0.9.3/
  sudo make install
  cd .. && rm -rf ruby-install-0.9.3.tar.gz
fi

## ruby
if [ ! -d "/home/vagrant/.rubies/ruby-3.2.2" ]; then
  ruby-install ruby 3.2.2
fi

## node
if [ ! -d "/home/vagrant/.nodenv" ]; then
  curl -fsSL https://github.com/nodenv/nodenv-installer/raw/HEAD/bin/nodenv-installer | bash
  /home/vagrant/.nodenv/bin/nodenv install 20.10.0
fi

## global ruby tools
/home/vagrant/.rubies/ruby-3.2.2/bin/gem update --system
/home/vagrant/.rubies/ruby-3.2.2/bin/gem install bundler
/home/vagrant/.rubies/ruby-3.2.2/bin/gem install solargraph
/home/vagrant/.rubies/ruby-3.2.2/bin/gem install standardrb

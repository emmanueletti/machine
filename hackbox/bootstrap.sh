#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get -y install build-essential

# linux tools
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

# js
curl -fsSL https://bun.sh/install | bash

#! /usr/bin/env bash

set -ex

apt-get update

apt-get install vim \
  vim-gnome \
  wget \
  tmux


snap install rg

wget https://github.com/sharkdp/fd/releases/download/v7.0.0/fd_7.0.0_amd64.deb
sudo dpkg -i fd_7.0.0_amd64.deb

# sudo curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
# sudo chmod +x /usr/local/bin/docker-compose

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

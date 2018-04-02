#! /usr/bin/env bash

set -ex

apt-get update

apt-get install vim \
  vim-gnome \
  wget


snap install rg

wget https://github.com/sharkdp/fd/releases/download/v7.0.0/fd_7.0.0_amd64.deb
sudo dpkg -i fd_7.0.0_amd64.deb

#!/usr/bin/env bash

set -ex

sudo apt-get install curl git mercurial make binutils bison gcc build-essential

echo "installing go"
# use bash/zsh, https://github.com/moovweb/gvm
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source $HOME/.gvm/scripts/gvm

# require go to install v1.5+
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT

gvm install go1.10
gvm use go1.10 --default

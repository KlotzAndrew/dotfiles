#!/usr/bin/env bash

set -ex

xcode-select --install
brew update
brew install mercurial

echo "installing go"
# use bash/zsh, https://github.com/moovweb/gvm
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# require go to install v1.5+
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.5

gvm install go1.7.4
gvm use go1.7.4 --default

echo "installed go"
gvm list


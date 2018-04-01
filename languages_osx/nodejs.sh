#!/usr/bin/env bash

set -ex

# https://github.com/creationix/nvm
git clone https://github.com/creationix/nvm.git ~/.nvm
source $HOME/.nvm/nvm.sh

nvm ls-remote
nvm install v5.12.0
nvm install v7.4.0

nvm alias default v5.12.0
nvm use v5.12.0

echo "node installed"
nvm ls

echo "installing yarn"
brew update
brew install yarn


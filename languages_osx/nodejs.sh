#!/usr/bin/env bash

set -ex

# https://github.com/creationix/nvm
git clone https://github.com/creationix/nvm.git ~/.nvm
# shellcheck disable=SC1090
source "$HOME"/.nvm/nvm.sh

nvm ls-remote
nvm install v8.11.1
nvm install v7.4.0

nvm alias default v8.11.1
nvm use v8.11.1

echo "node installed"
nvm ls

# echo "installing yarn"
# brew update
# brew install yarn


#! /usr/bin/env bash

set -ex

# osx setup...
brew update
brew install shellcheck

# just ~/.puma-dev/ instead of ~/pow/
brew install puma/puma/puma-dev
puma-dev -install
sudo puma-dev -setup

# need ruby for scripting
sh languages/ruby.sh

# editor stuff
sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh`"

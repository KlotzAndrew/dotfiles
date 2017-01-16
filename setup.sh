#! /usr/bin/env bash

set -ex

sudo apt-get update
sudo apt-get install git \
                     zsh \
                     git-core \
                     tmux \
                     vim

# need ruby for scripting
sh languages/ruby.sh

# editor stuff
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh`"

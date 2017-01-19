#! /usr/bin/env bash

set -ex

# need ruby for scripting
sh languages/ruby.sh

# editor stuff
sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh`"


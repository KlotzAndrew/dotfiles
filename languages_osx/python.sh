#!/usr/bin/env bash

set -ex

echo "installing python"

# brew install python --framework
# brew install pip

brew upgrade
brew install pyenv

pyenv install -l

pyenv install 2.7
pyenv install 3.6.2

pyenv versions

#! /usr/bin/env bash

set -ex

git config --global user.name "Andrew Klotz"
git config --global user.email "agc.klotz@gmail.com"

git config --global commit.template $HOME/dotfiles/gitmessage.txt


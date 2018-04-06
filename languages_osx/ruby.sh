#!/usr/bin/env bash

set -ex

# https://github.com/sstephenson/ruby-build/wiki#suggested-build-environment
brew update
brew install openssl libyaml libffi

echo '# installing rvm'
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby

echo '# installing rubies'
rvm install 2.3.3
rvm install 2.4.1
rvm --default use 2.4.1

rvm all do gem install bundler
rvm all do gem install irbtools
rvm all do gem install awesome_print
rvm all do gem install rubocop
rvm all do gem install reek
#!/usr/bin/env bash

set -ex

echo '# installing ruby deps'
# https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
sudo apt-get install autoconf \
                bison \
                build-essential \
                libssl-dev \
                libyaml-dev \
                libreadline6-dev \
                zlib1g-dev \
                libncurses5-dev \
                libffi-dev \
                libgdbm3 \
                libgdbm-dev

echo '# installing rvm'
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby
# source bash_profile?
# echo "source $HOME/.rvm/scripts/rvm" >> ~/.bashrc

echo '# installint rubies'
rvm install 2.2.6
rvm install 2.3.3
rvm install 2.4.0
rvm --default use 2.4.0

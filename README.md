# Dotfiles

[![Build Status](https://travis-ci.com/KlotzAndrew/dotfiles.svg?branch=master)](https://travis-ci.com/KlotzAndrew/dotfiles)

### Current workflow

```bash
apt-get update
apt-get install -y git
git clone https://github.com/KlotzAndrew/dotfiles.git

./bin/install.sh base

make
source ~/.bash_profile

# need path set for languages
./bin/install.sh golang
```

```bash
curl -LS raw.github.com/KlotzAndrew/dotfiles/master/bin/setup | bash
```
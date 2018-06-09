#!/usr/bin/env bash

set -ex

goversion='go1.10.3.darwin-amd64.tar.gz'

wget -O \
  /tmp/go1.10.3.tar.gz \
  https://dl.google.com/go/$goversion

sudo tar -C /usr/local -xzf /tmp/$goversion


#!/usr/bin/env bash

set -ex

echo "installing haskell"

brew cask install haskell-platform

cabal --version
ghc --version

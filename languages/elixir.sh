#!/usr/bin/env bash

echo "installing elixir"
\curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s

# add this to shell source
# [[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

kiex list known
kiex install 1.4.0

kiex default 1.4.0

echo "elixers installed"
kiex list


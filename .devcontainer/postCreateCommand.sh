#!/usr/bin/env bash

set -e

sudo apt-get update

# gnu time
sudo apt-get install -y time

# oj-bundle
pipx install online-judge-verify-helper

# marathon
pipx install psytester

# library
git clone https://github.com/atcoder/ac-library $HOME/ac-library
git clone https://github.com/yosupo06/yosupo-library $HOME/yosupo-library
git clone https://github.com/yosupo06/Algorithm $HOME/Algorithm

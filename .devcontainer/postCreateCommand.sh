#!/usr/bin/env bash

set -e

sudo apt-get update

# test.py
pip install rich

# oj
pip install online-judge-tools online-judge-verify-helper

# marathon
pip install psytester ipykernel

# library
git clone https://github.com/atcoder/ac-library $HOME/ac-library
git clone https://github.com/yosupo06/yosupo-library $HOME/yosupo-library
git clone https://github.com/yosupo06/Algorithm $HOME/Algorithm
git clone https://github.com/yosupo06/fastfps $HOME/fastfps

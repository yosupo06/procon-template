#!/usr/bin/env bash

set -e

sudo apt-get update

# clang
sudo apt-get install -y lsb-release wget software-properties-common gnupg
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

sudo apt-get install -y sqlite3 xsel

# oj
pip install online-judge-tools online-judge-verify-helper

pip install psytester ipykernel

cargo install cargo-generate

git clone https://github.com/atcoder/ac-library $HOME/ac-library
git clone https://github.com/yosupo06/yosupo-library $HOME/yosupo-library
git clone https://github.com/yosupo06/Algorithm $HOME/Algorithm
git clone https://github.com/yosupo06/fastfps $HOME/fastfps

go install github.com/yosupo06/supporter@latest

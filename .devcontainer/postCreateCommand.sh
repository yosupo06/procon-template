#!/usr/bin/env bash

set -e

sudo apt-get update

# clang
sudo apt-get install -y lsb-release wget software-properties-common gnupg
wget https://apt.llvm.org/llvm.sh -O /tmp/llvm.sh
chmod +x /tmp/llvm.sh
sudo /tmp/llvm.sh 18

sudo apt-get install -y sqlite3 xsel

# oj
pip install online-judge-tools online-judge-verify-helper

pip install psytester ipykernel

git clone https://github.com/atcoder/ac-library $HOME/ac-library
git clone https://github.com/yosupo06/yosupo-library $HOME/yosupo-library
git clone https://github.com/yosupo06/Algorithm $HOME/Algorithm
git clone https://github.com/yosupo06/fastfps $HOME/fastfps

go install github.com/yosupo06/supporter@latest

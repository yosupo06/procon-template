#!/usr/bin/env bash

set -e

sudo apt-get update
sudo apt-get install -y sqlite3 xsel

pip install psytester online-judge-tools online-judge-verify-helper ipykernel

cargo install cargo-generate

git clone https://github.com/atcoder/ac-library $HOME/ac-library
git clone https://github.com/yosupo06/yosupo-library $HOME/yosupo-library
git clone https://github.com/yosupo06/Algorithm $HOME/Algorithm
git clone https://github.com/yosupo06/fastfps $HOME/fastfps

go install github.com/yosupo06/supporter@latest

#!/usr/bin/env bash

set -e

template_dir=$(realpath $(dirname $(realpath $0))/../template/cxx)

for target_dir in "$@"; do
    if [ ! -d "$target_dir" ]; then
        echo "[init] Creating directory $target_dir"
        mkdir -p "$target_dir"
        cp -r $template_dir $target_dir
    else
        echo "[init] $target_dir already exists, skip"
    fi 
done

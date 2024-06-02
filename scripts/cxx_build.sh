#!/usr/bin/env bash

file_name=$1
output_file=${file_name%.cpp}
shift
options=$@

if [ -z "$file_name" ]; then
    echo "Usage: $0 <source_file> [options]"
    exit 1
fi

echo "[build] $file_name"

clang++-18 $file_name -o $output_file \
-std=c++20 \
-Wall -Wextra -Wshadow -Wconversion -Wno-sign-conversion \
-march=native \
-I ~/ac-library \
-I ~/yosupo-library/src \
-I ~/fastfps/src \
$options

#!/usr/bin/env bash

file_name=$1
output_file=${file_name%.cpp}.out.cpp

if [ -z "$file_name" ]; then
    echo "Usage: $0 <source_file>"
    exit 1
fi

if [[ "$file_name" != *.cpp ]]; then
    echo "Error: The source file must have a .cpp extension."
    exit 1
fi

oj-bundle $file_name \
-I $HOME/ac-library \
-I $HOME/yosupo-library/src \
-I $HOME/fastfps/src > $output_file

#!/usr/bin/env bash

set -e

cxx_build.sh $@

file_name=$1
output_file=${file_name%.cpp}
tests_dir=$(dirname $file_name)/tests

for test in $tests_dir/*.in; do
    echo "[test] $test"
    $output_file < $test
done

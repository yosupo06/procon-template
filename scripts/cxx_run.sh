#!/usr/bin/env bash

set -e

file_name=$1
output_file=${file_name%.cpp}
$output_file

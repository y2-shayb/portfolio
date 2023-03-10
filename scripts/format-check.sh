#!/bin/bash

function echo_green() {
  echo -e "\033[32m$1\033[0m"
}

function echo_red() {
  echo -e "\033[31m$1\033[0m"
}

# get format types
file_contents=$(cat scripts/format-types.txt )

# setup prettier command
prettier_command="npx prettier --check \"src/**/*.{${file_contents}}\""

echo_green "check prettier format"

# run the prettier command
eval $prettier_command

# check for failure
if [ $? -ne 0 ]; then
    echo_red "format check failed, run \"yarn format\""
    exit 1
fi
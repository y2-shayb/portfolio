#!/bin/bash

function echo_green() {
  echo -e "\033[32m$1\033[0m"
}

# get format types
file_contents=$(cat scripts/format-types.txt )

# setup prettier command
prettier_command="npx prettier --write \"src/**/*.{${file_contents}}\""

echo_green "running: ${prettier_command}"

# run the prettier command
eval $prettier_command
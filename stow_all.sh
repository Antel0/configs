#!/usr/bin/bash

# Gets all dirs and excludes the .md and the .sh files
configs=ls | grep -v "\.md" | grep -v "\.sh"

stow_all_cmd="stow -t $HOME ${configs[*]}"

echo "Running command: $stow_all_cmd"
eval "$stow_all_cmd"


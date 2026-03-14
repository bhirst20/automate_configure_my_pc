#!/bin/bash

# GitHub organization name
ORG_NAME=""

# List of repositories to exclude
EXCLUDE_LIST=()

# Clone using SSH
CLONE_URL="git@github.com:$ORG_NAME/"

# Temporary file to store repository names
REPO_LIST_FILE=$(mktemp)

# Use gh to list repositories for the organization with pagination
gh repo list $ORG_NAME --json name -q '.[].name' --limit 1000 > $REPO_LIST_FILE

# Function to check if a repository is in the exclude list
is_excluded() {
  local repo=$1
  for exclude in "${EXCLUDE_LIST[@]}"; do
    if [ "$repo" == "$exclude" ]; then
      return 0
    fi
  done
  return 1
}

# Loop through each repository and clone or pull
while IFS= read -r repo; do
  if is_excluded "$repo" == 0; then
    echo "Skipping $repo"
  else
    if [ -d "$repo" ]; then
      # If the directory exists, change into it and pull
      cd "$repo" || exit
      git pull
      cd ..
    else
      # If the directory doesn't exist, clone the repository
      git clone "${CLONE_URL}${repo}.git"
    fi
  fi

done < $REPO_LIST_FILE

# Remove temporary file
rm $REPO_LIST_FILE

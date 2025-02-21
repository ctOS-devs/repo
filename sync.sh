#!/bin/sh

git pull
./sign.sh

while true; do
    # Fetch latest changes without merging
    git fetch origin
    #git pull

    # Check if the local branch is behind the remote branch
    if ! git diff --quiet HEAD origin/$(git rev-parse --abbrev-ref HEAD); then
        git pull
        ./sign.sh # Sign after updating packages
    else
        continue
    fi

    sleep 1
done

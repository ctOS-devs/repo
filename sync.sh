#!/bin/sh

git pull
./sign.sh

while true; do
    # Fetch latest changes without merging
    git fetch origin
    #git pull
    sleep 50

    # Check if the local branch is behind the remote branch
    if ! git diff --quiet HEAD origin/$(git rev-parse --abbrev-ref HEAD); then
        git pull
        ./sign.sh # Sign after updating packages
    else
	# In case when we builded packages locally
	git add *
	git commit -m 'Auto-update from local repo'
	git push
        continue
    fi

    sleep 500
done

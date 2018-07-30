#!/bin/bash

#This script is going to tag new patch version like this v1.0.0 -> v1.0.1
#Tagging name must be vX.X.X

#get latest tagging name
latest_tag=`git describe --abbrev=0 --tags`

#parsiong with '.'
version_split=(${latest_tag//./ })
major=${version_split[0]}
minor=${version_split[1]}
patch=${version_split[2]}
patch=$((patch+1))

#create new tag that is added '1' at patch.
next_tag="$major.$minor.$patch"

latest_commit=`git rev-parse HEAD`
latest_commit_tag=`git tag --contains $latest_commit`

if [ -z "$latest_commit_tag" ]; then
	echo "laest tag : $latest_tag , next tag : $next_tag"
    git tag $next_tag
    git push --tags
else
	echo "latst commit : $latest_commit, tag by latest commit : $latest_commit_tag"
    echo "There has been tagged at latest commit. It dosen't do anything."
fi


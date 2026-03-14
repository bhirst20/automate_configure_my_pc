#!/bin/bash

# Please update this with your initials before first use
dev_initials=""

# GitHub organization name
ORG_NAME=""

# Checks that a repository has been included in arguments
if [ -z $1 ];
  then
    echo "Need a repo in arugment 1"
    exit 1
fi
repo=${1}

# Requires the ticket number, complete SPRNEW-XXXX
if [ -z $2 ];
  then
    echo "Need an arugment 2; ticket number"
    exit 1
fi
ticket=${2}

# Check that a description is present
if [ -z $3 ];
  then
    echo "Need an arugment 3; brief_description"
    exit 1
fi
desc=${3}

# Create a branch name
branch="${dev_initials}/${ticket}/${desc}"

# Create a ticket folder and perform checkouts
mkdir -p ${ticket}
cd ${ticket}
git clone git@github.com:${ORG_NAME}/${repo}.git
cd ${repo}


if [ ! -z $4 ]; then
    echo "Checking out alternate branch ${4}"
    git checkout $4
fi

# Create and push new branch
git checkout -b ${branch}
git push -u origin ${branch}

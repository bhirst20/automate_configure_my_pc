#!/bin/bash

# Only Debian/Ubuntu ship with broken vim-tiny by default
if [ -f /etc/debian_version ]; then
    sudo apt install -y vim
else
    echo "Not a Debian-based system, skipping (vim should already be fine)"
fi

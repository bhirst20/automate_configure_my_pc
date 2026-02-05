#!/bin/bash

OS=$(uname -s)

if [ "$OS" = "Darwin" ]; then
    # macOS
    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform

elif [ "$OS" = "Linux" ]; then
    # Linux (Debian/Ubuntu)
    sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

    wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

    gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

    sudo apt update
    sudo apt-get install -y terraform

else
    echo "Unsupported OS: $OS"
    exit 1
fi

#!/bin/bash

# Gathered from https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

OS=$(uname -s)

if [ "$OS" = "Darwin" ]; then
    # macOS
    curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
    sudo installer -pkg AWSCLIV2.pkg -target /

elif [ "$OS" = "Linux" ]; then
    # Linux
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    rm -rf awscliv2.zip aws/

else
    echo "Unsupported OS: $OS"
    exit 1
fi

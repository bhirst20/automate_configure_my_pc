#!/bin/bash

# Retrieved from https://opentofu.org/docs/intro/install/

OS=$(uname -s)

if [ "$OS" = "Darwin" ]; then
    # macOS
    brew update
    brew install opentofu

elif [ "$OS" = "Linux" ]; then
    # Linux (Debian/Ubuntu)
    # Install Tooling
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg

    # Install Tofu Repos
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://get.opentofu.org/opentofu.gpg | sudo tee /etc/apt/keyrings/opentofu.gpg >/dev/null
    curl -fsSL https://packages.opentofu.org/opentofu/tofu/gpgkey | sudo gpg --no-tty --batch --dearmor -o /etc/apt/keyrings/opentofu-repo.gpg >/dev/null
    sudo chmod a+r /etc/apt/keyrings/opentofu.gpg /etc/apt/keyrings/opentofu-repo.gpg

    # Setup Tofu lists
    echo \
      "deb [signed-by=/etc/apt/keyrings/opentofu.gpg,/etc/apt/keyrings/opentofu-repo.gpg] https://packages.opentofu.org/opentofu/tofu/any/ any main
    deb-src [signed-by=/etc/apt/keyrings/opentofu.gpg,/etc/apt/keyrings/opentofu-repo.gpg] https://packages.opentofu.org/opentofu/tofu/any/ any main" | \
      sudo tee /etc/apt/sources.list.d/opentofu.list > /dev/null
    sudo chmod a+r /etc/apt/sources.list.d/opentofu.list

    # Install Tofu
    sudo apt-get update
    sudo apt-get install -y tofu

else
    echo "Unsupported OS: $OS"
    exit 1
fi

# Ask about terraform symlink
echo ""
read -p "Create symlink from 'terraform' to 'tofu'? [Y/n]: " symlink_choice
symlink_choice=${symlink_choice:-Y}

if [[ "$symlink_choice" =~ ^[Yy]$ ]]; then
    TOFU_PATH=$(which tofu)
    TOFU_DIR=$(dirname "$TOFU_PATH")
    sudo ln -sf "$TOFU_PATH" "$TOFU_DIR/terraform"
    echo "Symlink created: terraform -> tofu"
fi

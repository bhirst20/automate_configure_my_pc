#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing shell aliases and scripts..."

# Copy bash_aliases to home
cp "$SCRIPT_DIR/bash_aliases.sh" ~/.bash_aliases
echo "Copied bash_aliases.sh -> ~/.bash_aliases"

# Create ~/bin if it doesn't exist
mkdir -p ~/bin

# Copy all scripts from bin/
if [ -d "$SCRIPT_DIR/bin" ]; then
    cp "$SCRIPT_DIR/bin/"* ~/bin/
    chmod +x ~/bin/*
    echo "Copied scripts -> ~/bin/"
fi

# Check if ~/bin is in PATH
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo ""
    echo "NOTE: ~/bin is not in your PATH. Add this to your ~/.bashrc or ~/.zshrc:"
    echo ""
    echo '    export PATH="$HOME/bin:$PATH"'
    echo ""
fi

# Remind to source
echo ""
echo "Run 'source ~/.bash_aliases' or start a new terminal to use the aliases."

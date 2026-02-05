



OS=$(uname -s)

if [ "$OS" = "Darwin" ]; then
    # macOS
    curl -L "https://ollama.com/download/Ollama-darwin.zip" -o "Ollama-darwin.zip"
    unzip Ollama-darwin.zip
    mv Ollama.app /Applications/
    rm -rf Ollama-darwin.zip

elif [ "$OS" = "Linux" ]; then
    # Linux
    curl -fsSL https://ollama.com/install.sh | sh

else
    echo "Unsupported OS: $OS"
    exit 1
fi

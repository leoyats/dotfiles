#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "🚀 Starting dotfiles installation..."

# 1. Install Homebrew if not found
if ! command -v brew &> /dev/null; then
    echo "📦 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for the current session
    if [[ "$OSTYPE" == "darwin"* ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "✅ Homebrew is already installed."
fi

# 2. Install chezmoi if not found
if ! command -v chezmoi &> /dev/null; then
    echo "🛠 Installing chezmoi..."
    brew install chezmoi
fi

# 3. Initialize and apply dotfiles
echo "✨ Applying dotfiles with chezmoi..."
if [ -d "$HOME/.local/share/chezmoi/.git" ]; then
    # If the directory already exists, just apply the changes
    chezmoi apply --force
else
    # On a fresh system, initialize your repository
    chezmoi init --apply leoyats
fi

echo "🎉 Installation complete! System is ready."
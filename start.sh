#! /bin/bash
# Source: https://github.com/DanielMSchmidt/dotfiles/blob/74d5cf6d4e74e2aab652c29523bbf5fed54ab979/.startup.sh#L7-L24
# Install XCode Command Line Tools if necessary
xcode-select --install || echo "XCode already installed"

# Install Homebrew if necessary
if which -s brew; then
    echo 'Homebrew is already installed'
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew install chezmoi
chezmoi init https://github.com/BlueHotDog/my_dot_files.git
chezmoi apply
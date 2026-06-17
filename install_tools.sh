#!/usr/bin/bash

mac_install() {
    if command -v brew &> /dev/null; then
        echo "Homebrew already installed"
    else
        echo "Installing Homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    
    local packages=(
        tldr
        glow
        pandoc
        binwalk
        tree
    )

    brew install "${packages[@]}"  

}

linux_install() {
# detect apt or dnf
    echo "TK"
}

# 1. Detect the Operating System
OS=$(uname -s)# detect OS and act accordingly
OS=$(uname -s)

if [ "$OS" = "Darwin" ]; then
    echo "Running on macOS"
    mac_install    
elif [ "$OS" = "Linux" ]; then
    echo "Running on Linux"
    linux_install
else
    echo "Unknown OS"
    exit 1
fi

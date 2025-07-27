#!/bin/sh

print $fg_bold[green] Installing Xcode Command Line Tools
xcode-select --install

print $fg_bold[green] Installing oh-my-zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

print $fg_bold[green] Installing Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

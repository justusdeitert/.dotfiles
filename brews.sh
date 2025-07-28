#!/bin/bash

set -e

echo "🔄 Updating Homebrew..."

brew update
brew doctor

brews=(
    php
    httpd
    composer
    deployer
    openssl
    mariadb
    mongodb-community
    node
    wp-cli
    yarn
    tree
    git
    gh
    mas
    imagemagick
)

echo "📦 Installing formulae..."

for brew in "${brews[@]}"; do
    brew install "$brew" || echo "⚠️ Failed to install $brew"
done

apps=(
    google-chrome
    firefox
    microsoft-edge
    tableplus
    docker
    appcleaner
    caffeine
    vlc
    the-unarchiver
    iterm2
    figma
    whatsapp
    messenger
    signal
    postman
    transmit
    visual-studio-code
    moom
    fork
    slack
    spotify
    rekordbox
    transmission
    battery
    # zoom
    # poedit
    # skype
    # microsoft-teams
    # github
    # dropbox
    # little-snitch
    # onedrive
)

echo "🖥️ Installing cask apps..."

for app in "${apps[@]}"; do
    brew install --cask "$app" || echo "⚠️ Failed to install $app"
done

echo "✅ Homebrew installations complete!"
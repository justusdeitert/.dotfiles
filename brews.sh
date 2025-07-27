#!/bin/sh

brew update
brew doctor

brews=(
    php
    httpd
    composer
    deployer
    openssl
    mariadb
    mongodb
    node
    wp-cli
    yarn
    serve
    tree
)

for brew in "${brews[@]}"
    do brew install $brew
done

apps=(
    google-chrome
    firefox
    microsoft-edge
    sequel-pro-nightly
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
    # transmission
    # dropbox
    # little-snitch
    # editors
    # onedrive
)

for app in "${apps[@]}"
    do brew install --cask $app
done
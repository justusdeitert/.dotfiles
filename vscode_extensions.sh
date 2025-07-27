#!/bin/sh

vscodeextension=(
    editorconfig.editorconfig
)

for plugin in "${vscodeextension[@]}"
    do code --install-extension $plugin
done

















































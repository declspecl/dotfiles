#!/bin/sh
mkdir -p ~/.config/home-manager
ln -sf ~/.dotfiles/home/home.nix ~/.config/home-manager/home.nix
echo "Linked. Run: home-manager switch"

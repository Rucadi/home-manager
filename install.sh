#!/bin/bash

bash -c "sh <(curl -L https://nixos.org/nix/install) --no-daemon"

mkdir -p ~/.config/
git clone https://github.com/Rucadi/nix ~/.config/nix

# Nix into shell
[[ -f $HOME/.nix-profile/etc/profile.d/nix.sh ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install

# Home-Manager into shell
[[ -f $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh ]] && . $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh


rm -rf ~/.config/home-manager
git clone https://github.com/Rucadi/home-manager ~/.config/home-manager

# Set Home-Manager (Will remove old .bashrc)
home-manager switch -b backup

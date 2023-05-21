#!/bin/bash

bash -c "sh <(curl -L https://nixos.org/nix/install) --no-daemon"

mkdir -p ~/.config/
git clone https://github.com/Rucadi/home-manager ~/.config/home-manager
git clone https://github.com/Rucadi/nix ~/.config/nix

[[ -f $HOME/.nix-profile/etc/profile.d/nix.sh ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh
[[ -f $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh ]] && . $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install
home-manager switch

rm -rf $temp_folder

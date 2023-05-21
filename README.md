# nix-dotfiles
My dotfiles while learning nix

# My install command (I check user = rucadi, don't use this in your system)
bash <(curl -L https://raw.githubusercontent.com/Rucadi/home-manager/master/install.sh)

# Install nix

# Multiuser:

```sh <(curl -L https://nixos.org/nix/install) --no-daemon```

# Single user

```sh <(curl -L https://nixos.org/nix/install) --no-daemon```


# Make sure that nix.conf has experimental features enabled
```mkdir -p ~/.config/nix && echo "experimental-features = nix-command flakes" > ~/.config/nix.conf```


# Add to .bashrc

```
[[ -f $HOME/.nix-profile/etc/profile.d/nix.sh ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh
[[ -f $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh ]] && . $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
```


# Add Home-Manager to nix

```
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

# Install Home-Manager

```nix-shell '<home-manager>' -A install```


# Setup system

```home-manager switch```

{ config, pkgs, ... }: {
  nixpkgs.config.permittedInsecurePackages = [
      "nodejs-16.20.0"
    ];

  imports = [
    ./packages.nix
  ];
  
  home = {
    homeDirectory = "/home/rucadi";
    stateVersion = "22.11";
    username = "rucadi";
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  programs.home-manager.enable = true;

  programs.bash.enable = true;
  programs.bash.bashrcExtra=''
    [[ -f $HOME/.nix-profile/etc/profile.d/nix.sh ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh
    [[ -f $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh ]] && . $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
  '';
  # OR
  programs.zsh.enable = true;

}

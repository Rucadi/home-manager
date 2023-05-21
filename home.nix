{
  config,
  pkgs,
  ...
}: {
  home = {
    homeDirectory = "/home/rucadi";

    packages = with pkgs; [
      asciiquarium
      bat
      bottom
      cachix
      cmatrix
      coreutils
      coursier
      cowsay
      delta
      direnv
      dive
      docker
      docker-compose
      doppler
      duf
      fd
      figlet
      fx
      fzf
      gh
      gitAndTools.gitFull
      glow
      graalvm17-ce
      graphviz
      gum
      heroku
      htop
      ipfetch
      keychain
      less
      lolcat
      mosh
      ncdu
      neofetch
      neovim
      ngrok
      nix-direnv
      nvd
      ookla-speedtest
      pulumi
      ripgrep
      ripgrep-all
      scala-cli
      sl
      stow
      tig
      tree
      unzip
      zip
      meld
      zsh
    ];

    stateVersion = "22.11";
    username = "rucadi";
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  programs.home-manager.enable = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  programs.bash.enable = true;
  programs.bash.bashrcExtra=''
    [[ -f $HOME/.nix-profile/etc/profile.d/nix.sh ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh
    [[ -f $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh ]] && . $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
  '';
  # OR
  programs.zsh.enable = true;

  programs.git = {
  enable = true;
  package = pkgs.gitAndTools.gitFull;
  lfs.enable = true;

  userName  = "Rucadi";
  userEmail = "ruben.cano96@gmail.com";

  extraConfig = {
    core.editor = "nano";
    merge.tool = "${pkgs.meld}/bin/meld";
    pull.ff = "only";
    init.defaultBranch = "master";
    gitlab.user = "Rucadi";
  };
};
}

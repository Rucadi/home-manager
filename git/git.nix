{ pkgs, ... }:

{
  programs.git = {
    userName  = "Rucadi";
    userEmail = "ruben.cano96@gmail.com";
    package = pkgs.gitAndTools.gitFull;
    lfs.enable = true;

    enable = true;
    ignores = [
      "*~" "*.bak*" # backup files
      ".*.sw?" "tags" # vim swap and tag files
      ".env"  ".direnv/" # directory environment configuration files
      "vendor/" "node_modules/" # package manager directories
      ".DS_Store" # get rid of the mac shit
      "*.log" # you probably never want to commit a log file
      "*.md.pdf" # those get built when using :make when ft=markdown

      "Session.vim" # vim session file
      ".root" # file denoting the root of a project
    ];

    extraConfig = {
        core.editor = "nano";
        merge.tool = "${pkgs.meld}/bin/meld";
        pull.ff = "only";
        init.defaultBranch = "master";
        gitlab.user = "Rucadi";

      merge = {
        conflictStyle = "diff3";
      };

      push = {
        default = "simple";
      };

      # see https://stackoverflow.com/questions/41029654/ignore-fsck-zero-padded-file-mode-errors-in-git-clone
      transfer = {
        fsckobjects = true;
      };

      "receive.fsck".zeroPaddedFilemode = "warn";
      "fetch.fsck".zeroPaddedFilemode = "warn";
      "receive.fsck".badTimezone = "warn";
      "fetch.fsck".badTimezone = "warn";


      color = {
        pager = false;
      };
    };
  };
}
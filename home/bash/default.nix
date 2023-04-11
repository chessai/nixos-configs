{ config, pkgs, lib, ... }:

with { cds = import ./cds.nix; };

{
  home-manager.users.chessai.programs.bash = {
    enable = true;

    historySize = 5000;
    historyFileSize = 50000;
    historyControl = [ "ignoredups" ];
    historyIgnore = [ "ls" "cd" "exit" ];

    shellAliases = cds // {
      ghc810 = "nix-shell -p haskell.compiler.ghc810";
      ghc9   = "nix-shell -p haskell.compiler.ghc9";
      ghc92  = "nix-shell -p haskell.compiler.ghc92";
      ghc94  = "nix-shell -p haskell.compiler.ghc94";

      ls = "${pkgs.exa}/bin/exa -G --color auto --icons -a -s type";
      ll = "${pkgs.exa}/bin/exa -l --color always --icons -a -s type";
      cat = "${pkgs.bat}/bin/bat -pp --theme=\"Nord\"";
      grep = "${pkgs.ripgrep}/bin/rg";
      rg = "${pkgs.ripgrep}/bin/rg";

      git = "${pkgs.gitAndTools.gitFull}/bin/git";
      gs = "${pkgs.gitAndTools.gitFull}/bin/git status";
      git-initial-commit = "${pkgs.gitAndTools.gitFull}/bin/git commit -m \"Creō ā nihilō\"";

      gist = "gist --private";
      gist-archive = "for repo in $(gist -l | awk '{ print $1 }'); do git clone $repo 2> /dev/null; done";
      git-commit-stats = "git log --author=\"$(git config user.name)\" --pretty=tformat: --numstat | awk '{inserted+=$1; deleted+=$2; delta+=$1-$2; ratio=deleted/inserted} END {printf \"Commit stats:\\n- Lines added (total)....  %s\\n- Lines deleted (total)..  %s\\n- Total lines (delta)....  %s\\n- Add./Del. ratio (1:n)..  1 : %s\\n\", inserted, deleted, delta, ratio }' -";

      yarn = "yarn --ignore-engines";
      ts = "nix-shell -E 'let pkgs = import <nixpkgs> {}; in pkgs.mkShell { buildInputs = with pkgs; [ nodejs-13_x yarn nodePackages.typescript ]; }'";

      ":q" = "exit";

      # install newest nightly rust
      rs-nightly-refresh = "nix-env -iA nixos.latest.rustChannels.nightly.rust";

      i3-log = "DISPLAY=:0 ${pkgs.i3}/bin/i3-dump-log | ${pkgs.bzip2}/bin/bzip2 -c | ${pkgs.curl}/bin/curl --data-binary @- https://logs.i3wm.org";
    };

    # Only source this once.
    # if [ -n "$__HM_SESS_VARS_SOURCED" ]; then return; fi
    # export __HM_SESS_VARS_SOURCED=1

    initExtra = lib.mkBefore ''
      export GRAPHVIZ_DOT="${pkgs.graphviz}/bin/dot"
      export LC_CTYPE="en_US.UTF-8";
      export EDITOR="nvim";
      export VISUAL="nvim";

      set -o vi

      # must be at the end
      eval "$(${pkgs.starship}/bin/starship init bash)"
    '';
  };
}

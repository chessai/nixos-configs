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
      ghc86  = "nix-shell -p haskell.compiler.ghc865";
      ghc884 = "nix-shell -p haskell.compiler.ghc884";
      ghc810 = "nix-shell -p haskell.compiler.ghc8104";
      ghc9   = "nix-shell -p haskell.compiler.ghc901";

      ls = "${pkgs.exa}/bin/exa -G --color auto --icons -a -s type";
      ll = "${pkgs.exa}/bin/exa -l --color always --icons -a -s type";
      cat = "${pkgs.bat}/bin/bat -pp --theme=\"Nord\"";
      grep = "${pkgs.ripgrep}/bin/rg";
      rg = "${pkgs.ripgrep}/bin/rg";

      git = "${pkgs.gitAndTools.hub}/bin/hub";
      gs = "${pkgs.gitAndTools.hub}/bin/hub status";
      gc = "${pkgs.gitAndTools.hub}/bin/hub clone";
      git-initial-commit = "${pkgs.gitAndTools.hub}/bin/hub commit -m \"Creō ā nihilō\"";

      gist = "gist --private";

      yarn = "yarn --ignore-engines";
      ts = "nix-shell -E 'let pkgs = import <nixpkgs> {}; in pkgs.mkShell { buildInputs = with pkgs; [ nodejs-13_x yarn nodePackages.typescript ]; }'";

      ":q" = "exit";

      # install newest nightly rust
      rs-nightly-refresh = "nix-env -iA nixos.latest.rustChannels.nightly.rust";
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

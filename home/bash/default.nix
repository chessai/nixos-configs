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
      ghc88  = "nix-shell -p haskell.compiler.ghc883";
      ghc810 = "nix-shell -p haskell.compiler.ghc8101";

      ls = "${pkgs.coreutils}/bin/ls --color=auto";

      git = "${pkgs.gitAndTools.hub}/bin/hub";
      gc = "${pkgs.gitAndTools.hub}/bin/hub clone";
      gs = "${pkgs.gitAndTools.hub}/bin/hub status";
      git-initial-commit = "${pkgs.gitAndTools.hub}/bin/hub commit -m \"Creō ā nihilō\"";

      gist = "gist --private";

      ts = "nix-shell -E 'let pkgs = import <nixpkgs> {}; in pkgs.mkShell { buildInputs = with pkgs; [ nodejs yarn nodePackages.typescript ]; }'";

    };

    initExtra = lib.mkBefore ''
      . "/home/chessai/.nix-profile/etc/profile.d/hm-session-vars.sh"
      set -o vi
    '';
  };
}

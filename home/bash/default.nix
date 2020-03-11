{ config, pkgs, lib, ... }:

{
  home-manager.users.chessai.programs.bash = {
    enable = true;

    historySize = 5000;
    historyFileSize = 50000;
    historyControl = [ "ignoredups" ];
    historyIgnore = [ "ls" "cd" "exit" ];

    shellAliases = {
      ghc865 = "nix-shell -p haskell.compiler.ghc865";
      ghc881 = "nix-shell -p haskell.compiler.ghc881";

      ls = "${pkgs.coreutils}/bin/ls --color=auto";

      git = "${pkgs.gitAndTools.hub}/bin/hub";
      gc = "${pkgs.gitAndTools.hub}/bin/hub clone";
      gs = "${pkgs.gitAndTools.hub}/bin/hub status";
      git-initial-commit = "${pkgs.gitAndTools.hub}/bin/hub commit -m \"Creō ā nihilō\"";

      ".0"  = "cd .";
      ".1"  = "cd ..";
      ".2"  = "cd ../..";
      ".3"  = "cd ../../..";
      ".4"  = "cd ../../../../..";
      ".5"  = "cd ../../../../../..";
      ".6"  = "cd ../../../../../../..";
      ".7"  = "cd ../../../../../../../..";
      ".8"  = "cd ../../../../../../../../..";
      ".9"  = "cd ../../../../../../../../../..";
      ".10" = "cd ../../../../../../../../../../..";

      gist = "gist --private";

      ts = "nix-shell -E 'let pkgs = import <nixpkgs> {}; in pkgs.mkShell { buildInputs = with pkgs; [ nodejs yarn nodePackages.typescript ]; }'";

    };

    initExtra = lib.mkBefore ''
      . "/home/chessai/.nix-profile/etc/profile.d/hm-session-vars.sh"
      set -o vi
    '';
  };
}

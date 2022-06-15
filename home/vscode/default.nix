{ config, pkgs, lib, ... }:

{
  home-manager.users.chessai.programs.vscode = {
    enable = true;

    userSettings = {
      "editor.fontSize" = 24;
      "editor.lineNumbers" = "relative";
      "files.trimTrailingWhitespace" = true;

      "[hs]"."editor.tabSize" = 2;
      "[nix]"."editor.tabSize" = 2;
      "[rs]"."editor.tabSize" = 4;

      # vscode-neovim needs to be told where neovim is
      "vscode-neovim.neovimPath" = "${pkgs.neovim}/bin/nvim";

      # not posix-compliant otherwise, and just downright annoying
      "files.insertFinalNewline" = true;

      # vscode doesn't respect system keyboard by default
      "keyboard.dispatch" = "keyCode";
    };

    extensions = with pkgs.vscode-extensions; [
      arrterian.nix-env-selector
      asvetliakov.vscode-neovim
      matklad.rust-analyzer
    ];
  };
}

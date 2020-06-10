{ config, pkgs, lib, ... }:

{
  home-manager.users.chessai.programs.vscode = {
    enable = true;

    userSettings = {
      "editor.fontSize" = 24;

      "[nix]"."editor.tabSize" = 2;
      "[hs]"."editor.tabSize" = 2;

      "vim.easymotion" = true;
      "vim.sneak" = true;
      "vim.incsearch" = true;
      "vim.useSystemClipboard" = true;
      "vim.useCtrlKeys" = true;
      "vim.hlsearch" = true;

      "files.insertFinalNewline" = true;
    };

    #extensions = with pkgs.vscode-extensions; [
    #  bbenoist.Nix
    #  #vscodevim.vim
    #];
  };
}

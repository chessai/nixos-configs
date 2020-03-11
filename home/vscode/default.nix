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
    };

    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      { name = "TSLint";
        publisher = "Microsoft";
        version = "v1.2.3";
        sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
      }
    ];
  };
}

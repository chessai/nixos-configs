{ config, pkgs, lib, ... }:

{
  home-manager.users.chessai.programs.vim = {
    enable = true;

    plugins = [
      "vim-nix"
      "airline"
      "rainbow_parentheses"
      "ctrlp-vim"
      "youcompleteme"
    ];

    extraConfig = builtins.readFile ./vimrc;
  };
}

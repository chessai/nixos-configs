{ config, pkgs, lib, ... }:

{
  home-manager.users.chessai.programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;
    withPython = false;

    plugins = with pkgs.vimPlugins; [
      agda-vim
      haskell-vim
      vim-nix
      nerdtree
      nerdcommenter
      rainbow_parentheses
    ];

    extraConfig = builtins.readFile ./vimrc;
  };
}

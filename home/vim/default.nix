{ config, pkgs, lib, ... }:

{
  home-manager.users.chessai.programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;

    plugins = with pkgs.vimPlugins; [
      agda-vim
    ];

    #extraConfig = builtins.readFile ./vimrc;
  };
}

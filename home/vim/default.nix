{ config, pkgs, lib, ... }:

{
  home-manager.users.chessai.programs.vim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      #LanguageClient-neovim
      airline
      #coc-nvim
      #ctrlp-vim
      haskell-vim
      rainbow_parentheses
      vim-nix
      #vim-stylish-haskell
      #vim-hindent
      #youcompleteme
    ];

    extraConfig = builtins.readFile ./vimrc;
  };
}

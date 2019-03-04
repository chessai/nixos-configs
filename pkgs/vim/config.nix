{ config,pkgs,... }:

let
  myVim = pkgs.vim_configurable.customize {
    name = "vim";
    vimrcConfig.customRC = builtins.readFile ./vimrc;

    vimrcConfig.packages.myVimPackage = with pkgs.vimPlugins; {
      start = [
        #vim-colorschemes
        rainbow_parentheses
        #syntastic
        #vimproc
        #ctrlp
        #neocomplete
        #The_NERD_Commenter
        #The_NERD_tree
        #supertab
        #tabular
        #tlib
        #vim-addon-mw-utils
        #vim-repeat
        #snipmate
        #surround
        #neco-ghc
        vim-nix
        #fugitive
        #vim-stylish-haskell
      ];

    };
  };
in
  {
    environment.systemPackages = [ myVim ];
    environment.shellAliases.vi = "vim";
    environment.variables.EDITOR = "vim";
    programs.bash.shellAliases = {
      vi = "vim";
      svim = "sudoedit";
    };
    nixpkgs.config.vim = {
      ftNixSupport = true;
      pythonSupport = true;
    };
  }

{ config,pkgs,lib,... }:

with lib;

let
  myVim = pkgs.vim_configurable.customize {
    name = "vim";
    vimrcConfig = {
      customRC = builtins.readFile ./vimrc;
      vam.pluginDictionaries = [
        { names = [
            "vim-nix"
            "airline"
            "rainbow_parentheses"
            "ctrlp-vim"
            "youcompleteme"
          ];
        }
      ];
    };
  };
in
{
  config = {
    environment = {
      systemPackages = [ myVim pkgs.nix-prefetch-git ];
      shellAliases.vi = "vim";
      variables.EDITOR = "vim";
    };
    programs.bash.shellAliases = {
      vi = "vim";
      svim = "sudoedit";
    };
    nixpkgs.config.vim = {
      ftNixSupport = true;
      pythonSupport = true;
    };
  };
}

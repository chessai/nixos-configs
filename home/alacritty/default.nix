{ config, pkgs, lib, ... }:

{
  home-manager.users.chessai.programs.alacritty = {
    enable = true;

    settings = lib.mkOptionDefault {
      font = {
        size = 22.0;
      };
    };
  };
}

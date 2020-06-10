{ config, pkgs, lib, ... }:

{
  home-manager.users.chessai.programs.firefox = {
    enable = true;
  };
}

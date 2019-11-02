{ config, pkgs, lib, ... }:

{
  home-manager.users.chessai.programs.jq = {
    enable = true;
  };
}

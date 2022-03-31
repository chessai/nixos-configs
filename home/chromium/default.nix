{ config, pkgs, lib, ... }:

{
  home-manager.users.chessai.programs.chromium = {
    enable = true;

    #package = pkgs.chromiumBeta;
  };
}

{ config, pkgs, lib, ... }:

{
  home-manager.users.chessai.programs.chromium = {
    enable = true;

    #package = pkgs.chromiumBeta;
  };

  services.pipewire.enable = true;

  xdg.portal.enable = true;
}

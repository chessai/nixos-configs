# Explanation of bluetooth configuration can be found here: https://nixos.wiki/wiki/Bluetooth
{ config, pkgs, ... }:

{
  home-manager.users.chessai.services.mpris-proxy.enable = true;

  services.blueman.enable = true;

  hardware = {
    bluetooth = {
      enable = true;

      #package = pkgs.bluezFull;

      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };

    pulseaudio = {
      # pulseaudio can configure system audio via `pkgs.pavucontrol`.
      enable = true;

      package = pkgs.pulseaudioFull;

      #extraModules = [ pkgs.pulseaudio-modules-bt ];

      #configFile = pkgs.writeText "default.pa" ''
      #  load-module module-bluetooth-policy
      #  load-module module-bluetooth-discover
      #'';
    };
  };
}

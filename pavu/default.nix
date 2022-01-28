# Explanation of bluetooth configuration can be found here: https://nixos.wiki/wiki/Bluetooth
{ config, pkgs, ... }:

{
  home-manager.users.chessai.services.mpris-proxy.enable = true;

  services.blueman.enable = true;

  hardware = {
    bluetooth = {
      enable = true;

      package = pkgs.bluezFull;
    };

    pulseaudio = {
      # pulseaudio can configure system audio via `pkgs.pavucontrol`.
      enable = true;

      package = pkgs.pulseaudioFull;
    };
  };
}

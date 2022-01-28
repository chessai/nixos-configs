{ config, pkgs, ... }:

{
  services.blueman.enable = true;

  hardware = {
    bluetooth.enable = true;

    pulseaudio = {
      # enable pulseaudio volume control.
      # this can configured via pkgs.pavucontrol.
      enable = true;
    };
  };
}

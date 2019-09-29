{ config, pkgs, ... }:

{
  hardware = {
    pulseaudio = {
      # enable pulseaudio volume control.
      # this can configured via pkgs.pavucontrol.
      enable = true;
    };
  };
}

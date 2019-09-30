{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    autorun = true; # run on boot
    layout = "us";
    desktopManager = {
      default = "none";
      xterm.enable = false;
    };
    displayManager = {
      lightdm = {
        enable = true;
        background = "${./lightdm/stars_at_night.png}";
        greeters = {
          enso = {
            enable = true;
            blur = false;
            brightness = 7;
            theme.name = "arc";
          };
        };
      };
    };
    windowManager.i3 = {
      enable = true;
      #configFile = ./i3/config
    };

    # Enable touchpad support.
    libinput.enable = true;
  };
}

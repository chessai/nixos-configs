{ config, pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;

    # there is some weird bug when this is set to true.
    # when presented with any lightdm greeter, after a certain
    # number of seconds (about 30, i think), the monitor goes black
    # and the computer does not respond to keystrokes. i have no idea
    # why this happens. the only way to get into the computer at that
    # point is to force shutdown and login within the 30 seconds.
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
      configFile = "/home/chessai/.config/i3/config";
    };

    # Enable touchpad support.
    libinput.enable = true;
  };
}

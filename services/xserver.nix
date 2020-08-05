{ ... }:

{
  services.xserver = {
    enable = true;
    autorun = true;
    layout = "us";

    videoDrivers = [
      "intel"
      "modesetting"
    ];

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      lightdm = {
        enable = true;
        # background = "${./stars_at_night.png}";
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
      configFile = ./i3-config;
    };

    xkbOptions = "caps:swapescape";

    libinput.enable = true;
  };
}

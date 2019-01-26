{
  services.xserver = {
    enable = true;
    layout = "us";
    #xkbOptions = "escape:swapcaps"; # "eurosign:e";
   
    # Enable touchpad support.
    libinput.enable = true;

    desktopManager.xfce.enable = true;
  };
}

{
  services.xserver = {
    enable = true;
    autorun = false; 
    layout = "us";
    desktopManager.default = "none";
    desktopManager.xterm.enable = false;
    displayManager.lightdm.enable = true;
    windowManager.i3.enable = true;
   
    # Enable touchpad support.
    libinput.enable = true;
  };
}

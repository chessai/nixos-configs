{
  services.xserver.videoDrivers = [ "vesa" ];

  # Enable XMonad Tiling Manager
  services.xserver.windowManager.xmonad.enable = false;
  services.xserver.windowManager.xmonad.enableContribAndExtras = false;
  services.xserver.windowManager.xmonad.extraPackages = haskellPackages:
    [
      haskellPackages.xmonad-contrib
      haskellPackages.monad-logger
      haskellPackages.text
    ];
}

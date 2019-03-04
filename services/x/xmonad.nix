{ config, pkgs, lib, ... }:

{
  # Enable XMonad Tiling Manager
  services.xserver.windowManager.xmonad = {
    enable = false;
    enableContribAndExtras = false;
    extraPackages = haskellPackages:
      [ haskellPackages.xmonad-contrib
        haskellPackages.monad-logger
        haskellPackages.text
      ];
  };
}

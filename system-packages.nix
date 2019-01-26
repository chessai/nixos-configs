{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    ag
    gist
    git-lfs 
    (if config.services.xserver.enable then gitAndTools.gitFull else git)
    wpa_supplicant
    wpa_supplicant_gui
  ];
}

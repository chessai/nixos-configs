{ config, pkgs, ... }:

{
  imports = [
    ./adb/config.nix
    ./bash/config.nix
    ./gist/config.nix
#    ./git/config.nix
    ./vim/config.nix
    ./rooster/config.nix
    ./snoopy/config.nix
  ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep <pkg>
  environment.systemPackages = with pkgs; [
    (if config.services.xserver.enable then gitAndTools.gitFull else git)
    ack
    ag # silver-searcher
    bind # nslookup,dig
    clipmenu
    curl
    git-lfs
    strace
    sudo
    tcpdump
    tmux
    unzip
    wget
    wpa_supplicant
    wpa_supplicant_gui
    youtube-dl
    zip
  ];
}

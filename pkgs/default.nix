{ config, pkgs, ... }:

{
  imports = [
    ./bash/config.nix
    ./gist/config.nix
    ./vim/config.nix
  ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep <pkg>
  environment.systemPackages = with pkgs; [
    (if config.services.xserver.enable then gitAndTools.gitFull else git)
    ack
    ag # silver-searcher
    bind # nslookup,dig
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

{ config, pkgs, ... }:

{
  imports = [
    ./adb/config.nix
    ./bash/config.nix
    ./gist/config.nix
    ./pong/config.nix
    ./vim/config.nix
    ./rooster/config.nix
    ./snoopy/config.nix
    ./gp/config.nix
  ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep <pkg>
  environment.systemPackages = with pkgs; [
    (if config.services.xserver.enable then gitAndTools.gitFull else git)
    #haskell-ci
    #json-autotype
    #openconnect_pa
    ack
    ag # silver-searcher
    alacritty
    bind # nslookup,dig
    cachix
    clipmenu
    cloc
    cmake
    curl
    file
    gcc
    ghcid
    git-lfs
    gitAndTools.hub
    htop
    jq
    mosh
    net_snmp
    nixops
    #nixpkgs-pkgconfig # wrapper for pkgconfig that points it to the proper stuff
    pavucontrol
    sshpass
    strace
    sudo
    tcpdump
    tcpflow
    tldr
    tmux
    tree
    unzip
    wget
    wpa_supplicant
    wpa_supplicant_gui
    xfce4-14.xfce4-screenshooter #what a strange prefix.
    youtube-dl
    zip
  ];
}

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let 
  keys = import ./keys.nix;
in {
  imports =
    [ ./hardware-configuration.nix
      ./vim.nix
      ./aliases.nix 
      ./users.nix 
      ./boot-loader.nix 
      ./postgresql.nix
      ./elasticsearch.nix
      ./networking.nix 
      ./xserver.nix 
      ./openssh.nix 
      ./time.nix
      ./zfs.nix
      ./system-packages.nix
      #./caches.nix
      #./docker.nix
      #./xmonad.nix
      #./toxvpn.nix
      #./snmpd.nix 
    ];
  
  nixpkgs.config.allowUnfree = true;

  nix = {
    buildCores = 8;
    trustedUsers = [ "root" "chessai" ];
  };

  programs.bash.enableCompletion = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
  services.avahi.enable = true;
  services.printing.enable = true; # Enable CUPS to print documents.

  systemd.coredump = {
    enable = true;
    # increase size of core dump to 2^30 bytes
    extraConfig = "ExternalSizeMax=${toString (8 * 1024 * 1024 * 1024)}";
  };

  hardware.pulseaudio.enable = true;
  sound.mediaKeys.enable = true;

  system.stateVersion = "18.09";
}

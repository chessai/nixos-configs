# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let 
  keys = import ./keys.nix;
in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Use custom vim configuration.
      ./vim.nix
    ];
  
  # Allow software with proprietary licenses
  nixpkgs.config.allowUnfree = true;
  
  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.efiInstallAsRemovable = false;
  #boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.efi.canTouchEfiVariables = true;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "nodev"; # or "nodev" for efi only
  
  networking.hostId = "2def5b23";
  networking.hostName = "chessai-kudu"; # Define your hostname.
  networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  # i18n = {
    #  consoleFont = "Lat2-Terminus16";
    #  consoleKeyMap = "us";
    #  defaultLocale = "en_US.UTF-8";
    # };
  
  # custom stuff for nix
  nix = {
    buildCores = 8;

    binaryCaches = [
      "http://cache.earthtools.ca"
      "http://cache.nixos.org"
      "https://nixcache.reflex-frp.org"
    ];
    
    binaryCachePublicKeys = [
      "c2d.localnet-1:YTVKcy9ZO3tqPNxRqeYEYxSpUH5C8ykZ9ImUKuugf4c="
      "ryantrinkle.com-1:JJiAKaRv9mWgpVAz8dwewnZe0AzzEAzPkagE9SP5NWI="      
    ];
  };

  # Set your time zone.
  time.timeZone = "America/New_York";
  time.hardwareClockInLocalTime = false;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    ag
    elasticsearch
    ghc
    gist
    git
    nix-repl
    postgresql
    quassel
    teamspeak_client
    tmate
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.bash.enableCompletion = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:
  
  services.postgresql.enable = true;

  services.elasticsearch.enable = true;
  services.elasticsearch.package = pkgs.elasticsearch5;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";
  services.openssh.passwordAuthentication = false;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "escape:swapcaps"; # "eurosign:e";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  
  # Enable XMonad Tiling Manager
  services.xserver.windowManager.xmonad.enable = true;
  services.xserver.windowManager.xmonad.enableContribAndExtras = true;
  services.xserver.windowManager.xmonad.extraPackages = haskellPackages: [
    haskellPackages.xmonad-contrib
    haskellPackages.monad-logger
    haskellPackages.text
  ];
  hardware.pulseaudio.enable = true;
  sound.mediaKeys.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.chessai = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" ];
  };
  
  users.extraUsers.animus = {
    isNormalUser = true;
    extraGroups = [];
  };
  
  users.extraUsers.postgres = {
    isNormalUser = true;
    extraGroups = [];
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.03"; # Did you read the comment?

}

{ config, pkgs, lib, ... }:

{
  imports = [
    ./alacritty
    ./bash
    ./chromium
    ./direnv
    ./git
    ./jq
    #./man
    ./ssh
    #./sway
    ./vim
    ./vscode
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  home-manager.users.chessai = {
    # home-manager needs a separate
    # nixpkgs config, since you could
    # certainly want a separation there
    nixpkgs.config = {
      allowUnfree = true;
    };

    # Fails to build and idc about it
    manual.manpages.enable = false;

    home = {
      packages = with pkgs; [
        arandr
        cabal2nix
        cabal-install
        file
        fd
        ghcid
        gist
        htop
        mosh
        #monero
        #monero-gui
        nix-prefetch-git
        pavucontrol
        ripgrep
        silver-searcher
        tcpdump
        tldr
        tree
        wget
        wireguard-tools
        xfce.xfce4-screenshooter
        xxd
        youtube-dl
      ];

      # home-manager tries to use <nixpkgs> if this is less than 20.09
      stateVersion = "22.11";
    };
  };
}

{ config, pkgs, lib, ... }:

{
  imports = [
    ./alacritty
    ./bash
    ./chromium
    ./git
    ./jq
    #./man
    #./mpv
    #./nix-deploy
    ./ssh
    #./sway
    ./vim
    # ./vscode
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
        monero
        monero-gui
        nix-prefetch-git
        pavucontrol
        ripgrep
        silver-searcher
        tldr
        tree
        wget
        xfce.xfce4-screenshooter
        youtube-dl
      ];

      #sessionVariables = {
      #  GRAPHVIZ_DOT = "${pkgs.graphviz}/bin/dot";
      #  LC_CTYPE = "en_US.UTF-8";
      #  EDITOR = "${pkgs.vim}/bin/vim";
      #};

      # it tries to use <nixpkgs> if this is less than 20.09
      stateVersion = "21.11";
    };
  };
}

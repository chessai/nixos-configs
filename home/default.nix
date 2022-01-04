{ config, pkgs, lib, ... }:

with {
  homeManager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/release-21.11.tar.gz";
    sha256 = "1c8gxm86zshr2zj9dvr02qs7y3m46gqavr6wyv01r09jfd99dxz9";
  };
};

{
  imports = [
    "${homeManager}/nixos"
    #./alacritty
    #./bash
    #./chromium
    #./git
    #./jq
    #./man
    #./mpv
    #./nix-deploy
    #./ssh
    #./sway
    #./vim
    # ./vscode
  ];

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
        file
        fd
        ghcid
        gist
        htop
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
    };
  };
}

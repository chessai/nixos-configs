{ config, pkgs, lib, ... }:

with {
  # TODO: 20.03 should be some kind of input
  homeManager = builtins.fetchTarball "https://github.com/rycee/home-manager/archive/release-20.03.tar.gz";
};

{
  imports = [
    "${homeManager}/nixos"
    ./alacritty
    ./bash
    ./chromium
    ./firefox
    ./git
    ./jq
    ./mpv
    ./nix-deploy
    ./ssh
    ./sway
    ./vim
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
        bind
        cabal-install
        cabal2nix
        file
        ghcid
        gist
        haskell-ci
        haskellPackages.hasktags
        htop
        nix-deploy
        nix-prefetch-git
        obs-studio
        pavucontrol
        remmina
        ripgrep
        silver-searcher
        stylish-haskell
        teamspeak_client
        tldr
        tree
        wget
        wireshark-qt
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

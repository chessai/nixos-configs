{ config, pkgs, lib, ... }:

with {
  # TODO: 19.09 should be some kind of input
  homeManager = builtins.fetchTarball "https://github.com/rycee/home-manager/archive/release-19.09.tar.gz";

  secrets = import ./secrets.nix;

  homeDir = "/home/chessai";
};

{
  imports = [
    "${homeManager}/nixos"
    ./alacritty
    ./bash
    ./chromium
    ./git
    ./jq
    ./mpv
    ./rooster/config.nix
    ./vim
  ];

  home-manager.users.chessai.home = {
    packages = with pkgs; [
      cabal-install
      cabal2nix
      cachix
      ghcid
      gist
      haskell-ci
      niv
      openconnect_pa
      rooster
      teamspeak_client
      tree
      xfce4-14.xfce4-screenshooter
    ];

    sessionVariables = {
      GRAPHVIZ_DOT = "${pkgs.graphviz}/bin/dot";
      LC_CTYPE = "en_US.UTF-8";
      GITHUB_TOKEN = secrets.niv;
      EDITOR = "${pkgs.vim}/bin/vim";
    };
  };
}

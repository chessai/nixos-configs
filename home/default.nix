{ config, pkgs, lib, ... }:

with {
  # TODO: 19.09 should be some kind of input
  homeManager = builtins.fetchTarball "https://github.com/rycee/home-manager/archive/release-19.09.tar.gz";

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
    ./vim
  ];

  home-manager.users.chessai.home = {
    packages = with pkgs; [
      cabal-install
      gist 
      openconnect_pa
      #chromium
      #json-autotype
      #syncplay
      #teamspeak_client
      niv
      #nix-tools
    ];
  };


}

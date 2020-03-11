{ config, pkgs, lib, ... }:

with {
  # TODO: 19.09 should be some kind of input
  homeManager = builtins.fetchTarball "https://github.com/rycee/home-manager/archive/release-19.09.tar.gz";
};

{
  imports = [
    "${homeManager}/nixos"
    ./alacritty
    ./bash
    ./chromium
    #./hie
    ./git
    ./jq
    ./mpv
    #./rooster/config.nix
    ./vim
    ./vscode
    ./hinit/config.nix
    ./pretty-ghci/config.nix
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
        cabal-install
        cabal2nix
        cachix
        ghcid
        gist
        #haskell-ci
        #niv
        hinit
        pavucontrol
        pp-ghci
        #rooster
        silver-searcher
        teamspeak_client
        tree
        xfce4-14.xfce4-screenshooter
      ];

      sessionVariables = {
        GRAPHVIZ_DOT = "${pkgs.graphviz}/bin/dot";
        LC_CTYPE = "en_US.UTF-8";
        #GITHUB_TOKEN = secrets.niv;
        EDITOR = "${pkgs.vim}/bin/vim";
      };
    };
  };
}

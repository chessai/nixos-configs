{ config, pkgs, lib, ... }:

with {
  # TODO: 19.09 should be some kind of input
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
    ./sway
    ./vim
    ./vscode
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
        file
        ghcid
        gist
        haskellPackages.hasktags
        htop
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
      ];

      #sessionVariables = {
      #  GRAPHVIZ_DOT = "${pkgs.graphviz}/bin/dot";
      #  LC_CTYPE = "en_US.UTF-8";
      #  EDITOR = "${pkgs.vim}/bin/vim";
      #};
    };
  };
}

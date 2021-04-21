{ config, pkgs, lib, ... }:

with {
  homeManager = builtins.fetchTarball {
    url = "https://github.com/rycee/home-manager/archive/release-20.09.tar.gz";
  };
};

{
  imports = [
    "${homeManager}/nixos"
    ./alacritty
    ./bash
    #./chromium
    ./git
    ./jq
    ./man
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
        fd
        ghcid
        gist
        haskell-language-server
        haskellPackages.hasktags
        htop
        nix-deploy
        nix-prefetch-git
        obs-studio
        pavucontrol
        remmina
        ripgrep
        rnix-lsp
        silver-searcher
        stylish-haskell
        teamspeak_client
        tldr
        tree
        wget
        wireshark-qt
        xfce.xfce4-screenshooter
        youtube-dl
      ] ++ (with pkgs.nodePackages; [
        typescript-language-server
        vscode-html-languageserver-bin
        vscode-css-languageserver-bin
        bash-language-server
        yaml-language-server
      ]);

      #sessionVariables = {
      #  GRAPHVIZ_DOT = "${pkgs.graphviz}/bin/dot";
      #  LC_CTYPE = "en_US.UTF-8";
      #  EDITOR = "${pkgs.vim}/bin/vim";
      #};
    };
  };
}

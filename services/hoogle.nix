{
  services = {
    hoogle = {
      enable = true;
      packages = _: [ ];
      #haskellPackages = (import ./home/chessai/work/mercury-web-backend/default.nix {}).hsPkgs;
    };
  };
}

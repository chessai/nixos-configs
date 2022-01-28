{ nixpkgs
, ...
}:

{ hardwareConfig # path to hardware-configuration.nix
, imports ? [] # path to other imports
}@args:

{ ... }:

{
  nix.nixPath = [ "nixpkgs=${nixpkgs}" ];

  imports = [
    hardwareConfig

    ./fonts
    ./games
    ./home
    ./networking
    ./nix
    ./pavu
    ./scripts
    ./security
    ./services
    ./sops
    ./systemd
    ./time
    ./users
  ] ++ (args.imports or []);
}

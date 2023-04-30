{
  description = "chessai's nixos flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #chainweb = {
    #  url = "github:kadena-io/chainweb-node-nixos-module";
    #};
  };

  outputs =
    { self
    , nixpkgs
    , sops-nix
    , home-manager
    #, chainweb
    , ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        kudu = lib.nixosSystem {
          inherit system;
          modules =
            let
              mainModule = import ./configuration-kudu.nix inputs;
              sopsModule = sops-nix.nixosModules.sops;
              hmModule = home-manager.nixosModules.home-manager;
              #chainwebModule = chainweb.nixosModules.chainweb-node;
            in [
              mainModule
              sopsModule
              hmModule
              #chainwebModule
            ];
         };
      };

      # TODO: refactor with flake-utils.lib.eachDefaultSystem
      devShell.x86_64-linux = pkgs.mkShell {
        nativeBuildInputs = [
          sops-nix.packages.${system}.sops-import-keys-hook
          sops-nix.packages.${system}.ssh-to-pgp
          sops-nix.packages.${system}.sops-init-gpg-key
        ];
        sopsPGPKeyDirs = [
          "./pubkeys"
        ];
      };
    };
}

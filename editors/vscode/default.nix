{ pkgs, ... }:

let
  hls = (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
    vsix = ./alanz.vscode-hie-server-0.2.1.vsix;
    mktplcRef = {
      name = "alanz.vscode-hie-server";
      publisher = "Alan_Zimmerman"; # can't include a space
      version = "0.1.1";
    };
  }).overrideAttrs (_: {
    dontUnpack = true;
  });

  vscode-with-extensions = pkgs.vscode-with-extensions.override {
    vscodeExtensions = with pkgs.vscode-extensions; [
      bbenoist.Nix
    ] ++ [
      hls
    ];
  };
in

{
  environment.systemPackages = [
    vscode-with-extensions
  ];
}

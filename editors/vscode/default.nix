{ pkgs, lib, ... }:

let
  vscode-with-extensions = pkgs.vscode-with-extensions.override {
    vscodeExtensions = with pkgs.vscode-extensions; [
      bbenoist.Nix
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "alanz.vscode-hie-server";
        publisher = "Alan Zimmerman";
        version = "0.1.1";
        sha256 = lib.fakeSha256;
      }
    ];
  };
in

{
  environment.systemPackages = [
    #vscode-with-extensions
  ];
}

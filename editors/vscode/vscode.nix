{ stdenv }:

let
  buildExtension = {
    name,
    src,
    vscodeExtUniqueId,
    configurePhase ? ":",
    buildPhase ? ":",
    dontPatchELF ? true,
    dontStrip ? true,
    buildInputs ? [],
    ...
  }@args: ((builtins.removeAttrs args [ "vscodeExtUniqueId" ]) // stdenv.mkDerivation {
    name = "vscode-extension-${name}";
    inherit vscodeExtUniqueId;
    inherit configurePhase buildPhase dontPatchELF dontStrip;

    installPrefix = "share/vscode/extensions/${vscodeExtUniqueId}";

    installPhase = ''
      runHook preInstall

      mkdir -p "$out/$installPrefix"
      find . -mindepth 1 -maxdepth 1 | xargs -d'\n' mv -t "$out/$installPrefix/"

      runHook postInstall
    '';
  });

  buildMarketplaceExtension = {
    name,
    src,
  }@args: buildExtension {
    s
  };
in {
}

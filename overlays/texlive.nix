self: super:

{
  texFull = super.texlive.combine {
    inherit (super.texlive) scheme-full texdoc latex2e-help-tex-info;
    pkgFilter = pkg:
      pkg.tlType == "run"
      || pkg.tlType == "bin"
      || pkg.pname == "latex2e-help-texinfo";
  };
}

self: super:

let
  hlsVersion = "0.2.2";

  hls-ghc-executable = { ghcVersion, sha256 }: {
    execName = "haskell-language-server-${ghcVersion}";
    url = "https://github.com/haskell/haskell-language-server/releases/download/${hlsVersion}/haskell-language-server-Linux-${ghcVersion}.gz";
    inherit sha256;
  };

  hls-wrapper = {
    execName = "haskell-language-server-wrapper";
    url = "https://github.com/haskell/haskell-language-server/releases/download/${hlsVersion}/haskell-language-server-wrapper-Linux.gz";
    sha256 = "0xqqqmakimzi9y6frqd20yg9s637nwl248kpjgy6jga8rmgn5ppj";
  };
  hls-executables = [ hls-wrapper ] ++ builtins.map hls-ghc-executable [
    { ghcVersion = "8.6.5";  sha256 = "03958j8q7nxzg0vgsy0b6xf1p0wv4yglq0bc31349qjydihhq1js"; }
    { ghcVersion = "8.8.3";  sha256 = "0csl5j4164ac23mk0mzjwl9552q5iqi71qj7ggk8l28nf95bk4z9"; }
    { ghcVersion = "8.8.4";  sha256 = "17bsjdkhmkkjaq5qs0w6mna9833i45qh0b4bbmawymrmwzfpzi78"; }
    { ghcVersion = "8.10.1"; sha256 = "06ap264fpc0g901576wlwwrf3b2flc93x160cya1xkvbbab56559"; }
  ];

  fetchHls = executables:
    super.runCommand "haskell-language-server-${hlsVersion}" {} ''
      mkdir -p "$out"/bin
      ${super.lib.concatMapStringsSep
        "\n"
        ({ execName, url, sha256 }: ''gunzip -c ${builtins.fetchurl { inherit url sha256; }} > "$out"/bin/${execName}'')
        executables
      }
      chmod +x "$out"/bin/*
    '';
in {
  haskell-language-server = fetchHls hls-executables;
}

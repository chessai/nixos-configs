{ config, pkgs, ... }:

{
  programs.bash = {
    enableCompletion = true;

    shellAliases = {
      # haskell
      #cabal = "${pkgs.cabal-install}/bin/cabal --with-pkg-config=${pkgs.gamari-pkgconfig}/pkg-config";
      cn = "cabal configure --enable-tests --enable-benchmarks";
      cnp = "cabal configure --enable-tests --enable-benchmarks --enable-profiling --ghc-options=-fprof-auto";
      cb = "cabal build";
      drep = "${pkgs.ghcid}/bin/ghcid -c cabal repl";
      nrep = "nix-shell --run \"${pkgs.ghcid}/bin/ghcid -c ${pkgs.cabal-install}/bin/cabal repl\"";
      ghc844 = "nix-shell -p haskell.compiler.ghc844";
      ghc865 = "nix-shell -p haskell.compiler.ghc865";
      ghc881 = "nix-shell -p haskell.compiler.ghc881";

      # unix utils
      ls = "${pkgs.coreutils}/bin/ls --color=auto";
      nm = "${pkgs.findutils}/bin/find . -name";
      par = "${pkgs.parallel}/bin/parallel";
      rsync = "${pkgs.rsync}/bin/rsync -aP --inplace";
      proc = "${pkgs.coreutils}/bin/ps axwwww | ${pkgs.gnugrep}/bin/grep -i";
      grep = "${pkgs.gnugrep}/bin/grep --color=auto";
      egrep = "${pkgs.gnugrep}/bin/grep -E --color=auto";
      fgrep = "${pkgs.gnugrep}/bin/grep -F --color=auto";
      diff = "${pkgs.colordiff}/bin/colordiff";
      #mount = "${pkgs.coreutils}/bin/mount | column -t";
      now = "${pkgs.coreutils}/bin/date +\"%T\"";
      ports = "${pkgs.unixtools.netstat}/bin/netstat -tulanp";
      # get top processes eating mem
      psmem = "ps auxf | ${pkgs.coreutils}/bin/sort -nr -k 4";
      psmem10 = "ps auxf | ${pkgs.coreutils}/bin/sort -nr -k 4 | ${pkgs.coreutils}/bin/head -n 10";
      # get top processes eating cpu
      pscpu = "ps auxf | ${pkgs.coreutils}/bin/sort -nr -k 3";
      pscpu10 = "ps auxf | ${pkgs.coreutils}/bin/sort -nr -k 3 | ${pkgs.coreutils}/bin/head -n 10";
      cpuinfo = "lscpu";

      # git
      gc = "${pkgs.git}/bin/git clone";
      gs = "${pkgs.git}/bin/git status";
      git-initial-commit = "${pkgs.git}/bin/git commit -m \"Creō ā nihilō\"";

      # cd
      ".0"  = "cd .";
      ".1"  = "cd ..";
      ".2"  = "cd ../..";
      ".3"  = "cd ../../..";
      ".4"  = "cd ../../../..";
      ".5"  = "cd ../../../../..";
      ".6"  = "cd ../../../../../..";
      ".7"  = "cd ../../../../../../..";
      ".8"  = "cd ../../../../../../../..";
      ".9"  = "cd ../../../../../../../../..";
      ".10" = "cd ../../../../../../../../../..";

      # some cmdline utils not backed by a proper package
      # FIXME: these are impure
      summon = "~/.local/bin/summon";
      grab = "~/.local/bin/grab";
      hit = "~/.local/bin/hit";
      knuckles = "~/.local/bin/knuckles";
    };
  };

  environment.systemPackages =
    let
      extractScript = pkgs.writeShellScriptBin "extract" ''
        if [ -z "$1" ]; then
          echo "Usage: extract </path/to/file>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|sz|ex|tar.bz2|tar.gz|tar.xz>"
        else
          if [ -f $1 ]; then
            case $1 in
              *.tar.bz2)   ${pkgs.gnutar} xvjf ./$1    ;;
              *.tar.gz)    ${pkgs.gnutar} xvzf ./$1    ;;
              *.tar.xz)    ${pkgs.gnutar} xvJf ./$1    ;;
              *.lzma)      ${pkgs.xz} --format=lzma --decompress ./$1 ;;
              *.bz2)       ${pkgs.bzip2}/bin/bzip2 -d ./$1 ;;
              *.rar)       ${pkgs.unrar}/bin/unrar x -ad ./$1 ;;
              *.gz)        ${pkgs.gzip}/bin/gzip -d ./$1      ;;
              *.tar)       ${pkgs.gnutar} xvf ./$1     ;;
              *.tbz2)      ${pkgs.gnutar} xvjf ./$1    ;;
              *.tgz)       ${pkgs.gnutar} xvzf ./$1    ;;
              *.zip)       ${pkgs.unzip}/bin/unzip ./$1       ;;
              *.Z)         ${pkgs.ncompress}/bin/uncompress ./$1  ;;
              *.7z)        ${pkgs.p7zip}/bin/7z x ./$1        ;;
              *.xz)        ${pkgs.xz}/bin/xz --decompress ./$1 ;;
              *.exe)       ${pkgs.cabextract}/bin/cabextract ./$1  ;;
              *.cab)       ${pkgs.cabextract}/bin/cabextract ./$1  ;;
              *)           echo "extract: '$1' - unknown archive method" ;;
            esac
          else
              echo "$1 - file does not exist"
          fi
       fi
    '';

    gcL3Script = pkgs.writeShellScriptBin "gc-l3" ''
      if [ -z "$1" ]; then
        echo "Usage: gc-l3 <repo>"
      else
        ${pkgs.git}/bin/git clone git@github.com:layer-3-communications/$1
      fi
    '';

    in [
      extractScript
      gcL3Script
    ];

  environment.interactiveShellInit = ''
    # use vi keybindings for commandline
    set -o vi
  '';

}

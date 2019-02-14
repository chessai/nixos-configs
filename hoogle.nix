{
  services.hoogle = {
    enable = true;
    port = 3000;
    # IF YOU INCLUDE PACKAGES THAT ARE INCLUDED BY DEFAULT,
    # THIS FAILS  
    packages = hp: with hp; [
      arraylist
      automata
      blaze-colonnade
      btree
      bytestring-encodings
      chronos
      colonnade
      concurrent-st
      constrictor
      contiguous
      contiguous-checked
      country
      disjoint-containers
      dot
      enum-types
      (hp.lib.dontCheck freq)
      # hedgehog-classes
      impure-containers
      initialize
      ip
      lacroix
      leancheck-enum-instances
      lens
      lucid-colonnade
      microlens
      mmap
      monus
      non-empty-containers
      patience
      ping
      posix-api
      primitive-checked
      primitive-containers
      primitive-maybe
      primitive-sort
      quantification
      quickcheck-classes
      quickcheck-enum-instances
      refined
      #reflex
      #reflex-dom-colonnade
      semirings
      (hp.lib.dontCheck siphon)
      sockets
      streaming
      streaming-bytestring
      streaming-fft
      #streaming-utils
      teleshell
      these
      torsor
      #trasa
      #trasa-client
      #trasa-reflex
      #trasa-server
      unlifted-list
      unpacked-either
      unpacked-maybe
      unpacked-maybe-numeric
      unpacked-these
      unpacked-validation
      wizard
      (hp.lib.doJailbreak yesod-colonnade)
      yesod-ip
    ];
  };  
}

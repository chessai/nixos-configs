{
  home-manager.users.chessai.programs.ssh = {
    enable = true;

    extraConfig = ''
      Host *.internal.mercury.co *.internal.mercury.com 10.*.*.*
        User chessai

      Host *.internal.mercury.co *.internal.mercury.com 10.*.*.*
        User mercury
        IdentityFile ~/.ssh/mercury
    '';
  };
}

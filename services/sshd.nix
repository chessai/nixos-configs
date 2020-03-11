{ ... }:

{
  services.openssh = {
    enable = true;

    permitRootLogin = "no";

    passwordAuthentication = false;
    challengeResponseAuthentication = false;
  };

  programs.ssh.extraConfig = ''
    Host *.internal.mercury.co *.internal.mercury.com 10.*.*.*
    User chessai
  '';
}

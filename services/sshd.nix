{
  services.openssh = {
    enable = true;
    
    permitRootLogin = "no";

    passwordAuthentication = false;
    challengeResponseAuthentication = false;
  };
}

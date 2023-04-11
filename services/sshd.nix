{ ... }:

{
  services.openssh = {
    enable = true;

    permitRootLogin = "no";
  };
}

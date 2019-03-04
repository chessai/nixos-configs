{
  services.zfs = {
    autoSnapshot = {
      enable = true;
      hourly = 2;
    };
  };
}

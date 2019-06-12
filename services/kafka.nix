{
  services.apache-kafka = {
    enable = false;
    brokerId = 1;
    hostname = "127.0.0.1";
    zookeeper = "127.0.0.1:2181";
  };
}

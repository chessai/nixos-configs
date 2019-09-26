{
  services.apache-kafka = {
    enable = true;
    brokerId = 1;
    hostname = "127.0.0.1";
    zookeeper = "127.0.0.1:2181";
    extraProperties = ''
      offsets.topic.replication.factor=1
    '';
  };
}

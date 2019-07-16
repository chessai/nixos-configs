{
  services.openssh = {
    enable = true;

    permitRootLogin = "no";

    passwordAuthentication = false;
    challengeResponseAuthentication = false;
  };

  programs.ssh.extraConfig = ''
    Host ansible-server
      HostName 192.168.254.254
      User noc
    Host collector-cos
      HostName 10.100.112.202
      User noc
      ProxyJump ansible-server
    Host qts
      HostName 192.168.254.10
      User noc
      ProxyJump ansible-server
    Host collector-iah
      HostName 10.100.122.67
      User noc
      ProxyJump ansible-server
    Host nsh-collector
      HostName 192.168.254.10
      User noc
      ProxyJump ansible-server
    Host nsh-diamond
      HostName 167.183.11.14
      User noc
      ProxyJump ansible-server
    Host lab
      HostName 10.10.10.232
      User amartin
    Host lab2
      HostName 10.10.10.98
      User dcartwright
    Host dpisd-collector
      HostName 10.100.154.12
      User noc
      ProxyJump ansible-server
    Host cyfair-collector
      HostName 10.100.155.22
      User noc
      ProxyJump ansible-server
    Host siem-op-1
      HostName 192.168.254.19
      User noc
    Host dcg-collector
      HostName 10.100.128.94
      User noc
      ProxyJump ansible-server
    Host sch-collector
      HostName 10.100.102.13
      User noc
      ProxyJump ansible-server
    Host fcs-collector
      HostName 10.100.100.253
      User noc
      ProxyJump ansible-server
    Host kisd-collector
      HostName 10.100.140.101
      User noc
      ProxyJump ansible-server
    Host new-lab
      HostName 10.10.10.234
      User allsight
    Host uab-collector
      HostName 192.168.11.20
      User noc
      ProxyJump ansible-server
    Host allsight-cos
      HostName 10.100.112.202
      User allsight
      ProxyJump ansible-server
    Host dcartwright-cos
      HostName 10.100.112.202
      User dcartwright
      ProxyJump ansible-server
  '';
}

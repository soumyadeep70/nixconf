{ ... }:

{
  services.networking = {
    networkmanager.enable = true;
    hostName = host;
    timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # service discovery in local network using mDNS or DNS-SD
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
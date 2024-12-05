{ ... }:

{
  # ┌─────────────────┐
  # │      Audio      │
  # └─────────────────┘
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  # ┌─────────────────────┐
  # │      Bluetooth      │
  # └─────────────────────┘
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;


  # ┌───────────────────┐
  # │      Network      │
  # └───────────────────┘
  services.networking = {
    networkmanager.enable = true;
    hostName = host;
    timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
  };


  # ┌───────────────────┐
  # │     Printing      │
  # └───────────────────┘
  ipp-usb.enable = true;  # Internet Printing Protocol over usb
  services.printing = {
    enable = true;
    drivers = [
      # pkgs.hplipWithPlugin
    ];
  };


  # ┌───────────────────────────┐
  # │     Service Discovery     │
  # └───────────────────────────┘
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
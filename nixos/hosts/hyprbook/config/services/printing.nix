{ ... }:

{
  ipp-usb.enable = true;  # Internet Printing Protocol over usb
  services.printing = {
    enable = true;
    drivers = [
      # pkgs.hplipWithPlugin
    ];
  };
}
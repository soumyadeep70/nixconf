{ ... }:

{
  boot = {
    # Kernel
    kernelPackages = pkgs.linuxPackages_zen;

    # Bootloader
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    # Initrd
    initrd.enable = true;
    initrd.systemd.enable = true;

    # Graphical boot screen
    plymouth.enable = true;
  };

  # register some binary formats with kernel
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
}
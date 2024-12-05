{ pkgs, ... }:

{
  # ┌───────────────────┐
  # │      Kernel       │
  # └───────────────────┘
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "splash"
      "quiet"
      "fbcon=nodefer"
      "vt.global_cursor_default=0"
      "kernel.modules_disabled=1"
      "lsm=landlock,lockdown,yama,integrity,apparmor,bpf,tomoyo,selinux"
      "usbcore.autosuspend=-1"
      "video4linux"
      "acpi_rev_override=5"
      "security=selinux"
    ];
  };
  programs.appimage = {
    enable = true;
    binfmt = true;
  };


  # ┌──────────────────────┐
  # │      Bootloader      │
  # └──────────────────────┘
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd = {
      enable = true;
      systemd.enable = true;
    };
    plymouth.enable = true;
  };


  # ┌───────────────────┐
  # │      Drivers      │
  # └───────────────────┘
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-compute-runtime
      intel-media-driver
      intel-vaapi-driver.override { enableHybridCodec = true; }
      vaapiVdpau
      libvdpau-va-gl
      mesa
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      intel-media-driver
      intel-vaapi-driver.override { enableHybridCodec = true; }
      vaapiVdpau
      mesa
      libvdpau-va-gl
    ];
  };


  # ┌─────────────────┐
  # │      Others     │
  # └─────────────────┘
  systemd.package = pkgs.systemd.override {
    withSelinux = true;
  };
  environment.systemPackages = with pkgs; [
    policycoreutils         # SELinux utilities
  ];
}
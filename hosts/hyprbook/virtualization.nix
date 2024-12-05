{ ... }:

{
  # ┌─────────────────────────────────┐
  # │       Virtualization (QEMU)     │
  # └─────────────────────────────────┘
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  
  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
    spice-webdavd.enable = true;
  };


  # ┌─────────────────────────────────────┐
  # │      Containerization (Podman)      │
  # └─────────────────────────────────────┘
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
}
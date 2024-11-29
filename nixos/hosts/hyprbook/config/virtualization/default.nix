{ ... }:

{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  
  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
    spice-webdavd.enable = true;
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
}
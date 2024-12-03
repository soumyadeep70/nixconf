{ ... }:

{
  users.users."cypher" = {
    homeMode = "755";
    isNormalUser = true;
    description = "Primary User";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "scanner"
      "lp"
    ];
  };
}
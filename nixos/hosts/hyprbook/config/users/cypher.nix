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

  # Steam is only available with this user
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Needed For Some Steam Games
  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
  };
}
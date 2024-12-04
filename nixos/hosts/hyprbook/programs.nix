{ pkgs, ... }:

{
  # ┌────────────────────────┐
  # │      File-manager      │
  # └────────────────────────┘
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  
  # ┌─────────────────┐
  # │      Steam      │
  # └─────────────────┘
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
  };
}
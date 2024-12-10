{ pkgs, ... }:

{
  # ┌────────────────────────┐
  # │      File-manager      │
  # └────────────────────────┘
  programs.nautilus = {
    enable = true;
    nautilus-open-in-blackbox.enable = true;
  };
  programs.nautilus-open-any-terminal.enable = true;


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
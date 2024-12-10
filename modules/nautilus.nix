{ config, lib, pkgs, ... }:

let 

  cfg = config.programs.nautilus;

in {

  options = {
    programs.nautilus = {
      enable = lib.mkEnableOption "Nautilus, the Gnome file manager";
      nautilus-open-in-blackbox.enable = lib.mkEnableOption "Adds an context-entry for opening in blackbox";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.nautilus ];
    services.dbus.packages = [ pkgs.nautilus ];
    systemd.packages = [ pkgs.nautilus ];

    environment.systemPackages = lib.mkIf cfg.nautilus-open-in-blackbox.enable [
      pkgs.nautilus-open-in-blackbox
    ];
  };
}
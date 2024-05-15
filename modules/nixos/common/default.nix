{ lib, config, pkgs, ... }:

with lib;
with lib.jhilker98;
let cfg = config.jhilker98.nixos.common;
in {
  options.jhilker98.nixos.common = {
    enable = mkEnableOption "Core NixOS module";
  };
  config = mkIf cfg.enable {
    system.stateVersion = "23.11";
    services = { account-daemon.enable = true; };
    users = {
      defaultUserShell = pkgs.zsh;
      users = {
        jhilker = {
          isNormalUser = true;
          isSystemUser = false;
          extraGroups =
            [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
          initialPassword = "jhilker";
          shell = pkgs.fish;
          home = "/home/jhilker";
        createHome = "false";
        };
      };
    };
  };
}

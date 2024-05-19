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
    services = { accounts-daemon.enable = true; };
    users = {
      defaultUserShell = pkgs.zsh;
      users = {
        jhilker = {
          isNormalUser = true;
          isSystemUser = false;
          extraGroups =
            [ "wheel" "networkmanager" "audio" ]; # Enable ‘sudo’ for the user.
          initialPassword = "jhilker";
          shell = pkgs.fish;
          home = "/home/jhilker";
        };
      };
    };
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "gtk2";
    };
    security = {
      sudo.enable = false;
      doas = {
        enable = true;
        extraRules = [{
          users = [ "jhilker" ];
          keepEnv = true;
          persist = true;
        }];
      };
      pam.services = { sddm.enableKwallet = true; };
      polkit.enable = true;
    };
  };
}

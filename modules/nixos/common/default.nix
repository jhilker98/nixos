{ lib, config, pkgs, inputs, ... }:

with lib;
with lib.jhilker98;

let cfg = config.jhilker98.common;
in {
  options.jhilker98.common = { enable = mkEnableOption "Common"; };

  config = mkIf cfg.enable {
    users = {
      defaultUserShell = pkgs.zsh;
      users = {
        jhilker = {
          isNormalUser = true;
          isSystemUser = false;
          extraGroups =
            [ "wheel" "networkmanager" "audio" ]; # Enable ‘sudo’ for the user.
          initialPassword = sops.secrets.hosts.users.jhilker;
          shell = pkgs.fish;
          home = "/home/jhilker";
        };
      };
    };
    programs = {
      git.enable = true;
      neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
      };
      gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
        # pinentryFlavor = "gtk2";
        pinentryPackage = pkgs.pinentry-gtk2;
      };
      zsh.enable = true;
      fish.enable = true;
      dconf.enable = true;
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

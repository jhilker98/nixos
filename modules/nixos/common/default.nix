{ lib, config, pkgs, inputs, ... }:

with lib;
with lib.jhilker98;

let cfg = config.jhilker98.common;
in {
  options.jhilker98.common = { enable = mkEnableOption "Common"; };

  config = mkIf cfg.enable {
  nix = {
    package = pkgs.nixFlakes;
    settings = {
      #extraExperimentalFeaatures = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "daily";
    };
    optimise.automatic = true;
  };
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
    environment.systemPackages = with pkgs; [
      sops
    ];
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

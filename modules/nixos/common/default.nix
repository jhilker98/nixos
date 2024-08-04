{ lib, config, pkgs, inputs, ... }:

with lib;
with lib.jhilker98;

let cfg = config.jhilker98.common;
in {
  options.jhilker98.common = { enable = mkEnableOption "Common"; };

  config = mkIf cfg.enable {

    system.stateVersion = "23.11";
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
    home-manager.backupFileExtension = ".bak";
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
    environment.systemPackages = with pkgs; [ sops mkpasswd whois ];
    programs = {
      git = {
        enable = true;
        config = { safe.directory = "*"; };
      };
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
      sudo = {
        enable = true;
      };
      #doas = {
      #  enable = true;
      #  extraRules = [{
      #    users = [ "jhilker" ];
      #    keepEnv = true;
      #    persist = true;
      #  }];
      pam.services = { sddm.enableKwallet = true; };
      polkit.enable = true;
    };
    system.activationScripts = {
        base-dirs = {
          text = ''
            mkdir -p /nix/var/nix/profiles/per-user/jhilker
          '';
          deps = [ ];
        };
      };
  };

}

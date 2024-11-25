{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let cfg = config.jhilker98.gpg;
in {
  options.jhilker98.gpg = { enable = mkEnableOption "GPG"; };

  config = mkIf cfg.enable {
    programs.gpg.enable = true;
    services.gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gtk2;
      #pinentryPackage = pkgs.pinentry-tty;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableSshSupport = true;
      defaultCacheTtl = 86400;
      defaultCacheTtlSsh = 86400;
    };
    programs.keychain = {
      enable = true;
      keys = [ "id_ed25519" ];
    };
    home.packages = with pkgs; [
      sops
      age
      git-crypt
    ];
  };
}
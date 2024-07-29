{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let 
  cfg = config.jhilker98.mail;
in {
  options.jhilker98.mail = {
    enable = mkEnableOption "Enable email on my system.";
  };
  config = mkIf cfg.enable {
    programs = {
      neomutt = {
        enable = true;
      };
    };
    services = {
      mbsync = {
        enable = true;
      };
    };
  };
} 
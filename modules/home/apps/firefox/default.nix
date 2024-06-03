{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
 cfg = config.jhilker98.apps.firefox;
 in {
    options.jhilker98.apps.firefox = {
      enable = mkEnableOption "Whether to enable Firefox.";
    };
    config = mkIf cfg.enable {
      programs.firefox = {
        enable = true;
      };
    };
 }
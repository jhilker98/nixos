{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let cfg = config.jhilker98.theme;
in {
  options.jhilker98.theme = { enable = mkEnableOption "enable theme module"; };
  config = mkIf cfg.enable {
    stylix = { 
        targets = {
          grub.enable = true;
      };
    };
  };
}
{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let
  cfg = config.jhilker98.apps.pandoc;
in {
  options.jhilker98.apps.pandoc = {
    enable = mkEnableOption "Pandoc";
  };
  config = mkIf cfg.enable {

  };
}

{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
  cfg = config.jhilker98.desktop.qtile;
in {
  options.jhilker98.desktop.qtile = {
    enable = mkEnableOption "Enable qtile";
  };
  config = mkIf cfg.enable {

  };
}

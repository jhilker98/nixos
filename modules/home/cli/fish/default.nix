{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
  cfg = config.jhilker98.fish;
in {
  options.jhilker98.fish = {
    enable = mkEnableOption "Fish";
  };
  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
    };
  };
}

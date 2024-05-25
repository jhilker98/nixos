{config, inputs, lib, pkgs, ...}:
with lib; 
with lib.jhilker98;
let
  cfg = config.jhilker98.apps.lazygit;
in {
  options.jhilker98.apps.lazygit = {
    enable = mkEnableOption "Enable lazygit";
  };
  config = mkIf cfg.enable {
    programs.lazygit = {
      enable = true;
    };
  };
}

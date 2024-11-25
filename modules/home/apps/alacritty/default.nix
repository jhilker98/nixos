{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98; 
let cfg = config.jhilker98.apps.alacritty; 
in {
  options.jhilker98.apps.alacritty = {
    enable = mkEnableOption "Enable alacritty terminal";
  };
  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
    };
  };
}
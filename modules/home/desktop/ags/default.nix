{config, lib, pkgs, ...}:
with lib;
with lib.jhilker98;
let
  cfg = config.jhilker98.desktop.ags;
in {
  options.jhilker98.desktop.ags = {
    enable = mkEnableOption "Whether to enable AGS";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      ags
    ];

  };
}

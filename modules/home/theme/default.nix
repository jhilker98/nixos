{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;

let
  cfg = config.jhilker98.theme;
in {
  options.jhilker98.theme = {
    enable = mkEnableOption "Theme";
  };

  config = mkIf cfg.enable {
    stylix = {
      base16Scheme = "${inputs.base16-themes}/share/gruvbox-dark-hard.yaml";
    };
  };
}

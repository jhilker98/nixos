{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.cli.starship;
in {
options.jhilker98.cli.starship = { enable = mkEnableOption "Starship"; };
config = mkIf cfg.enable {
  programs.starship = {
    enable = true;
    settings = {
      line_break.disabled = true;
    };
  };
};
}
{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.calenar;
in {
options.jhilker98.calenar = { enable = mkEnableOption "calendar"; };
config = mkIf cfg.enable {
home.packages = with pkgs; [ gcalcli ];
};
}
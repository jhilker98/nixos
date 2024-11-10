{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.dev.nixvim;
in {
options.jhilker98.dev.nixvim = { enable = mkEnableOption "Nixvim"; };
config = mkIf cfg.enable {

};
}
{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.dev.langs.latex;
in {
options.jhilker98.dev.langs.latex = { enable = mkEnableOption "Latex"; };
config = mkIf cfg.enable {

};
}
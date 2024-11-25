{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.dev.langs.go;
in {
options.jhilker98.dev.langs.go = { enable = mkEnableOption "Golang"; };
config = mkIf cfg.enable {

};
}
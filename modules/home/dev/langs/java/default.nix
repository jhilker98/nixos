{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.dev.langs.java;
in {
options.jhilker98.dev.langs.java = { enable = mkEnableOption "Java"; };
config = mkIf cfg.enable {

};
}
{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.dev.langs.python;
in {
options.jhilker98.dev.langs.python = { enable = mkEnableOption "Python"; };
config = mkIf cfg.enable {

};
}
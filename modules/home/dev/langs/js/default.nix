{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.dev.langs.js;
in {
options.jhilker98.dev.langs.js = { enable = mkEnableOption "Javascript/Typescript"; };
config = mkIf cfg.enable {

};
}
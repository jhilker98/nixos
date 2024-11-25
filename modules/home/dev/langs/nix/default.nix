{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.dev.langs.nix;
in {
options.jhilker98.dev.langs.nix = { enable = mkEnableOption "Nix"; };
config = mkIf cfg.enable {

};
}
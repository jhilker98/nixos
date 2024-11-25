{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.apps.lazygit;
in {
options.jhilker98.apps.lazygit = { enable = mkEnableOption "Lazygit"; };
config = mkIf cfg.enable {
  programs.lazygit = {
    enable = true;
  };
};
}
{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.cli.fzf;
in {
options.jhilker98.cli.fzf = { enable = mkEnableOption "FZF"; };
config = mkIf cfg.enable {
  programs.fzf = {
    enable = true;
  };
};
}
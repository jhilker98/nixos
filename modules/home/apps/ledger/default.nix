{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.apps.ledger;
in {
options.jhilker98.apps.ledger = { enable = mkEnableOption "Ledger"; };
config = mkIf cfg.enable {
  home.packages = with pkgs; [
    beancount
    ledger
  ];

};
}

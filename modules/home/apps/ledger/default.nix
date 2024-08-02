{config, lib, inputs, pkgs, ...}:
with lib;
with lib.jhilker98;
let 
  cfg = config.jhilker98.apps.ledger;
  currentSys = pkgs.system;
in {
  options.jhilker98.apps.ledger = {
    enable = mkEnableOption "Ledger";
  };
  config = mkIf cfg.enable {
    home.packages = [
      pkgs.ledger
      pkgs.beancount
      inputs.paisa.outputs.packages.${currentSys}.default
    ];
  };
}

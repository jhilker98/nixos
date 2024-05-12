{ config, lib, pkgs, inputs, ...}:

with lib;
with lib.jhilker98; 
let
  cfg = config.jhilker98.services.waterNotifier;
in {
  options.jhilker98.services.waterNotifier = {

  };
  config = mkIf cfg.enable {

  };
};
  

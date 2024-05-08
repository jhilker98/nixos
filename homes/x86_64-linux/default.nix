{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: 
with lib;
with lib.jhilker98; 
let cfg = lib.jhilker98.common;
in {
  options.jhilker98.common = {
    enable = mkEnableOption "Common";
  };

  config = mkIf cfg.enable {
    home = {
      stateVersion = "23.11";
    };

    programs = {
      home-manager.enable = true;
    };
};

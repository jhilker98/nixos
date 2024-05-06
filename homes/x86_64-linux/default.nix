{
  lib,
  pkgs,
  inputs,
  config,
  ...
}: 
with lib;
with lib.jhilker; 
let cfg = lib.jhilker.common;
in {
  options.jhilker.common = {
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

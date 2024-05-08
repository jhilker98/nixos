{ lib, config, pkgs, inputs, ... }:

with lib;
with lib.jhilker98;
let
  is-linux = pkgs.stdenv.isLinux;

  cfg = config.jhilker98.common;
in {
  options.jhilker98.common = {
    enable = mkEnableOption "Common";
  };

  config = mkIf cfg.enable {
    home = {
      stateVersion = "23.11";
      username = "jhilker"; 
      packages = with pkgs; [];
    };

    programs = {
      home-manager.enable = true;
    };

    

    xdg.enable = true;
  };
}

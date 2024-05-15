{ lib, config, pkgs, ... }:

with lib;
with lib.jhilker98;
let
  cfg = config.jhilker98.nixos.common;
in {
  options.jhilker98.nixos.common = {
    enable = mkEnableOption "Core NixOS module";
  };
  config = mkIf cfg.enable {
    system.stateVersion = "23.11";
  };
}

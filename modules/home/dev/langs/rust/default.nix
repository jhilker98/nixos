{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let cfg = config.jhilker98.dev.langs.rust;
in {
  options.jhilker98.dev.langs.rust = { enable = mkEnableOption "Rust"; };
  config = mkIf cfg.enable { home.packages = with pkgs; [ rustc cargo ]; };
}

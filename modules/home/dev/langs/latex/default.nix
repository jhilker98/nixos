{ config, lib, pkgs, inputs, ... }:

with lib;
with lib.jhilker98;
let
  cfg = config.jhilker98.langs.latex;
in {
  options.jhilker98.langs.latex = {
   enable = mkEnableOption "Enable LaTeX";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
        texlive.combined.scheme-full
        auctex
    ];
  };
}

{ config, lib, pkgs, inputs, ... }:

with lib;
with lib.jhilker98;
let cfg = config.jhilker98.nixvim;
in {
  options.jhilker98.nixvim = {
   enable = mkEnableOption "Nixvim";
  };
  config = mkIf cfg.enable {
    programs = {
      nixvim = {
        enable = true;
        defaultEditor = true;
      };
      zsh.shellAliases = {
        "vim" = "nvim";
      };
      bash.shellAliases = {
        "vim" = "nvim";
      };
      fish.shellAliases = {
        "vim" = "nvim";
      };
    };
  };
}

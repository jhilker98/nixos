{ config, lib, pkgs, inputs, ... }:

with lib;
with lib.jhilker98;
let cfg = config.jhilker98.nixvim;
in {
  options.jhilker98.nixvim = { enable = mkEnableOption "Nixvim"; };
  config = mkIf cfg.enable {
    programs = {
      nixvim = {
        enable = true;
        defaultEditor = true;
	plugins = {
	  lightline.enable = true;
	  surround.enable = true;
	  fugitive.enable = true;
	  lsp.enable = true;
	};
      };
      zsh.shellAliases = { "vim" = "nvim"; };
      bash.shellAliases = { "vim" = "nvim"; };
      fish.shellAliases = { "vim" = "nvim"; };
    };
  };
}

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
        options = {
          number = true; # Show line numbers
          relativenumber = true; # Show relative line numbers
          shiftwidth = 2; # Tab width should be 2
          termguicolors = true;
        };
        extraPlugins = with pkgs.vimPlugins; [
          vim-nix
          nvim-fzf
          nvim-fzf-commands
        ];

        globals = { mapleader = " "; };
        plugins = {
          fugitive.enable = true;
          emmet.enable = true;
          which-key = { enable = true; };
	  lightline.enable = true;
        };
      };
      zsh.shellAliases = { "vim" = "nvim"; };
      bash.shellAliases = { "vim" = "nvim"; };
      fish.shellAliases = { "vim" = "nvim"; };
    };
  };
}

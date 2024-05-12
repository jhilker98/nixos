{ config, lib, pkgs, inputs, ... }:

with lib;
with lib.jhilker98;
let cfg = config.jhilker98.development.nixvim;
in {
  options.jhilker98.development.nixvim = { enable = mkEnableOption "Nixvim"; };
  config = mkIf cfg.enable {
    programs = {
      nixvim = {
        enable = true;
        defaultEditor = true;
        plugins = {
          lightline.enable = true;
          surround.enable = true;
          startify.enable = true;
          fugitive.enable = true;
          lsp.enable = true;
          which-key = {
            enable = true;
            registrations = { "<leader>g" = "Git"; };
          };
          nvim-autopairs.enable = true;
          nix.enable = true;
        };
        globals.mapleader = " ";
        keymaps = [
          {
            key = ";";
            action = ":";
          }
          {
            key = "<leader>gg";
            action = ":Git<CR>";
            options = {
              silent = true;
              desc = "Launch git";
            };
          }
        ];

      };
      zsh.shellAliases = { "vim" = "nvim"; };
      bash.shellAliases = { "vim" = "nvim"; };
      fish.shellAliases = { "vim" = "nvim"; };
    };
  };
}

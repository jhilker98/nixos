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
          fugitive.enable = true;
          lsp.enable = true;
        };
        keymaps = [
          {
            key = "<leader>hrr";
            action = ":luafile ~/.config/nvim/init.lua<CR>";
            options = {
              silent = true;
              desc = "Source the neovim config";
            };
          }

          {
            key = "<leader>gg";
            action = ":Git<CR>";
            options = {
              silent = true;
              desc = "Git status";
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

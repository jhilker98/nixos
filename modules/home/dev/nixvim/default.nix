{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.dev.nixvim;
in {
options.jhilker98.dev.nixvim = { enable = mkEnableOption "Nixvim"; };
config = mkIf cfg.enable {
  programs = {
      nixvim = {
        enable = true;
        defaultEditor = true;
        opts = {
          number = true;
          relativenumber = true;
          shiftwidth = 2;
        };
        plugins = {
          lightline.enable = true;
          vim-surround.enable = true;
          startify.enable = true;
          fugitive.enable = true;
          direnv.enable = true;
          comment.enable = true;
          todo-comments = { enable = true; };
          cmp = {
            enable = true;
            autoEnableSources = true;
          };
          obsidian = {
            enable = true;
            settings = {
              workspaces = [{
                name = "Vault";
                path = "~/Dropbox/Obsidian";
              }];
            };
          };

          lsp = {
            enable = true;
            servers = {
              bashls.enable = true;
              pyright.enable = true;
              gopls.enable = true;
              nixd.enable = true;
            };
          };
          which-key = {
            enable = true;
            settings.spec = [
              {
                __unkeyed-1 = "<leader>g";
                desc = "Git actions";
              }
            ];
          };
          nvim-autopairs.enable = true;
          nix.enable = true;
        };
        extraPlugins = with pkgs.vimPlugins; [
          nvim-web-devicons
        ];
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
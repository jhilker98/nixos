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
      packages = with pkgs;
      [
        chroma
        file
        fortune
        killall
        fastfetch
        p7zip
        thefuck
        unzip
      ];
    };

    programs = {
      home-manager.enable = true;
      nix-index.enable = true;
    };

    jhilker98 = {
      bat.enable = true;
      btop.enable = true;
      eza.enable = true;
      fzf.enable = true;
      gnupg.enable = true;
      tmux.enable = true;
      nixvim.enable = true;
      starship.enable = true;
      sops.enable = true;
      user.enable = true;
      vim.enable = false;
      yubikey.enable = true;
      zellij.enable = true;
      zoxide.enable = true;
      zsh.enable = true;
    };

    xdg.enable = true;
  };
}

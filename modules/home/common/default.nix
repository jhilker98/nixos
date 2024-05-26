{ lib, config, pkgs, inputs, ... }:

with lib;
with lib.jhilker98;
let
  is-linux = pkgs.stdenv.isLinux;

  cfg = config.jhilker98.common;
in {
  options.jhilker98 = {
    common = { enable = mkEnableOption "Common"; };
    development = { enable = mkEnableOption "Development"; };
  };

  config = mkIf cfg.enable {
    home = {
      stateVersion = "23.11";
      username = "jhilker";
      packages = with pkgs; [
        nixfmt
        plantuml
        units
        snowfallorg.flake
        sops
      ];
      shellAliases = {
        "ls" = "${pkgs.eza}/bin/eza -alh --group-directories-first";
        "cat" = "${pkgs.bat}/bin/bat -p";
      };
    };
    programs = {
      home-manager.enable = true;
      direnv.enable = true;
      #zsh = {
      #  enable = true;
      #  autocd = true;
      #  syntaxHighlighting.enable = true;
      #  autosuggestion.enable = true;
      #  dotDir = ".config/zsh";
      #};
    };
    sops = {
      defaultSopsFile = ../../../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "/home/jhilker/.config/sops/age/keys.txt";
    };
    xdg.enable = true;
    jhilker98 = {
      starship.enable = true;
      development = {
        emacs.enable = true;
        fzf.enable = true;
      };
      langs = { python.enable = true; };
      zsh.enable = true;
      fish.enable = true;
      services.waterNotifier = { enable = true; };
      gpg.enable = true;
      theme.enable = true;
    };
  };
}

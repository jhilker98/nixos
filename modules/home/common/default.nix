{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let
  is-linux = pkgs.stdenv.is-linux;
  cfg = config.jhilker98.common;
in {
  options.jhilker98.common = { enable = mkEnableOption "Common"; };
  config = mkIf cfg.enable {
    home = {
      stateVersion = "24.11"; # do not update
      username = "jhilker";
      packages = with pkgs; [
        nixfmt
        plantuml
        units
        snowfallorg.flake
        sops
        nixd
        sops
        age
        git-crypt
        calc
        glance
      ];
      shellAliases = {
        "ls" = "${pkgs.eza}/bin/eza -alh --group-directories-first";
        "cat" = "${pkgs.bat}/bin/bat -p";
      };
    };
    programs = { home-manager.enable = true; };
    sops = {
      defaultSopsFile = ../../../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
    };
    xdg = {
      enable = true;
      mime = { enable = true; };
      userDirs = {
        enable = true;
        extraConfig = { "XDG_SRC_DIR" = "${config.home.homeDirectory}/src"; };
      };
    };

    nix.settings.extra-experimental-features = [ "nix-command" "flakes" ];
  };
}

{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
  cfg = config.jhilker98.desktop.qtile;
in {
  options.jhilker98.desktop.qtile = {
    enable = mkEnableOption "Enable qtile";
  };
  config = mkIf cfg.enable {
    xdg.configFile."qtile" = {
      source = ./config;
      recursive = true;
    };
    xdg.configFile."qtile/theme.py".text = let
      colors = config.jhilker98.theme.colors;
    in ''
      wallpaper = ${inputs.nix-wallpaper.packages.${builtins.currentSystem}.default.override { preset = "gruvbox-dark"; }}
    '';
  };
}

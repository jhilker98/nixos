{ config, lib, pkgs, inputs, ... }:

with lib;
with lib.jhilker98;
let cfg = config.jhilker98.nixos.desktop;
in {
  options.jhilker98.nixos.desktop = {
    enable = mkEnableOption "Desktop";
    useWayland = mkEnableOption "Use Wayland instead of X11";
  };
  config = mkIf cfg.enable {
    services = {
      xserver = {
        enable = true;
        xkb.layout = "us";
        windowManager = {
          qtile = {
            enable = true;
            extraPackages = python3Packages:
              with python3Packages;
              [ qtile-extras ];
          };
        };
      };
      displaymanager = { sddm = { enable = true; }; };
      defaultSession = "none+qtile";
    };
  };
}

{ config, lib, pkgs, inputs, ... }:

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
        layout = "us";
        displayManager = {
          defaultSession = "none+qtile";
          sddm = {
            enable = true;
            theme = pkgs.sddm-sugar-dark;
          };
        };
        windowManager = {
          qtile = {
            enable = true;
            extraPackages = python3Packages:
              with python3Packages;
              [ qtile-extras ];
          };
        };
      };
    };
  };
}

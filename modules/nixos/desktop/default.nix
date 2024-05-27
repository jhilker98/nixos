{ config, lib, pkgs, inputs, ... }:

with lib;
with lib.jhilker98;
let cfg = config.jhilker98.desktop;
in {
  options.jhilker98.desktop = {
    enable = mkEnableOption "Desktop";
    useWayland = mkEnableOption "Use Wayland instead of X11";
    usePicom = mkEnableOption "Use a compositor";
  };
  config = mkIf cfg.enable {
    services = {
      xserver = {
        enable = true;
        xkb.layout = "us";
        windowManager = {
          qtile = {
            enable = true;
            backend = "x11";
            extraPackages = python3Packages:
              with python3Packages;
              [ qtile-extras ];
          };
        };
      };
      displayManager = {
        sddm = {
          enable = true;
          theme = "sugar-dark";
        };

        defaultSession = "none+qtile";
      };
    };
    environment.systemPackages = with pkgs; [
      libsForQt5.qt5.qtgraphicaleffects
      feh
      jhilker98.sddm-sugar-dark
    ];
  };
}

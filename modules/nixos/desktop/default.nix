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
            extraPackages = python3Packages:
              with python3Packages;
              [ qtile-extras ];
          };
        };
      };
      displayManager = {
        sddm = { 
          enable = true; 
          #theme = "sddm-sugar-dark";
        };

        defaultSession = "none+qtile";
      };
    };
    environment.systemPackages = with pkgs; [
      (callPackage ../../../packages/sddm-sugar-dark{})
      #self.packages.x86_64-linux.sddm-sugar-dark
    ];
  };
}

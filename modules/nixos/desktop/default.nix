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
        desktopManager.xfce.enable = true;
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
          theme = "sugar-dark";
        };

        defaultSession = "none+qtile";
      };
    };
    services.picom = mkIf cfg.usePicom {
      enable = true;
      #package = pkgs.picom.overrideAttrs (old: {
      #  src = pkgs.fetchFromGitHub {
      #    owner = "jonaburg";
      #    repo = "picom";
      #    rev = "e3c19cd7d1108d114552267f302548c113278d45";
      #    sha256 = "19nglw72mxbr47h1nva9fabzjv51s4fy6s1j893k4zvlhw0h5yp2";
      #  };
      #});
    };
    environment.systemPackages = with pkgs; [
      libsForQt5.qt5.qtgraphicaleffects
      feh
      jhilker98.sddm-sugar-dark
    ];
  };
}
{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;

let
  inherit (lib.jhilker98) mkOpt enabled;
  cfg = config.jhilker98.theme;
in {
  options.jhilker98.theme = {
    enable = mkEnableOption "Theme";
    colors = with config.lib.stylix.colors; {

    };
  };

  config = mkIf cfg.enable {
    stylix = {
      image = pkgs.fetchurl {
        url =
          "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/YRAJQAT4Dg-avesta-rezaeizadeh-unsplash.jpg";
        sha256 = "06n1dlkdhz5c287b72aplg3z90a3rixy79ryyjskmdfqy283r1an";
      };
      base16Scheme = "${inputs.base16-themes}/base16/gruvbox-dark-hard.yaml";
      targets = {
        nixvim = mkIf config.jhilker98.development.nixvim.enable { enable = true; };
      };
    };

  };
}

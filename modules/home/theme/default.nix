{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
  inherit (lib.jhilker98) mkOpt enabled;
cfg = config.jhilker98.theme;
in {
options.jhilker98.theme = { 
 enable = mkEnableOption "theme"; 
 colors = with config.lib.stylix.colors; {
      black = mkOpt types.str "${base00}" "My black color";
      red = mkOpt types.str "${base08}" "My red color";
      green = mkOpt types.str "${base0B}" "My green color";
      orange = mkOpt types.str "${base09}" "My orange color";
      yellow  = mkOpt types.str "${base0A}" "My yellow color";
      blue = mkOpt types.str "${base0D}" "My blue color";
      purple = mkOpt types.str "${base0E}" "My purple color";
      teal = mkOpt types.str "${base0C}" "My teal color";
      white = mkOpt types.str "${base06}" "My white color";
    };
    effects = {};
    fonts = {
     sans = mkOption types.str "" "My default sans-serif font.";
     serif = mkOption types.str "" "My default serif font.";

     mono = mkOption types.str "" "My default monospace font.";
     emoji = mkOption types.str "" "My default emoji font.";
    };
 
  };
config = mkIf cfg.enable {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/base16/gruvbox-dark-hard.yaml";
  };
};
}
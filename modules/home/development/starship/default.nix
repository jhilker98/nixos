{ lib, config, pkgs, ... }:

with lib;
with lib.jhilker98;
let cfg = config.jhilker98.development.starship;
in {
  options.jhilker98.starship = { enable = mkEnableOption "Starship"; };

  config = mkIf cfg.enable {
    programs = {
      starship = {
        enable = true;
        enableZshIntegration = mkIf config.jhilker98.development.zsh.enable true;
        enableBashIntegration = mkIf config.jhilker98.development.bash.enable true;
        enableFishIntegration = mkIf config.jhilker98.development.fish.enable true;
        settings = { line_break.disabled = true; };
      };
    };
  };
}

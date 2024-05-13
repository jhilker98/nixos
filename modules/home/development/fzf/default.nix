{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let cfg = config.jhilker98.development.fzf;
in {
  options.jhilker98.development.fzf = { enable = mkEnableOption "FZF"; };

  config = mkIf cfg.enable {
    programs = {
      fzf = {
        enable = true;
        enableZshIntegration = mkIf config.jhilker98.zsh.enable;
        enableBashIntegration = mkIf config.jhilker98.bash.enable;
        enableFishIntegration = mkIf config.jhilker98.fish.enable;
      };
      bash.initExtra = ''
        source ${inputs.fzf-marks}/fzf-marks.plugin.zsh
      '';
      zsh.initExtra = ''
        source ${inputs.fzf-marks}/fzf-marks.plugin.zsh
      '';

      fish.initExtra = ''
        source ${inputs.fzf-marks}/conf.d/fzf-marks.plugin.fish
      '';
    };
  };

}

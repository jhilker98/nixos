{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let cfg = config.jhilker98.dev.fzf;
in {
  options.jhilker98.dev.fzf = { enable = mkEnableOption "FZF"; };

  config = mkIf cfg.enable {
    programs = {
      fzf = {
        enable = true;
        enableZshIntegration = config.jhilker98.zsh.enable;
        enableBashIntegration = config.jhilker98.bash.enable;
        enableFishIntegration = config.jhilker98.fish.enable;
      };
      bash.initExtra = ''
        source ${inputs.fzf-marks}/fzf-marks.plugin.zsh
      '';
      zsh.initExtra = ''
        source ${inputs.fzf-marks}/fzf-marks.plugin.zsh
      '';

      fish.interactiveShellInit = ''
        source ${inputs.fzf-marks}/conf.d/fzf-marks.plugin.fish
      '';
    };
  };

}

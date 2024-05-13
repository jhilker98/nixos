{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let cfg = config.jhilker98.development.fzf;
in {
  options.jhilker98.development.fzf = {
    enable = mkEnableOption "FZF";
    bookmarks = { enable = mkEnableOption "FZF-marks"; };
  };

  config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = mkIf config.jhilker98.zsh.enable;
      enableBashIntegration = mkIf config.jhilker98.bash.enable;
      enableFishIntegration = mkIf config.jhilker98.fish.enable;
    };
    programs.bash.initExtra =
      mkIf lib.and config.jhilker98.bash.enable cfg.bookmarks.enable ''
        source ${inputs.fzf-marks}/fzf-marks.plugin.bash
      '';
    programs.zsh.initExtra =
      mkIf lib.and config.jhilker98.zsh.enable cfg.bookmarks.enable ''
        source ${inputs.fzf-marks}/fzf-marks.plugin.zsh
      '';

  };

}

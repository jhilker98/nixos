{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let cfg = config.jhilker98.development.fzf;
in {
  options.jhilker98.development.fzf = {
    enable = mkEnableOption "FZF";
    bookmarks = {
      enable = mkEnableOption
    };
  };

  config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = mkIf config.jhilker98.zsh.enable;
    };
  };

}

{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let cfg = config.jhilker98.dev.vscode;
in {
  options.jhilker98.dev.vscode = {
    enable = mkEnableOption "Whether to enable VSCode or not.";
  };
  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        vscode.vim
        vspacecode.whichkey
      ];
    };
    stylix.targets.vscode.enable = true;
  };
}

{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let
  cfg = config.jhilker98.langs.python;
in {
  options.jhilker98.langs.python = {
    enable = mkEnableOption "Enable python";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      (python3.withPackages (p:
          with p; [
            fontforge
            numpy
            pandas
            flask
            virtualenvwrapper
            pip
            # httpx
            pygobject3
          ]))

        nodePackages.pyright
      ];
      home.sessionVariables = {
        "VIRTUALENVWRAPPER_PYTHON" = "/home/jhilker/.nix-profile/bin/python3";
      };
      programs.zsh.initExtra = ''
      source ${pkgs.python3Packages.virtualenvwrapper}/bin/virtualenvwrapper.sh
      '';
      programs.bash.initExtra = ''
      source ${pkgs.python3Packages.virtualenvwrapper}/bin/virtualenvwrapper.sh
      '';
  };
}

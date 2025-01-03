{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let cfg = config.jhilker98.dev.langs.python;
in {
  options.jhilker98.dev.langs.python = { enable = mkEnableOption "Python"; };
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
          httpx
          pygobject3
        ]))

      pyright
    ];
    home.sessionVariables = {
      "VIRTUALENVWRAPPER_PYTHON" =
        "${config.home.homeDirectory}/.nix-profile/bin/python3";
      "PROJECT_HOME" = "${config.home.homeDirectory}/src/python";
    };
    programs.zsh.initExtra = ''
      source ${pkgs.python3Packages.virtualenvwrapper}/bin/virtualenvwrapper.sh
    '';
    programs.bash.initExtra = ''
      source ${pkgs.python3Packages.virtualenvwrapper}/bin/virtualenvwrapper.sh
    '';
  };
}

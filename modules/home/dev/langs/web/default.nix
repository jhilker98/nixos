{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.dev.langs.web;
in {
options.jhilker98.dev.langs.web = { enable = mkEnableOption "Web Languages"; };
config = mkIf cfg.enable {
  home.packages = with pkgs; [
    astro-language-server
  ];
};
}

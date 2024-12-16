{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.calendar;
in {
options.jhilker98.calendar = { enable = mkEnableOption "calendar"; };
config = mkIf cfg.enable {
  home.packages = with pkgs; [ gcalcli ];
  home.file.".gcalclirc".text = ''
    --client-id=${config.sops.secrets."gcal/client_id"}
    --client-secret=${config.sops.secrets."gcal/client_secret"}
  '';
};
}
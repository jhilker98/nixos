{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let cfg = config.jhilker98.calendar;
in {
  options.jhilker98.calendar = { enable = mkEnableOption "calendar"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ gcalcli calcurse ];
    sops.secrets = {
      "gcal/client_id" = { };
      "gcal/client_secret" = { };
    };
    xdg.configFile."gcalcli/config.toml".source =
      (pkgs.formats.toml { }).generate "config" {
        auth = {
          client_id = config.sops.secrets."gcal/client_id".path;
          client_secret = config.sops.secrets."gcal/client_secret".path;
        };
      };
  };

}

{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
  cfg = config.jhilker98.theme;
in {
  options.jhilker98.theme = {
    enable = mkEnableOption  "enable theme module";
  };
  config = mkIf cfg.enable {
    stylix.image = pkgs.fetchurl {
    url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
    sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
  };
  };
}

{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.dev.emacs;
in {
options.jhilker98.dev.emacs = { enable = mkEnableOption "Emacs"; };
config = mkIf cfg.enable {
  programs.emacs = {
      enable = true;
      package = pkgs.emacs30;
    };
    services.emacs = { enable = true; };
    xdg.configFile."doom" = {
      source = ./config;
      recursive = true;
    };
    home = {
      sessionVariables."DOOMDIR" =
        "$HOME/.dotfiles/modules/home/dev/emacs/config";
      packages = with pkgs; [
        gcc
        binutils
        (ripgrep.override { withPCRE2 = true; })
        gnutls
        gnumake
        fd
        imagemagick
        zstd
        sqlite
        editorconfig-core-c
        emacs-all-the-icons-fonts
        gh
      ];
    };
};
}

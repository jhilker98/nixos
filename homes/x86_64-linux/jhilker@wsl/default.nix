{
# Snowfall Lib provides a customized `lib` instance with access to your flake's library
# as well as the libraries available from your flake's inputs.
lib,
# An instance of `pkgs` with your overlays and packages applied is also available.
pkgs,
# You also have access to your flake's inputs.
inputs,

# All other arguments come from the home home.
config, ... }:
with lib.jhilker98; {

  jhilker98 = {
    common.enable = true;
    starship.enable = true;
    dev = {
      enable = true;
      emacs.enable = true;
      nixvim.enable = true;
    };

    zsh.enable = true;
    bash.enable = true;
    theme.enable = true;

    git.enable = true;
    apps = {
      lazygit.enable = true;
      ledger.enable = true;
    };
  };
  home.packages = with pkgs; [
    qpdf
    zlib
    wakatime
    ttfautohint
    nodejs
    nodePackages.npm
    nodePackages.tailwindcss
    nodePackages.postcss-cli
    nodePackages.typescript
    nodePackages.degit
    nodePackages.postcss
    rustc
    cargo
    go
    jq
    pup
    #libby
    hugo
    nix-prefetch-git
    ranger
    nodePackages.pnpm
    graphite-cli
    bitwarden-cli
    iamb
    jq
  ];
  home.sessionVariables = {
    "VIRTUALENVWRAPPER_PYTHON" = "/home/jhilker/.nix-profile/bin/python3";
  };
}

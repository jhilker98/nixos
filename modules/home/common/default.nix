{ lib, config, pkgs, inputs, ... }:

with lib;
with lib.jhilker98;
let
  is-linux = pkgs.stdenv.isLinux;

  cfg = config.jhilker98.common;
in {
  options.jhilker98 = {
    common = { enable = mkEnableOption "Common"; };
    development = { enable = mkEnableOption "Development"; };
  };

  config = mkIf cfg.enable {
    nix.package = pkgs.nixFlakes;

    home = {
      stateVersion = "23.11";
      username = "jhilker";
      packages = with pkgs; [
        texlive.combined.scheme-full
        qpdf
        cheat
        auctex
        zlib
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
        act
        tldr
        wakatime
        ttfautohint
        nodePackages.pyright
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
        thefuck
        jq
        pup
        #libby
        hugo
        nix-prefetch-git
        ranger
        nodePackages.pnpm
        graphite-cli
        bitwarden-cli
        nixfmt
        plantuml
        mermaid-cli
        units
        snowfallorg.flake
      ];
    };
    programs = {
      home-manager.enable = true;
      #zsh = {
      #  enable = true;
      #  autocd = true;
      #  syntaxHighlighting.enable = true;
      #  autosuggestion.enable = true;
      #  dotDir = ".config/zsh";	
      #};
      starship = {
	enable = true;
	settings.line_break.disabled = true;
      };	
    };
	jhilker98 = {
	  emacs.enable = true;
	  zsh.enable = true;
	  git.enable = true;
	  gpg.enable = true;
	};
  };
}

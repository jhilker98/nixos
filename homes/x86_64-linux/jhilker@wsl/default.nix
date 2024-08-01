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
    desktop = {
      qtile.enable = true;
    };
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
    (pkgs.writers.writePython3Bin "rdate" { libraries = [ ]; } ''
import random as r
import argparse
parser = argparse.ArgumentParser(description="Generates a random date")
parser.add_argument("-y",
                    "--year",
                    help="Generate a date in a particular year",
                    action='store', dest='year', default="")

parser.add_argument("-n",
                    "--number",
                    help="Generate a certain number of dates",
                    action='store', dest='number', default=1)
args = parser.parse_args()
dates = {
        "Jan": 31,
        "Feb": 28,
        "Mar": 31,
        "Apr": 30,
        "May": 31,
        "Jun": 30,
        "Jul": 31,
        "Aug": 31,
        "Sep": 30,
        "Oct": 31,
        "Nov": 30,
        "Dec": 31
        }
year = vars(args)['year']
number = int(vars(args)['number'])
for num in range(number):
    month = r.choice(list(dates.keys()))
    day = r.randint(1, dates[month])
    print(f'{day:02} {month} {year}')
    '')
  ];
  home.sessionVariables = {
    "VIRTUALENVWRAPPER_PYTHON" = "/home/jhilker/.nix-profile/bin/python3";
  };
  programs.git.signing.gpgPath = "/mnt/c/Program Files (x86)/GnuPG/bin/gpg.exe";

}

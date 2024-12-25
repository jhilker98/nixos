{ lib, config, pkgs, inputs, username ? "camoh", ... }:

with lib.jhilker98; {
  jhilker98 = {
    common.enable = true;
    calendar.enable = true;
    git.enable = true;
    cli = {
      starship.enable = true;
      zsh.enable = true;
    };
    dev = {
      enable = true;
      nixvim.enable = true;
      emacs.enable = true;
      langs = { rust.enable = true; };
    };
  };

  home = {
    sessionVariables = {
      "WSLHOME" = "/mnt/c/Users/camoh";
      "VIRTUALENVWRAPPER_PYTHON" = "/home/jhilker/.nix-profile/bin/python3";
      "DISPLAY" =
        "$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0";
      "GPG_TTY" = "$(tty)";
    };
    packages = with pkgs; [
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
  };
  programs.git.signing.gpgPath = "/mnt/c/Program Files (x86)/GnuPG/bin/gpg.exe";
}

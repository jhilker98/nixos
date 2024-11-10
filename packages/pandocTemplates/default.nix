{config, lib, inputs, pkgs, stdenv, fetchFromGitHub, ...}: {

eisvogel = stdenv.mkDerivation {
    pname = "eisvogel-pandoc-template";
    installPhase = ''
    cp -r . $out/
    '';
    src = fetchFromGitHub {
      owner = "Wandmalfarbe";
      repo = "pandoc-latex-template";
      rev = "0fd152d9d1054b34befcb3c56106d2dd6ebc2c47"; # eisvogel 
      sha256 = "J0INJBMuiK9WKYfeK+TShJXv6BrUdEyeaVfxGQq4kx0="; # eisvogel
    };
  };
}
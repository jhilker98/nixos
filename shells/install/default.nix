{lib, inputs, namespace, pkgs, mkShell, ...}:

mkShell {
  packages = with pkgs; [
    git
  ];
  shellHook = ''
    echo "Installing JHOS";
  '';
}

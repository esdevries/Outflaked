# devenv.nix
{ pkgs, ... }:

{
  name = "lms42-dev-shell";

  packages = with pkgs; [
    python313Full
    python313Packages.gevent
    python313Packages.pip
    poetry
    nodejs
    nodePackages.npm
    postgresql_14
    glibcLocales
    gcc
    gcc.cc.lib
  ];

  enterShell = ''
    echo ""
    echo -e "\033[1;32m✔ Development shell activated successfully\033[0m"
    echo "📦 Python version: $(python3 --version)"
    echo "📦 Pip version:    $(pip --version | cut -d ' ' -f2)"
    echo "📦 Poetry version: $(poetry --version)"
    echo "📦 Node.js version: $(node --version)"
    echo "📦 npm version:     $(npm --version)"
    echo ""
  '';
}

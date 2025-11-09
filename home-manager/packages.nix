{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    devenv
    direnv
    fastfetch
    home-manager
    nixd
    nixfmt-rfc-style
    openssh_gssapi
  ];
}

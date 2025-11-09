{ pkgs, ... }:
{
  nix.package = pkgs.nix;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  nix.settings.auto-optimise-store = true;
  nix.settings.warn-dirty = false;
}

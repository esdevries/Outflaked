{ profile, ... }:
{
  imports = [
    ./modules/collection.nix
    ./packages.nix
  ];

  home = {
    username = profile.userName;
    homeDirectory = "/home/${profile.userName}";
    stateVersion = "24.11";

    sessionVariables = {
      EDITOR = "nano";
    };

    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.nix-profile/bin"
      "/nix/var/nix/profiles/default/bin"
    ];
  };
}

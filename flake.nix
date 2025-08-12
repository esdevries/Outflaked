{
  description = "Outflaked Home-Manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      home-manager,
      nixpkgs,
      nix-vscode-extensions,
      ...
    }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
        overlays = [ nix-vscode-extensions.overlays.default ];
      };

      profile = {
        userName = "esdevries";
        fullName = "Erwin de Vries";
        gitEmail = "git.unbalance278@passinbox.com";
      };
    in
    {
      homeConfigurations.${profile.userName} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home-manager/home.nix
        ];

        extraSpecialArgs = {
          inherit profile;
        };
      };
    };
}

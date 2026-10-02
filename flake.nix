{
  description = "nix-darwin system flake";

  inputs = {
    # Keep nixpkgs, nix-darwin, and Home Manager on the same release.
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Use unstable only for packages explicitly selected in home.nix.
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    inputs@{
      nix-darwin,
      home-manager,
      ...
    }:

    let
      # Apply the same system and user configuration to both Macs.
      commonModules = [
        ./configuration.nix

        home-manager.darwinModules.home-manager
        ./modules/home-manager.nix

        ./modules/defaults/dock.nix
        ./modules/defaults/finder.nix
        ./modules/defaults/login-window.nix
        ./modules/defaults/text-input.nix
        ./modules/defaults/trackpad.nix
        ./modules/defaults/window-manager.nix
      ];
    in
    {
      darwinConfigurations = {
        # Build with: darwin-rebuild build --flake .#Leis-Mac-mini
        "Leis-Mac-mini" = nix-darwin.lib.darwinSystem {
          modules = commonModules ++ [
            ./hosts/mac-mini.nix
          ];

          # Make the pinned inputs available to the modules.
          specialArgs = { inherit inputs; };
        };

        # Build with: darwin-rebuild build --flake .#Leis-MacBook-Pro
        "Leis-MacBook-Pro" = nix-darwin.lib.darwinSystem {
          modules = commonModules ++ [
            ./hosts/macbook-pro.nix
          ];

          # Make the pinned inputs available to the modules.
          specialArgs = { inherit inputs; };
        };
      };
    };
}

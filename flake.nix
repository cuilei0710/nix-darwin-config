{
  description = "nix-darwin system flake";

  inputs = {
    # Use Nixpkgs 26.05 for Darwin.
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";

    # Use Nixpkgs unstable for selected packages.
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Use nix-darwin 26.05 with Nixpkgs 26.05.
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Use Home Manager 26.05 with Nixpkgs 26.05.
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      nix-darwin,
      home-manager,
      ...
    }:

    let
      # Define modules shared by all Darwin systems.
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
        # Build the MacBook Pro configuration.
        # $ darwin-rebuild build --flake .#Leis-MacBook-Pro
        "Leis-MacBook-Pro" = nix-darwin.lib.darwinSystem {
          modules = commonModules ++ [
            ./hosts/macbook-pro.nix
          ];

          # Pass flake inputs to Darwin modules.
          specialArgs = { inherit inputs; };
        };

        # Build the Mac mini configuration.
        # $ darwin-rebuild build --flake .#Leis-Mac-mini
        "Leis-Mac-mini" = nix-darwin.lib.darwinSystem {
          modules = commonModules ++ [
            ./hosts/mac-mini.nix
          ];

          # Pass flake inputs to Darwin modules.
          specialArgs = { inherit inputs; };
        };
      };
    };
}

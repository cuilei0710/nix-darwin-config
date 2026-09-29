{
  description = "nix-darwin system flake";

  inputs = {
    # Use Nixpkgs 26.05.
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";

    # Use Nixpkgs unstable for selected packages.
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Use nix-darwin with Nixpkgs 26.05.
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Use Home Manager 26.05.
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      nix-darwin,
      home-manager,
      ...
    }:
    {
      darwinConfigurations = {
        # Build darwin flake using:
        # $ darwin-rebuild build --flake .#Leis-MacBook-Pro
        "Leis-MacBook-Pro" = nix-darwin.lib.darwinSystem {
          modules = [
            ./configuration.nix
            ./hosts/macbook-pro.nix

            home-manager.darwinModules.home-manager
            ./modules/home-manager.nix

            ./modules/defaults/text-input.nix
            ./modules/defaults/trackpad.nix
            ./modules/defaults/finder.nix
            ./modules/defaults/dock.nix
            ./modules/defaults/login-window.nix
          ];

          # Pass flake inputs to the configuration.
          specialArgs = { inherit inputs; };
        };

        # Build darwin flake using:
        # $ darwin-rebuild build --flake .#Leis-Mac-mini
        "Leis-Mac-mini" = nix-darwin.lib.darwinSystem {
          modules = [
            ./configuration.nix
            ./hosts/mac-mini.nix

            home-manager.darwinModules.home-manager
            ./modules/home-manager.nix

            ./modules/defaults/text-input.nix
            ./modules/defaults/trackpad.nix
            ./modules/defaults/finder.nix
            ./modules/defaults/dock.nix
            ./modules/defaults/login-window.nix
          ];

          # Pass flake inputs to the configuration.
          specialArgs = { inherit inputs; };
        };
      };
    };
}

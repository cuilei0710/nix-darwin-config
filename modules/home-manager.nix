{ inputs, ... }:

{
  home-manager = {
    # Use the same package set and profile as the system configuration.
    useGlobalPkgs = true;
    useUserPackages = true;

    # Pass flake inputs to user modules that need them.
    extraSpecialArgs = { inherit inputs; };

    # Load the configuration for the primary user.
    users.leo = ../home.nix;
  };
}

{ inputs, ... }:

{
  home-manager = {
    # Use the system configuration's package set.
    useGlobalPkgs = true;

    # Install packages to the user profile.
    useUserPackages = true;

    # Pass flake inputs to Home Manager modules.
    extraSpecialArgs = { inherit inputs; };

    # Configure the user with Home Manager.
    users.leo = ../home.nix;
  };
}

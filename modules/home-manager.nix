{ inputs, ... }:

{
  home-manager = {
    # Use the system configuration's pkgs argument.
    useGlobalPkgs = true;

    # Install user packages through the system user profile.
    useUserPackages = true;

    # Pass flake inputs to Home Manager modules.
    extraSpecialArgs = { inherit inputs; };

    # Configure the Home Manager user.
    users.leo = ../home.nix;
  };
}

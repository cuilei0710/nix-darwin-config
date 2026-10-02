{ pkgs, inputs, ... }:

{
  # Set the primary user for user-specific system options.
  system.primaryUser = "leo";

  # Set the user's home directory.
  users.users.leo.home = "/Users/leo";

  # Configure system-wide Nixpkgs.
  nixpkgs = {
    # Allow unfree packages.
    config.allowUnfree = true;

    overlays = [
      (final: _prev: {
        # Make Nixpkgs unstable available as pkgs.unstable.
        unstable = import inputs.nixpkgs-unstable {
          inherit (final.stdenv.hostPlatform) system;
          inherit (final) config;
        };
      })
    ];
  };

  nix = {
    # Use the stable Lix package set.
    package = pkgs.lixPackageSets.stable.lix;

    # Enable the Nix command and flakes.
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # Disable legacy Nix channels.
    channel.enable = false;

    # Automatically optimise the Nix store.
    optimise.automatic = true;
  };

  # Set the configuration revision from the top-level flake.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Set the nix-darwin state version.
  system.stateVersion = 6;
}

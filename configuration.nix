{ pkgs, inputs, ... }:

{
  # The primary user of the system.
  system.primaryUser = "leo";

  # Define the user's home directory.
  users.users.leo.home = "/Users/leo";

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  nix = {
    # Use the stable Lix package set as the system Nix implementation.
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

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}

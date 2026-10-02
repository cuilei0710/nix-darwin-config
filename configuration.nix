{ pkgs, inputs, ... }:

{
  # Identify the user whose preferences nix-darwin manages.
  system.primaryUser = "leo";
  users.users.leo.home = "/Users/leo";

  # Enable the macOS application firewall on both machines.
  networking.applicationFirewall.enable = true;

  # Share one package set between the system and Home Manager.
  nixpkgs = {
    # Both hosts use Apple silicon.
    hostPlatform = "aarch64-darwin";

    # Permit packages with unfree licenses when explicitly selected.
    config.allowUnfree = true;

    # Expose the unstable package set as pkgs.unstable.
    # Import it for the same platform and with the same package policy.
    overlays = [
      (final: _prev: {
        unstable = import inputs.nixpkgs-unstable {
          inherit (final.stdenv.hostPlatform) system;
          inherit (final) config;
        };
      })
    ];
  };

  nix = {
    # Use Lix as the Nix implementation.
    package = pkgs.lixPackageSets.stable.lix;

    # Enable the CLI features required by this flake configuration.
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # Manage package sources through flake inputs instead of channels.
    channel.enable = false;

    # Remove unreferenced store paths automatically each week.
    gc.automatic = true;

    # Deduplicate identical files in the Nix store automatically.
    optimise.automatic = true;
  };

  # Record the source revision in the resulting system when available.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Keep this at the version used when this machine was first configured.
  # Changing it can alter compatibility defaults; it does not upgrade packages.
  system.stateVersion = 6;
}

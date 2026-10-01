{ ... }:

{
  # Set the platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Set the user-friendly computer name.
  networking.computerName = "Lei's Mac mini";

  # Set the system hostname.
  networking.hostName = "Leis-Mac-mini";
}

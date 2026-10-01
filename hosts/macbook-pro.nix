{ ... }:

{
  # Set the platform where the configuration will run.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Set the user-friendly computer name.
  networking.computerName = "Lei's MacBook Pro";

  # Set the system hostname.
  networking.hostName = "Leis-MacBook-Pro";

  # Enable Touch ID for sudo.
  security.pam.services.sudo_local.touchIdAuth = true;
}

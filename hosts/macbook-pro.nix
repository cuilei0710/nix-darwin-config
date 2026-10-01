{ ... }:

{
  # Set the device name.
  _module.args.deviceName = "MacBook Pro";

  # Set the platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Set the user-friendly computer name.
  networking.computerName = "Lei's MacBook Pro";

  # Set the system hostname.
  networking.hostName = "Leis-MacBook-Pro";

  # Enable Touch ID for sudo.
  security.pam.services.sudo_local.touchIdAuth = true;
}

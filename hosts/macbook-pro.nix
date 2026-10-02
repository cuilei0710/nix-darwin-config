{ ... }:

let
  deviceName = "MacBook Pro";
in
{
  # Show this name in macOS sharing and system settings.
  networking.computerName = "Lei's MacBook Pro";

  # Use this hostname on the local network.
  networking.hostName = "Leis-MacBook-Pro";

  # Allow Touch ID authentication for sudo on this MacBook.
  security.pam.services.sudo_local.touchIdAuth = true;

  # Include the device name in the Git author identity.
  home-manager.extraSpecialArgs = {
    inherit deviceName;
  };
}

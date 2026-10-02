{ ... }:

let
  deviceName = "Mac mini";
in
{
  # Show this name in macOS sharing and system settings.
  networking.computerName = "Lei's Mac mini";

  # Use this hostname on the local network.
  networking.hostName = "Leis-Mac-mini";

  # Include the device name in the Git author identity.
  home-manager.extraSpecialArgs = {
    inherit deviceName;
  };
}

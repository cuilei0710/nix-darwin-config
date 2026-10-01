{ ... }:

let
  deviceName = "Mac mini";
in
{
  # Pass the device name to Home Manager modules.
  home-manager.extraSpecialArgs = {
    inherit deviceName;
  };

  # Set the platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Set the user-friendly computer name.
  networking.computerName = "Lei's Mac mini";

  # Set the system hostname.
  networking.hostName = "Leis-Mac-mini";
}

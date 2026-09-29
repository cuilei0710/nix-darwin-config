{ ... }:

{
  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Enable Touch ID for sudo.
  security.pam.services.sudo_local.touchIdAuth = true;
}

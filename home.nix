{ pkgs, inputs, ... }:

let
  # Use Nixpkgs unstable for selected packages.
  unstable = import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;

    # Allow unfree packages from Nixpkgs unstable.
    config.allowUnfree = true;
  };
in
{

  imports = [
    ./modules/programs/git.nix
    ./modules/programs/zsh.nix
    ./modules/programs/vim.nix
  ];

  # This value determines the Home Manager release that the configuration
  # is compatible with. You can update Home Manager without changing it.
  home.stateVersion = "26.05";

  # Packages installed in the user profile.
  home.packages = with pkgs; [
    nixd
    nixfmt

    # Use unstable packages explicitly when needed.
    unstable.mole-cleaner
  ];

}

{ pkgs, ... }:

{
  # Load the user programs managed by Home Manager.
  imports = [
    ./modules/programs/git.nix
    ./modules/programs/vim.nix
    ./modules/programs/zsh.nix
  ];

  # Install these tools in the user's profile on both Macs.
  home.packages = with pkgs; [
    gh
    nixd
    nixfmt

    # Select this package from unstable; the others use the stable release.
    unstable.mole-cleaner
  ];

  # Keep this at the Home Manager release used for the initial setup.
  # Changing it can alter compatibility defaults; it does not upgrade packages.
  home.stateVersion = "26.05";
}

{ pkgs, ... }:

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

    gh

    # Use unstable packages explicitly when needed.
    unstable.mole-cleaner
  ];

}

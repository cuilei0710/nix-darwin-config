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
  # This value determines the Home Manager release that the configuration
  # is compatible with. You can update Home Manager without changing it.
  home.stateVersion = "26.05";

  # Packages installed in the user profile.
  home.packages = with pkgs; [
    vim
    gh

    nil
    nixd

    # Use unstable packages explicitly when needed.
    unstable.mole-cleaner
  ];

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Penelope Liones";
        email = "cuilei0710@qq.com";
      };

      init.defaultBranch = "main";
      core.autocrlf = "input";
    };
  };

  programs.zsh = {
    enable = true;

    history = {
      size = 3000;
      save = 2000;
    };

    initContent = ''
      PROMPT='%F{green}%1~%f > '
    '';
  };
}

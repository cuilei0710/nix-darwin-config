{ pkgs, ... }:

{
  programs.vim = {
    # Install Vim through Home Manager.
    enable = true;

    # Use the standard configurable Vim package.
    packageConfigurable = pkgs.vim;
  };
}

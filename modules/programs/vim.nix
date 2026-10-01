{ pkgs, ... }:

{
  programs.vim = {
    # Enable Vim.
    enable = true;

    # Use the standard Vim package.
    packageConfigurable = pkgs.vim;
  };
}

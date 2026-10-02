{ ... }:

{
  programs.zsh = {
    # Manage the user's Zsh configuration through Home Manager.
    enable = true;

    # Keep the same number of entries in memory and on disk.
    history = {
      size = 500;
      save = 500;
    };

    # Show the current directory in a green prompt.
    initContent = ''
      PROMPT='%F{green}%1~%f> '
    '';
  };
}

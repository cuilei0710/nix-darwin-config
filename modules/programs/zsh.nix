{ ... }:

{
  programs.zsh = {
    # Enable Zsh.
    enable = true;

    # Configure command history.
    history = {
      size = 500;
      save = 500;
    };

    # Set the shell prompt.
    initContent = ''
      PROMPT='%F{green}%1~%f> '
    '';
  };
}

{ deviceName, ... }:

{
  programs.git = {
    # Manage Git and its user configuration through Home Manager.
    enable = true;

    settings = {
      # Convert CRLF to LF on commit and leave checkout files unchanged.
      core.autocrlf = "input";

      # Name new repositories' first branch main.
      init.defaultBranch = "main";

      # Identify commits by the machine that created them.
      user = {
        email = "cuilei0710@qq.com";
        name = "Penelope Liones (${deviceName})";
      };
    };
  };
}

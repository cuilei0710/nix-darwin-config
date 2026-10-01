{ ... }:

{
  programs.git = {
    # Enable Git.
    enable = true;

    settings = {
      # Set the Git author identity.
      user = {
        name = "Penelope Liones";
        email = "cuilei0710@qq.com";
      };

      # Use main as the default branch name.
      init.defaultBranch = "main";

      # Convert CRLF to LF when committing.
      core.autocrlf = "input";
    };
  };
}

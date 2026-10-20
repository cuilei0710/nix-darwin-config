{ deviceName, ... }:

{
  programs.git = {
    # Manage Git and its user configuration through Home Manager.
    enable = true;

    settings = {
      # Normalize line endings and display non-ASCII filenames.
      core = {
        autocrlf = "input";
        quotepath = false;
      };

      # Name new repositories' first branch main.
      init.defaultBranch = "main";

      # Identify commits by the machine that created them.
      user = {
        email = "cuilei0710@qq.com";
        name = "Penelope Liones (${deviceName})";
      };

      # Remove stale remote-tracking branches.
      fetch.prune = true;

      # Track files larger than 10 MB with git-annex.
      annex = {
        largefiles = "largerthan=10mb";
      };
    };
  };
}

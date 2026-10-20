{ ... }:

{
  programs.zed-editor = {
    # Manage Zed's configuration through Home Manager.
    enable = true;

    # Allow Zed to modify settings managed by Home Manager.
    mutableUserSettings = true;

    # Automatically install the required Zed extensions.
    extensions = [
      "deno"
      "dockerfile"
      "git-firefly"
      "ini"
      "jetbrains-icons"
      "jetbrains-themes"
      "nix"
      "typescript-snippets"
      "ssh-config"
    ];

    userSettings = {
      # Disable AI, automatic updates, and telemetry.
      proxy = "";
      disable_ai = true;
      auto_update = false;

      telemetry = {
        diagnostics = false;
        metrics = false;
        anthropic_retention = false;
      };

      # Configure startup, autosave, and formatting behavior.
      restore_on_startup = "launchpad";
      autosave = "on_window_change";
      format_on_save = "modifications_if_available";

      # Configure editor appearance and inline hints.
      colorize_brackets = true;
      rounded_selection = false;
      ui_font_size = 16;
      buffer_font_size = 15;

      inlay_hints = {
        show_background = false;
        show_type_hints = true;
      };

      indent_guides = { };
      gutter = { };
      tabs = { };

      # Simplify the tab bar and navigation controls.
      tab_bar = {
        show_nav_history_buttons = false;
        show_pinned_tabs_in_separate_row = true;
        show_tab_bar_buttons = true;
      };

      # Hide unnecessary toolbar actions.
      toolbar = {
        breadcrumbs = false;
        quick_actions = false;
      };

      # Simplify the window title bar.
      title_bar = {
        show_user_picture = false;
        show_user_menu = false;
        show_sign_in = false;
        show_branch_name = false;
      };

      status_bar = {
        cursor_position_button = false;
      };

      # Keep the project panel on the left.
      project_panel = {
        hide_root = true;
        dock = "left";
        hide_gitignore = true;

        scrollbar = {
          horizontal_scroll = false;
        };
      };

      # Keep Git and outline panels on the left.
      git_panel = {
        dock = "left";
      };

      outline_panel = {
        dock = "left";
      };

      collaboration_panel = {
        button = false;
      };

      # Configure terminal appearance and indicators.
      terminal = {
        toolbar = { };
        show_count_badge = true;
      };

      # Hide secondary panel buttons.
      search = {
        button = false;
      };

      diagnostics = {
        button = false;
        inline = { };
      };

      debugger = { };

      # Disable the built-in task runner.
      tasks = {
        enabled = false;
      };

      session = { };

      # Follow system appearance with JetBrains themes.
      theme = {
        mode = "system";
        light = "JetBrains Islands Light";
        dark = "JetBrains Islands Dark";
      };

      # Use JetBrains file icons.
      icon_theme = {
        mode = "system";
        light = "JetBrains Icons Light";
        dark = "JetBrains Icons Dark";
      };

      # Enable Deno language server support.
      lsp = {
        deno = {
          settings = {
            deno = {
              enable = true;
            };
          };
        };
      };

      # Configure language servers and formatters.
      languages = {
        # Use Deno instead of TypeScript and ESLint language servers.
        JavaScript = {
          language_servers = [
            "deno"
            "!typescript-language-server"
            "!vtsls"
            "!eslint"
          ];

          formatter = "language_server";
        };

        TypeScript = {
          language_servers = [
            "deno"
            "!typescript-language-server"
            "!vtsls"
            "!eslint"
          ];

          formatter = "language_server";
        };

        TSX = {
          language_servers = [
            "deno"
            "!typescript-language-server"
            "!vtsls"
            "!eslint"
          ];

          formatter = "language_server";
        };

        # Use nixd for language support and nixfmt for formatting.
        Nix = {
          language_servers = [
            "nixd"
            "!nil"
          ];

          formatter = {
            external = {
              command = "nixfmt";
              arguments = [ ];
            };
          };
        };
      };
    };
  };
}
